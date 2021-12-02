<?php declare(strict_types=1);

/*
 * This file is part of the Monolog package.
 *
 * (c) Jordi Boggiano <j.boggiano@seld.be>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Monolog\Handler;

use Monolog\Formatter\LineFormatter;
use Monolog\Formatter\FormatterInterface;
use Monolog\Logger;
use Raven_Client;

/**
 * Handler to send messages to a Sentry (https://github.com/getsentry/sentry) server
 * using sentry-php (https://github.com/getsentry/sentry-php)
 *
 * @author Marc Abramowitz <marc@marc-abramowitz.com>
 */
class RavenHandler extends AbstractProcessingHandler
{
    /**
     * Translates Monolog log levels to Raven log levels.
     */
    protected $logLevels = [
        Logger::DEBUG     => Raven_Client::DEBUG,
        Logger::INFO      => Raven_Client::INFO,
        Logger::NOTICE    => Raven_Client::INFO,
        Logger::WARNING   => Raven_Client::WARNING,
        Logger::ERROR     => Raven_Client::ERROR,
        Logger::CRITICAL  => Raven_Client::FATAL,
        Logger::ALERT     => Raven_Client::FATAL,
        Logger::EMERGENCY => Raven_Client::FATAL,
    ];

    /**
     * @var string the current application environment (staging|preprod|prod)
     */
    protected $environment;

    /**
     * @var string should represent the current version of the calling
     *             software. Can be any string (git commit, version number)
     */
    protected $release;

    /**
     * @var Raven_Client the client object that sends the message to the server
     */
    protected $ravenClient;

    /**
     * @var LineFormatter The formatter to use for the logs generated via handleBatch()
     */
    protected $batchFormatter;

    /**
     * @param Raven_Client $ravenClient
     * @param int          $level       The minimum logging level at which this handler will be triggered
     * @param bool         $bubble      Whether the messages that are handled can bubble up the stack or not
     */
    public function __construct(Raven_Client $ravenClient, $level = Logger::DEBUG, bool $bubble = true)
    {
        parent::__construct($level, $bubble);

        $this->ravenClient = $ravenClient;
    }

    /**
     * {@inheritdoc}
     */
    public function handleBatch(array $records): void
    {
        $level = $this->level;

        // filter records based on their level
        $records = array_filter($records, function ($record) use ($level) {
            return $record['level'] >= $level;
        });

        if (!$records) {
            return;
        }

        // the record with the highest severity is the "main" one
        $record = array_reduce($records, function ($highest, $record) {
            if ($record['level'] > $highest['level']) {
                return $record;
            }

            return $highest;
        });

        // the other ones are added as a context item
        $logs = [];
        foreach ($records as $r) {
            $logs[] = $this->processRecord($r);
        }

        if ($logs) {
            $record['context']['logs'] = (string) $this->getBatchFormatter()->formatBatch($logs);
        }

        $this->handle($record);
    }

    /**
     * Sets the formatter for the logs generated by handleBatch().
     *
     * @param FormatterInterface $formatter
     */
    public function setBatchFormatter(FormatterInterface $formatter): self
    {
        $this->batchFormatter = $formatter;

        return $this;
    }

    /**
     * Gets the formatter for the logs generated by handleBatch().
     */
    public function getBatchFormatter(): FormatterInterface
    {
        if (!$this->batchFormatter) {
            $this->batchFormatter = $this->getDefaultBatchFormatter();
        }

        return $this->batchFormatter;
    }

    /**
     * {@inheritdoc}
     * @suppress PhanTypeMismatchArgument
     */
    protected function write(array $record): void
    {
        /** @var bool|null|array This is false, unless set below to null or an array of data, when we read the current user context */
        $previousUserContext = false;
        $options = [];
        $options['level'] = $this->logLevels[$record['level']];
        $options['tags'] = [];
        if (!empty($record['extra']['tags'])) {
            $options['tags'] = array_merge($options['tags'], $record['extra']['tags']);
            unset($record['extra']['tags']);
        }
        if (!empty($record['context']['tags'])) {
            $options['tags'] = array_merge($options['tags'], $record['context']['tags']);
            unset($record['context']['tags']);
        }
        if (!empty($record['context']['fingerprint'])) {
            $options['fingerprint'] = $record['context']['fingerprint'];
            unset($record['context']['fingerprint']);
        }
        if (!empty($record['context']['logger'])) {
            $options['logger'] = $record['context']['logger'];
            unset($record['context']['logger']);
        } else {
            $options['logger'] = $record['channel'];
        }
        foreach ($this->getExtraParameters() as $key) {
            foreach (['extra', 'context'] as $source) {
                if (!empty($record[$source][$key])) {
                    $options[$key] = $record[$source][$key];
                    unset($record[$source][$key]);
                }
            }
        }
        if (!empty($record['context'])) {
            $options['extra']['context'] = $record['context'];
            if (!empty($record['context']['user'])) {
                $previousUserContext = $this->ravenClient->context->user;
                $this->ravenClient->user_context($record['context']['user']);
                unset($options['extra']['context']['user']);
            }
        }
        if (!empty($record['extra'])) {
            $options['extra']['extra'] = $record['extra'];
        }

        if (!empty($this->environment) && !isset($options['environment'])) {
            $options['environment'] = $this->environment;
        }

        if (!empty($this->release) && !isset($options['release'])) {
            $options['release'] = $this->release;
        }

        if (isset($record['context']['exception']) && $record['context']['exception'] instanceof \Throwable) {
            $options['message'] = $record['formatted'];
            $this->ravenClient->captureException($record['context']['exception'], $options);
        } else {
            $this->ravenClient->captureMessage($record['formatted'], [], $options);
        }

        // restore the user context if it was modified
        if (!is_bool($previousUserContext)) {
            $this->ravenClient->user_context($previousUserContext, false);
        }
    }

    /**
     * {@inheritDoc}
     */
    protected function getDefaultFormatter(): FormatterInterface
    {
        return new LineFormatter('[%channel%] %message%');
    }

    /**
     * Gets the default formatter for the logs generated by handleBatch().
     *
     * @return FormatterInterface
     */
    protected function getDefaultBatchFormatter(): FormatterInterface
    {
        return new LineFormatter();
    }

    /**
     * Gets extra parameters supported by Raven that can be found in "extra" and "context"
     *
     * @return array
     */
    protected function getExtraParameters(): array
    {
        return ['contexts', 'checksum', 'release', 'environment', 'event_id'];
    }

    /**
     * @param  string $value
     * @return self
     */
    public function setRelease($value): self
    {
        $this->release = $value;

        return $this;
    }

    public function setEnvironment($value): self
    {
        $this->environment = $value;

        return $this;
    }

    /**
     * @link https://docs.sentry.io/learn/breadcrumbs/
     */
    public function addBreadcrumb(array $crumb): self
    {
        $this->ravenClient->breadcrumbs->record($crumb);

        return $this;
    }

    public function resetBreadcrumbs(): self
    {
        $this->ravenClient->breadcrumbs->reset();

        return $this;
    }
}