-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2021-10-29 04:56:58
-- 服务器版本： 10.1.38-MariaDB
-- PHP 版本： 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `rh_edu`
--

-- --------------------------------------------------------

--
-- 表的结构 `rh_admin`
--

CREATE TABLE `rh_admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL COMMENT '登录ip',
  `login_time` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(255) DEFAULT NULL,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `tid` int(11) NOT NULL DEFAULT '0' COMMENT '教师id',
  `ucid` int(11) DEFAULT '3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

--
-- 转存表中的数据 `rh_admin`
--

INSERT INTO `rh_admin` (`id`, `username`, `password`, `ip`, `login_time`, `nickname`, `uniacid`, `create_time`, `update_time`, `state`, `tid`, `ucid`) VALUES
(1, 'admin', 'fc1d65c8e32d6e7ab4e76ecc873d95d0', '192.168.124.23', 1635401982, 'admin', 0, 0, 1635401982, 0, 1, 3);

-- --------------------------------------------------------

--
-- 表的结构 `rh_article`
--

CREATE TABLE `rh_article` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '文章标题',
  `short_title` varchar(255) DEFAULT NULL COMMENT '文章短标题',
  `summary` varchar(255) DEFAULT NULL COMMENT '文章摘要',
  `image` int(11) NOT NULL DEFAULT '0' COMMENT '文章标题图片',
  `reading_volume` int(11) NOT NULL DEFAULT '0' COMMENT '文章阅读量',
  `content` text COMMENT '正文内容',
  `is_hidden` int(11) NOT NULL DEFAULT '0' COMMENT '隐藏',
  `is_tui` int(11) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文章表';

--
-- 转存表中的数据 `rh_article`
--

INSERT INTO `rh_article` (`id`, `title`, `short_title`, `summary`, `image`, `reading_volume`, `content`, `is_hidden`, `is_tui`, `create_time`, `update_time`, `delete_time`, `type`, `ucid`) VALUES
(3, '33311', '文章短标题', '党的十九届五中全会是我们党在全面建。。。。。。', 3, 62, '<p>&quot;</p><p style=\"margin-top: 23px; margin-bottom: 0px; padding: 0px; text-align: justify; font-size: 14px; line-height: 38px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; white-space: normal;\">本报讯 商务部发布的数据显示，2020年1-11月中国对外非金融类直接投资6593.6亿元(折合950.8亿美元)，同比下降3.1%。对外承包工程新签合同额13828.2亿元（折合1994亿美元），同比下降3.7%；完成营业额8349.6亿元（折合1204亿美元），同比下降10.2%。对外劳务合作派出各类劳务人员25.5万人，11月末在外各类劳务人员63.5万人。</p><p style=\"margin-top: 23px; margin-bottom: 0px; padding: 0px; text-align: justify; font-size: 14px; line-height: 38px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; white-space: normal;\">　　统计显示，1-11月中国对“一带一路”沿线国家非金融类直接投资159.6亿美元，同比增长24.9%，占同期总额的16.8%，比上年提升3.9个百分点。在沿线国家新签承包工程合同额1143.8亿美元，完成营业额708.7亿美元，分别占同期总额的57.4%和58.9%。 （姚文）</p><center style=\"font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; white-space: normal;\"><table align=\"center\" width=\"40%\"><tbody><tr class=\"firstRow\"></tr></tbody></table></center><p>(责编：赵安妮(实习生)、李栋)</p><p><br/></p><p>&quot;</p>', 0, 0, 1970, 1619764647, 1619764647, 0, NULL),
(7, '让乡村振兴的“里子”更充实', '文章短标题', '　日前，浙江杭州临安区青山湖街道召开新闻发布会，全面招募“乡村运营师”。', 6, 76, '<p style=\"margin-top: 23px; margin-bottom: 0px; padding: 0px; text-align: justify; font-size: 14px; line-height: 38px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; white-space: normal;\">　日前，浙江杭州临安区青山湖街道召开新闻发布会，全面招募“乡村运营师”。来自青山湖街道洪村村、郎家村、孝村村、白水涧村、研里村、朱村村6个村的村书记，共同签署了“乡村运营师招商服务承诺书”，以保障“乡村运营师”团队在村里更好地开展运营工作。</p><p style=\"margin-top: 23px; margin-bottom: 0px; padding: 0px; text-align: justify; font-size: 14px; line-height: 38px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; white-space: normal;\">　　近年来，通过美丽乡村建设，青山湖街道各个村庄面貌焕然一新，但乡村“面子”美了，“里子”还需充实，产业如何植入、乡村振兴如何实现，这些问题始终困扰着几位村书记。</p><p style=\"margin-top: 23px; margin-bottom: 0px; padding: 0px; text-align: justify; font-size: 14px; line-height: 38px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; white-space: normal;\">　　2017年年初，临安首次提出“村落景区”概念，同年5月，临安进一步提出“村落景区运营”概念，并开始探索市场化运营模式，致力于与爱乡村、会策划、懂营销的团队开展合作，让村落资源发挥市场化效应，将乡村资源优势、生态优势转化为经济优势、发展优势，让美丽村庄也有美丽经济。</p><p style=\"margin-top: 23px; margin-bottom: 0px; padding: 0px; text-align: justify; font-size: 14px; line-height: 38px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; white-space: normal;\">　　3年间，在乡村文旅运营方面，临安做了许多积极探索和实践。目前，已有14家村落景区与运营商签约合作，完成落户项目53个，项目总投资达5.2亿元。3年来，12个村落景区共吸引返乡青年100余人，各类手工匠人参与业态运营96个，增加村民就业岗位200余个。临安村落景区市场化运营的创新举措，引起全国各地的广泛关注，不少地方学习“临安模式”，开始推广实施乡村市场化运营。</p><p style=\"margin-top: 23px; margin-bottom: 0px; padding: 0px; text-align: justify; font-size: 14px; line-height: 38px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; white-space: normal;\">　　如今，招引市场化主体来进行村落景区整体运营的“临安模式”再度完善升级。青山湖街道“乡村运营师”开启全面招募。此次招聘的乡村运营师需与村集体自愿签约，双方以资源资产使用权或资金入股组建运营公司，青山湖街道将主要负责村落景区的基础设施建设，运营由乡村运营师团队负责，收益按照公司股份分成。这些村落将借助乡村运营师之手丰富新产品、发展新业态、注入新理念，通过市场化运营，增强村落景区的旅游吸引力以及市场竞争力，实现整村产业融合发展目标。</p><p style=\"margin-top: 23px; margin-bottom: 0px; padding: 0px; text-align: justify; font-size: 14\npx; line-height: 38px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; white-space: normal;\">　　在临安区文旅局副局长陈伟洪看来，一支优秀的乡村运营师队伍应当具备以下五个能力：第一，要有运营策划能力；第二，要有优质文旅资源可以导入乡村；第三，要能组建平台，将乡村资源盘活；第四，要有乡村理想，热爱乡村；第五，要有工匠精神，能深耕乡村。“乡村运营不单是乡村旅游，更是乡村振兴的一个有效路径。”陈伟洪说。</p><p>(责编：孟植良、任一林)</p><p><br/></p>', 0, 1, 1616807876, 1626506490, 0, 0, NULL),
(8, '全面建设社会主义现代化国家高质量供给来自哪里 ', '文章短标题', '党的十九届五中全会是我们党在全面建。。。。。。', 8, 32, '<p>&quot;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px; line-height: 14px; color: rgb(51, 51, 51); font-family: SimSun; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">寒潮下的天津港，气温接近零下10摄氏度。在天津港码头，总能看到引航员在寒风中脚踩摇晃的软梯登上十几米高的船舶甲板，引航一艘艘巨轮穿梭于天津港航道之上。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: SimSun; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">我国规定对外籍船舶进出实施强制引航。国外船只进出天津港时，由于航道复杂，必须由熟悉航道走向和港池水深的引航员上船“代驾”，并指挥调配拖轮协助船只安全靠离码头。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: SimSun; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">引航工作不分昼夜且风险性高，最危险的环节往往发生在登船时。在冬日里，引航员们常常冒着寒风从直升机上垂直降落在船舶甲板上或“踩着”浪花沿着十几米高的引航软梯攀登上船。“遇到恶劣天气时，船与拖轮间会因海浪有很高的落差，会给攀爬软梯带来很大困难，每次执行引航任务都要承受来自身体和心理的巨大压力。”在天津港引航17年的高级引航员李占涛说。指挥几十万吨的巨轮以厘米级的速度精准靠岸，考验的不止是知识和经验，更考验着他们的生理极限。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: SimSun; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">天津港是繁忙的世界级大港，即使在寒冬时节，进出天津港码头的航道上，船舶依然川流不息。天津港引航中心作为天津港的唯一引航机构，共有136名引航员。元旦假期期间，天津港引航中心超过50名引航员坚守在引航岗位上。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 10px 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: SimSun; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-indent: 2em;\">一年365天，引航员们伴着星光，脚踩浪花，在雾中守候，在风中靠泊，在引航梯上“攀岩”，为天津港建设世界一流港口保驾护航。新华社发（孙凡越、赵子硕 摄）</p><p><br/></p><p>&quot;</p>', 0, 1, 1616807876, 1634866147, 0, 0, NULL),
(9, '全面建设社会主义现代化国家高质量供给来自哪里 ', '文章短标题', '党的十九届五中全会是我们党在全面建。。。。。。', 3, 14, '<p>编者按\n\n　　党的十九届五中全会是我们党在全面建成小康社会胜利在望、全面建设社会主义现代化国家新征程即将开启的重要历史时刻召开的一次十分重要的会议，全会通过的《中共中央关于制定国民经济和社会发展第十四个五年规划和二〇三五年远景目标的建议》（以下简称《建议》），是开启全面建设社会主义现代化国家新征程、向第二个百年奋斗目标进军的纲领性文件，是今后五年乃至更长时间中国经济社会发展的行动指南。为深入学习贯彻党的十九届五中全会精神，本报与广东省社会科学界联合会特邀我省优秀社会科学家，围绕推动高质量发展、加快构建新发展格局、全面推进乡村振兴、推进社会主义文化强国建设等重大问题撰写刊发一组理论文章，敬请垂注。\n\n　　我国即将跨入全面建设社会主义现代化国家的新阶段。这个新阶段的基本特征是高质量发展。高质量发展就是以高质量供给不断地满足人民群众的高品质需要。正因为如此，《建议》明确地把高质量发展和深化供给侧结构性改革作为我国“十四五”发展规划的主题主线。那么，高质量供给从哪里来？\n\n　　一是技术创新。我们现在使用的诸如智能手机、数码相机、智能玩具和电动飞行器等许多产品在几十年前都不曾见过。与人们生活密切相关的产品种类从上世纪80年代初期不足百种到现在多达上万种。即使是同一类产品，款式、品种、功能与档次等也是多种多样、琳琅满目，同时，每一种产品的功能不断更新，诸如食品越来越突出绿色、健康、卫生以及地方特色，手机从单纯打电话发展到集社交、支付、计算、门禁、网上阅读、听音乐、看电影以及网络阅读等众多功能于一体，许多家具企业从标准化的制造商转向了以定制化为主的服务商。显然，我们生活中发生的这些变化都是创新推动的结果。未来，新一轮科技革命与产业变革的快速进步将使生产与生活方式发生更深刻、更迅速的变化。习近平总书记在浦东开发开放30周年庆祝大会上指出：“科学技术从来没有像今天这样深刻影响着国家前途命运，从来没有像今天这样深刻影响着人民幸福安康。”在这个科技快速进步的时代，哪个企业能不断聚焦新产品、新技术与新模式，把创新作为第一动力，不断加大创新投入，它在激烈的市场竞争中就能抢占更多的市场份额。哪一个城市和地区能围绕着创新配置资源与布局产业，它们就会脱颖而出。\n\n　　二是工匠精神。工匠精神就是一种一丝不苟、精益求精的工作态度，孜孜不倦、精雕细琢的职业精神。一个企业要重视长期发展，懂得渐进变革，关注质量改进，就离不开工匠精神。因为提供高质量产品与服务的关键在于对细节的专注，在品质革命中，细节决定竞争力。当然，重视质量与品质并不是与生俱来的，而是在质量决定生存的环境中逼出来的。比如说，19世纪末期，“德国制造”被英国人当成是低质工业品的标签。二战后，“德国制造”逐步成为质量与稳定的代名词。到目前为止，德国人生产的工业制造品，大到挖地铁的掘进机，小到文具订书机，从质量上讲都称得上世界领先。之所以“德国制造”有这样的变化，就是因为德国企业自一战后就把产品质量看成是生存发展的命门，一方面由制造业的行业联盟制定很高的产品质量标准，引导企业按照高标准生产以质量提高竞争力；另一方面形成了通过企业与客户互动、促进企业开发符合客户特定需要产品的机制。这种机制使客户可以识别质量的差距，也使竞争对手难以轻易复制。在走向创新型社会中，工匠精神与创新是相互促进的，发扬工匠精神既有利于企业通过精益求精发现许多创新的机会，也有利于新创出来的产品功能不断完善。\n\n　　三是循环效率。高质量发展不仅体现在某一种产品与服务上，还体现在生产、流通、分配、消费等环节构成的经济运行与联系上。经济学理论表明，企业将资金配置到采购、生产与销售等三个环节，从而发生了资本从货币形态转向实物与产品形态再转向货币形态的变化过程。如果每个环节占用的资金少、周转快，那么，资金的循环效率就较高。如果采购与销售中的交易成本与运输成本都较高，产品积压较多，资金周转缓慢，那么，资金的循环效率就较低。提高资金循环效率是企业提高资金配置效率的重要领域，如果资金周转缓慢，循环效率偏低，企业采购原材料与提供产品与服务的及时性、精准性与有效性都会受到影响，高质量供给也无从谈起。宏观经济是建立在微观经济活动基础上的，如果微观的资金循环效率不高，那么，宏观经济运行也会受到影响，这将迫使宏观经济环境进一步优化，交易成本与运输成本大幅度降低，从而为微观经济活动提供更好的软硬件服务。2013—2019年间，我国社会物流总费用占GDP的比重从17.3%降至14.1%，还高于世界平均水平3个百分点。这表明，我国在降低交易成本与运输成本等方面还有较大潜力。这需要在高质量发展新阶段，加大体制改革力度，打通制约产品、要素流动的各种障碍，消除地方壁垒，从而为企业提供更高质量、更低成本的公共设施网络与服务体系。\n\n　　四是制度供给。高水平的制度供给是高质量供给中的重要组成部分，也是高质量产品与服务供给的重要支撑。推动高水平的制度供给可从三方面入手。第一，提供的制度要与国际先进的技术与质量标准相衔接、与国际通行的营商惯例相适应。高质量供给是在更开放条件下推进的，更开放的制度供给的特征是规则等制度型开放。这需要统一内外资法律法规，完善公开、透明的涉外法律体系，全面实行准入前国民待遇加负面清单管理制度，持续放宽市场准入，尊重国际营商惯例，保护外资企业合法权益。第二，市场体系建设要体现高标准要求。诸如推进营商环境向市场化、国际化与法治化等国际一流方向迈进，加快自由贸易试验区先行先试的经验做法向更大范围内复制与推广，打通部门之间、地区之间的信息孤岛，扩大市场环境中政策规则的区域一体化进程，推进更大区域内形成高效规范、公平竞争的统一市场。第三，内外贸一体化体系要加快形成。《建议》强调：“促进内外贸法律规则、监管体系、经营资质、质量标准、检测检疫、认证认可等相衔接，推进同线同标同质。”这是充分利用两个市场、两种资源，形成国内国际双循环的关键。哪些省市和地区在这些方面能率先推进，那么，它在国内国际双循环的新发展格局中就能先走一步。（广东省第二届优秀社会科学家、广东省社会科学院教授 王珺）</p>', 0, 0, 1616807876, 1634805350, 0, 0, NULL),
(10, '文章标题', '文章短标题', '文章摘要', 7, 5, '<p>文章内容</p>', 0, 0, 2021, 1635225765, 1635225765, 0, NULL),
(11, '123123', '123123', '12312312', 0, 1, '<p>12312312321323213123123</p>', 0, 0, 1618369948, 1619764317, 1619764317, 0, NULL),
(12, '213123', '123', '123123', 0, 1, '<p>123123123123</p>', 0, 1, 1618370124, 1619764319, 1619764319, 0, NULL),
(13, '123', '123', '123', 0, 4, '<p>1231231231</p>', 0, 0, 1618386095, 1619083559, 1619083559, 0, NULL),
(14, '123WW', '123', '123', 0, 2, '<p>123123</p>', 0, 0, 1618386168, 1619083708, 1619083708, 0, NULL),
(15, '123GG', '123123', '13213', 4, 3, '<p>123</p>', 0, 0, 1618386271, 1619083554, 1619083554, 0, NULL),
(16, '全面建设社会主义现代化国家高质量供给来自哪里 ', '文章短标题', '党的十九届五中全会是我们党在全面建。。。。。。', 9, 11, '<p>&quot;</p><p style=\"margin-top: 23px; margin-bottom: 0px; padding: 0px; text-align: justify; font-size: 14px; line-height: 38px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; white-space: normal;\">本报讯 商务部发布的数据显示，2020年1-11月中国对外非金融类直接投资6593.6亿元(折合950.8亿美元)，同比下降3.1%。对外承包工程新签合同额13828.2亿元（折合1994亿美元），同比下降3.7%；完成营业额8349.6亿元（折合1204亿美元），同比下降10.2%。对外劳务合作派出各类劳务人员25.5万人，11月末在外各类劳务人员63.5万人。</p><p style=\"margin-top: 23px; margin-bottom: 0px; padding: 0px; text-align: justify; font-size: 14px; line-height: 38px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; white-space: normal;\">　　统计显示，1-11月中国对“一带一路”沿线国家非金融类直接投资159.6亿美元，同比增长24.9%，占同期总额的16.8%，比上年提升3.9个百分点。在沿线国家新签承包工程合同额1143.8亿美元，完成营业额708.7亿美元，分别占同期总额的57.4%和58.9%。 （姚文）</p><center style=\"font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; white-space: normal;\"><table align=\"center\" width=\"40%\"><tbody><tr class=\"firstRow\"></tr></tbody></table></center><p>(责编：赵安妮(实习生)、李栋)</p><p><br/></p><p>&quot;</p>', 0, 0, 1618814882, 1635225772, 0, 0, NULL),
(17, '学校相关', '学校相关', '学校相关', 3, 18, '<p style=\"box-sizing: border-box; transition: none 0s ease 0s; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: inherit; color: rgb(90, 90, 90); vertical-align: baseline; white-space: normal;\">&nbsp;&nbsp;<span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">黔西南布依族苗族自治州兴义第一中学，简称兴义一中（</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">Xingyi No.1 High School</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">），是贵州省最早成立的公立学校之一，前身是创办于清代乾隆年间（</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">1736-1795</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">）的兴义笔山书院，</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">1905</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">年升格为高等小学堂，</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">1926</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">年定名为县立兴义中学。</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">1982</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">年，黔西南布依族苗族自治州成立，学校更名为黔西南州兴义一中。</span></p><p style=\"box-sizing: border-box; transition: none 0s ease 0s; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: inherit; color: rgb(90, 90, 90); vertical-align: baseline; white-space: normal; text-indent: 28px;\"><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">兴义一中是贵州省首批重点中学，省级一类示范性高中。近年来荣获全国文明校园，全国教育系统先进集体，全国国防教育先进单位，全国中小学心理健康教育特色学校，全国五好小公民主题教育活动示范校，全国足球特色学校，全国学校体育工作示范校，贵州省文明单位，贵州省首批校本研修示范校，贵州省绿色学校，贵州省高中新课改优秀学校，贵州省青少年科技特色学校，贵州省中小学（幼儿园）教师专业发展示范基地校等荣誉称号。</span></p><p style=\"box-sizing: border-box; transition: none 0s ease 0s; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: inherit; color: rgb(90, 90, 90); vertical-align: baseline; white-space: normal; text-indent: 28px;\"><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">&nbsp;</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">校园面积</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">204</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">亩，教学占地面积</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">167</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">亩，布局合理，功能设施齐备，环境优美，学校现有</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">75</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">个班，在校生</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">3719</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">人。现有教职工</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">342</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">人（专任教师</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">326</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">人）。其中，正高级教师</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">11</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">人，高级教师</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">118</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">人，一级教师</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">133</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">人；黔西南州优秀科技人才</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">4</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">人，黔西南州骨干教师</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">50</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">人，黔西南州级名师</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">27</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">人；省级骨干教师</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">22</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">人，省级名师</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">10</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">人，特级教师</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">13</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">人，国家万人计划教学名师</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">1</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">人。留学英国的英语教师</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">9</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">人，贵州省名校长工作室</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">1</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">个，贵州省名师工作室</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">6</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">个，州级工作室</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">5</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">个。近五年来，受国家、省、州表彰的优秀教师、班主任等有</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">100</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">多人。</span></p><p style=\"box-sizing: border-box; transition: none 0s ease 0s; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: inherit; color: rgb(90, 90, 90); vertical-align: baseline; white-space: normal; text-indent: 28px;\"><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">兴义一中传承创新，凝炼并实施“双主体互动式”课堂教学改革，教育教学质量大幅跃升。继</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">2005</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">年罗远航同学获全省理科第一名后，</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">2020</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">届黄阿想同学勇夺全省文科第一名。本届高三年级</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">1169</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">人参考，</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">1029</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">人上一本线，上线率</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">88.02%</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">，比</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">2019</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">年提升了</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">9.42%</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">，其中有</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">5</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">个班的一本上线率达到</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">100%</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">；一、二本上线人数</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">1162</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">人，上线率</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">99.40%</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">，</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">600</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">分以上人数</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">201</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">人；册望班</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">45</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">人参考，</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">600</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">分以上</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">5</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">人，一本线上线</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">41</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">人，上线率</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">91.11%</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">，比</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">2019</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">年提升了</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">4.11%</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">，一、二本上线</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">45</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">人，上线率</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">100%</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">。</span>&nbsp;<span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">为全州</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">2020</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">年高考质量的再提高做出了贡献。</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">&nbsp;&nbsp;&nbsp;</span></p><p style=\"box-sizing: border-box; transition: none 0s ease 0s; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: inherit; color: rgb(90, 90, 90); vertical-align: baseline; white-space: normal; text-indent: 28px;\"><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">兴义一中秉承</span>&nbsp;<span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">“勤慎笃敬”的校训和“为学生一生的成功奠基”，让教职工享受教育人生”的办学理念，以“健康的体格、健全的人格、良好的学业素养、基本的国际交往素养”为学生培养目标，构建了“面向社会、自主发展、诚信求实”的育人模式，形成了“乐学、善思、自主、善问”的良好学风和“传承创新、全面育人”的办学特色。基本实现了教学设施标准化、教育管理规范化、教育思想现代化、学生素质优良化、学校办学特色化的办学目标。</span></p><p style=\"box-sizing: border-box; transition: none 0s ease 0s; margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: inherit; color: rgb(90, 90, 90); vertical-align: baseline; white-space: normal; text-indent: 28px;\"><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">辛勤耕耘，结出累累硕果；夙愿浇灌，勃发气象万千。兴义一中与时俱进，为国家培养合格人才，已向全国各所高校输送了四十多名清华北大在内的上万名大学生。兴义一中将始终坚持大教育思想，以提高教育教学质量为核心，坚持质量强校、文化立校、管理治校、名师扬校、科研兴校战略；坚持改革，构建特色管理体系；继承弘扬</span>&nbsp;<span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">“韬光养晦、厚积薄发、负重前行、默默奉献”的兴义一中精神，奋力建设和谐奋进的学校文化，形成书院文化</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">+</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">少数民族文化</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: Calibri; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">+</span><span style=\"box-sizing: border-box; transition: none 0s ease 0s; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-family: 宋体; font-size: inherit; line-height: inherit; color: inherit; vertical-align: baseline;\">现代科学文化的特色学校文化，复兴兴义一中文化教育品牌，为把兴义一中办成黔滇桂区域性特色名校奠定基础。</span></p><p><br/></p>', 0, 0, 1970, 1619148365, 0, 1, NULL),
(18, '123YYTT', '123TT', '123TT', 6, 2, '<p>123123123123TT</p>', 0, 0, 2021, 1618983191, 1618983191, 0, NULL),
(19, 'asd', 'asd', 'asd', 0, 2, '<p>asd</p>', 0, 0, 2021, 1619146931, 1619146931, 1, NULL),
(20, '隐私相关', '隐私相关', '隐私相关', 0, 7, '<p><melo-data data-src=\"{&quot;mainAtext&quot;:&quot;{\\&quot;atext\\&quot;:{\\&quot;attribs\\&quot;:\\&quot;*0*1*2*3+8*4*5*6*7*8*9*a*b*0*1+1*0*1*2*3+g*4*5*6*7*8*9*a*b*0*1*2*3+1*0*1*2*3+g*4*5*6*7*8*9*a*b*0*1*2*3+1*0*1*2*3+5*c*5*6*7*8*9*a*b*0*1*2*3+1*0*1*2*3+hj*4*5*6*7*8*9*a*b*0*1*2*3+1\\&quot;,\\&quot;text\\&quot;:\\&quot;如花商城隐私政策\\\\n最近更新日期:2020年1月1日\\\\n版本生效日期:2020年1月1日\\\\n提示条款:\\\\n您的信任对如花商城(我们)非常重要，我们深知个人信 息对您的重要性，我们非常重视用户的隐私和个人信息保 护。您在下载、安装、开启、浏览、注册、登录、使用(以下统称“使用”)我们的产品与/或服务时，我们可 能会收集和使用您的相关信息，我们亦将按法律法规要 求，采取相应安全保护措施，尽力保护您上述个人信息安 全可控。我们希望通过《如花商城隐私政策》(“本隐私 政策”)向您说明我们在您使用我们的产品与/或服务时 如何收集、使用、保存、共享和转让这些信息，以及我们 为您提供的访问、更新、删除和保护这些信息的方式。 本隐私政策与您所使用的如花商城服务以及该服务所包括 的各种业务功能(以下统称“我们的产品与/或服务”) 息息相关，希望您在使用我们的产品与/或服务前仔细阅 读并确认您已经充分理解本政策所写明的内容，并让您可 以按照本隐私政策的指引做出您认为适当的选择。您使用 或在我们更新本隐私政策后(我们会及时提示您更新的情 况)继续使用我们的产品与/或服务，即意味着您同意本 隐私政策(含更新版本)内容，并且同意我们按照本隐私政 策收集、使用、保存和共享您的相关信息。 需要特别说明的是，本政策不适用于其他第三方向您提供 的服务，也不适用于如花商城中已另行独立设置隐私权政 策的产品或服务。例如如花商城上的卖家依托如花商城向 您提供服务时，您向卖家提供的个人信息不适用本政策。 如对本隐私政策或相关事宜有任何问题，您可随时通过我 们提供的各种联系方式与我们联系。\\\\n\\&quot;},\\&quot;apool\\&quot;:{\\&quot;numToAttrib\\&quot;:{\\&quot;0\\&quot;:[\\&quot;author\\&quot;,\\&quot;p.51703921\\&quot;],\\&quot;1\\&quot;:[\\&quot;font-family\\&quot;,\\&quot;微软雅黑\\&quot;],\\&quot;2\\&quot;:[\\&quot;font-size\\&quot;,\\&quot;15pt\\&quot;],\\&quot;3\\&quot;:[\\&quot;color\\&quot;,\\&quot;#000000\\&quot;],\\&quot;4\\&quot;:[\\&quot;textalign\\&quot;,\\&quot;justify\\&quot;],\\&quot;5\\&quot;:[\\&quot;pap-specialIndent\\&quot;,\\&quot;26pt\\&quot;],\\&quot;6\\&quot;:[\\&quot;pap-line\\&quot;,\\&quot;15pt\\&quot;],\\&quot;7\\&quot;:[\\&quot;pap-line-rule\\&quot;,\\&quot;exact\\&quot;],\\&quot;8\\&quot;:[\\&quot;pap-spacing-before\\&quot;,\\&quot;2pt\\&quot;],\\&quot;9\\&quot;:[\\&quot;pap-spacing-after\\&quot;,\\&quot;0pt\\&quot;],\\&quot;10\\&quot;:[\\&quot;pap-stylesheet-name\\&quot;,\\&quot;normal\\&quot;],\\&quot;11\\&quot;:[\\&quot;snapToGrid\\&quot;,\\&quot;0\\&quot;],\\&quot;12\\&quot;:[\\&quot;textalign\\&quot;,\\&quot;left\\&quot;]},\\&quot;nextNum\\&quot;:13}}&quot;,&quot;storyAtexts&quot;:[],&quot;srcGlobalPadId&quot;:&quot;300000000$JUCgcKbUKQKA&quot;}\" data-version=\"2.1.0\"></melo-data></p><p class=\"paragraph text-align-type-justify pap-line-15pt pap-line-rule-exact pap-spacing-before-2pt pap-spacing-after-0pt pap-firstline-indent-26pt\" style=\"text-align:justify;line-height:20px;margin-top:2.6666666666666665px;margin-bottom:0px;text-indent:34.666666666666664px\"><span style=\"font-size: 16px;\"><span style=\"font-family: 微软雅黑, -apple-system, &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; letter-spacing: 0pt; vertical-align: baseline;\">如花商城隐私政策</span><span style=\"font-family: 微软雅黑, -apple-system, &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; letter-spacing: 0pt; vertical-align: baseline;\"></span></span></p><p class=\"paragraph text-align-type-justify pap-line-15pt pap-line-rule-exact pap-spacing-before-2pt pap-spacing-after-0pt pap-firstline-indent-26pt\" style=\"text-align:justify;line-height:20px;margin-top:2.6666666666666665px;margin-bottom:0px;text-indent:34.666666666666664px\"><span style=\"font-size: 15pt; font-family: 微软雅黑, -apple-system, &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; letter-spacing: 0pt; vertical-align: baseline;\">最近更新日期:2020年1月1日</span></p><p class=\"paragraph text-align-type-justify pap-line-15pt pap-line-rule-exact pap-spacing-before-2pt pap-spacing-after-0pt pap-firstline-indent-26pt\" style=\"text-align:justify;line-height:20px;margin-top:2.6666666666666665px;margin-bottom:0px;text-indent:34.666666666666664px\"><span style=\"font-size: 15pt; font-family: 微软雅黑, -apple-system, &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; letter-spacing: 0pt; vertical-align: baseline;\">版本生效日期:2020年1月1日</span></p><p class=\"paragraph text-align-type-left pap-line-15pt pap-line-rule-exact pap-spacing-before-2pt pap-spacing-after-0pt pap-firstline-indent-26pt\" style=\"line-height: 20px; margin-top: 2.66667px; margin-bottom: 0px; text-indent: 34.6667px;\"><span style=\"font-size: 15pt; font-family: 微软雅黑, -apple-system, &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; letter-spacing: 0pt; vertical-align: baseline;\">提示条款:</span></p><p class=\"paragraph text-align-type-justify pap-line-15pt pap-line-rule-exact pap-spacing-before-2pt pap-spacing-after-0pt pap-firstline-indent-26pt\" style=\"text-align:justify;line-height:20px;margin-top:2.6666666666666665px;margin-bottom:0px;text-indent:34.666666666666664px\"><span style=\"font-family: 微软雅黑, -apple-system, &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; letter-spacing: 0pt; vertical-align: baseline; font-size: 16px;\">您的信任对如花商城(我们)非常重要，我们深知个人信 息对您的重要性，我们非常重视用户的隐私和个人信息保 护。您在下载、安装、开启、浏览、注册、登录、使用(以下统称“使用”)我们的产品与/或服务时，我们可 能会收集和使用您的相关信息，我们亦将按法律法规要 求，采取相应安全保护措施，尽力保护您上述个人信息安 全可控。我们希望通过《如花商城隐私政策》(“本隐私 政策”)向您说明我们在您使用我们的产品与/或服务时 如何收集、使用、保存、共享和转让这些信息，以及我们 为您提供的访问、更新、删除和保护这些信息的方式。 本隐私政策与您所使用的如花商城服务以及该服务所包括 的各种业务功能(以下统称“我们的产品与/或服务”) 息息相关，希望您在使用我们的产品与/或服务前仔细阅 读并确认您已经充分理解本政策所写明的内容，并让您可 以按照本隐私政策的指引做出您认为适当的选择。您使用 或在我们更新本隐私政策后(我们会及时提示您更新的情 况)继续使用我们的产品与/或服务，即意味着您同意本 隐私政策(含更新版本)内容，并且同意我们按照本隐私政 策收集、使用、保存和共享您的相关信息。 需要特别说明的是，本政策不适用于其他第三方向您提供 的服务，也不适用于如花商城中已另行独立设置隐私权政 策的产品或服务。例如如花商城上的卖家依托如花商城向 您提供服务时，您向卖家提供的个人信息不适用本政策。 如对本隐私政策或相关事宜有任何问题，您可随时通过我 们提供的各种联系方式与我们联系。</span><span style=\"font-size: 15pt; font-family: 微软雅黑, -apple-system, &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; letter-spacing: 0pt; vertical-align: baseline;\"></span></p><p><br/></p>', 0, 0, 2021, 1635405676, 0, 1, NULL),
(21, '123', '123', '123', 6, 0, '<p>123123123</p>', 0, 0, 1619163730, 1619226693, 1619226693, 0, NULL),
(22, '321', '321', '321', 6, 2, '<p>123</p>', 0, 1, 1619163744, 1619226691, 1619226691, 0, NULL),
(23, 'qweqwe', 'qwe', 'asd', 6, 1, '<p>asd</p>', 0, 0, 2021, 1619226682, 1619226682, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `rh_auth_group`
--

CREATE TABLE `rh_auth_group` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `title` char(255) NOT NULL DEFAULT '''\\''\\''''',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` varchar(1000) NOT NULL DEFAULT '',
  `ucid` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- 转存表中的数据 `rh_auth_group`
--

INSERT INTO `rh_auth_group` (`id`, `title`, `status`, `rules`, `ucid`) VALUES
(1, '管理员', 1, '1,2,3,4,5,6,7,8,9,10,11,12,13', 0),
(2, '1232', 1, '106,14,22,26,48,113,29', 0),
(3, '超级管理员', 1, '102,96,103,2,3,28,99,104,5,38,39,40,41,105,35,36,37,106,14,22,26,48,107,23,24,49,50,51,108,13,100,109,58,59,60,110,25,27,31,101,111,19,68,69,72,112,20,21,61,62,63,64,65,113,29,114,30,32,33,34', 0);

-- --------------------------------------------------------

--
-- 表的结构 `rh_auth_group_access`
--

CREATE TABLE `rh_auth_group_access` (
  `aid` mediumint(8) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL,
  `ucid` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- 转存表中的数据 `rh_auth_group_access`
--

INSERT INTO `rh_auth_group_access` (`aid`, `group_id`, `ucid`) VALUES
(1, 3, NULL),
(5, 2, NULL),
(5, 2, NULL),
(6, 2, NULL),
(7, 2, NULL),
(8, 2, NULL),
(9, 2, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `rh_auth_rule`
--

CREATE TABLE `rh_auth_rule` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` char(80) DEFAULT NULL,
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `pid` int(1) NOT NULL DEFAULT '0',
  `condition` char(100) NOT NULL DEFAULT '',
  `brief` varchar(80) NOT NULL DEFAULT '',
  `ucid` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `rh_auth_rule`
--

INSERT INTO `rh_auth_rule` (`id`, `name`, `title`, `type`, `status`, `pid`, `condition`, `brief`, `ucid`) VALUES
(2, '/user/cms_get_teacher', '获取教师', 1, 1, 103, '', '', NULL),
(3, '/user/get_user', '获取所有用户', 1, 1, 103, '', '', NULL),
(5, '/article/get_delete_article', '获取回收站文章', 1, 1, 104, '', '', NULL),
(13, '/course/cms_get_course', '获取课程', 1, 1, 108, '', '', NULL),
(14, '/class/cms_get_class', '获取班级', 1, 1, 106, '', '', NULL),
(19, '/cms/get_config', '配置获取', 1, 1, 111, '', '', NULL),
(20, '/admins/createAdmin', '添加', 1, 1, 112, '', '', NULL),
(21, '/group/admin/createGroup', '添加分组', 1, 1, 112, '', '', NULL),
(22, '/class/edit_classes', '编辑班级', 1, 1, 106, '', '', NULL),
(23, '/course/edit_course', '编辑课程', 1, 1, 107, '', '', NULL),
(24, '/course/add_course', '添加课程', 1, 1, 107, '', '', NULL),
(25, '/student/change_class', '学生换班', 1, 1, 110, '', '', NULL),
(26, '/class/add_class', '添加班级', 1, 1, 106, '', '', NULL),
(27, '/student/add_student', '添加学生', 1, 1, 110, '', '', NULL),
(28, '/user/user_to_teacher', '添加教师', 1, 1, 103, '', '', NULL),
(29, '/plan/add_plan', '添加计划', 1, 1, 113, '', '', NULL),
(30, '/video/upload_video', '上传视频', 1, 1, 114, '', '', NULL),
(31, '/msg/get_change_msg', '获取换班日志', 1, 1, 110, '', '', NULL),
(32, '/image/upload_img', '图片上传', 1, 1, 114, '', '', NULL),
(33, '/image/delete_img', '删除图片', 1, 1, 114, '', '', NULL),
(34, '/video/delete_video', '删除视频', 1, 1, 114, '', '', NULL),
(35, '/banner/add_banner', '添加广告', 1, 1, 105, '', '', NULL),
(36, '/banner/edit_banner', '编辑广告', 1, 1, 105, '', '', NULL),
(37, '/banner/del_banner', '删除广告', 1, 1, 105, '', '', NULL),
(38, '/article/add_article', '添加文章', 1, 1, 104, '', '', NULL),
(39, '/article/edit_article', '编辑文章', 1, 1, 104, '', '', NULL),
(40, '/article/del_article', '删除文章', 1, 1, 104, '', '', NULL),
(41, '/article/recieve_article', '文章批量恢复', 1, 1, 104, '', '', NULL),
(48, '/class/del_classes', '删除班级', 1, 1, 106, '', '', NULL),
(49, '/project/add_project', '添加课程分类', 1, 1, 107, '', '', NULL),
(50, '/project/edit_project', '编辑课程分类', 1, 1, 107, '', '', NULL),
(51, '/project/del_project', '删除课程分类', 1, 1, 107, '', '', NULL),
(58, '/label/add_label', '添加标签', 1, 1, 109, '', '', NULL),
(59, '/label/update_label', '编辑标签', 1, 1, 109, '', '', NULL),
(60, '/label/delete_label', '删除标签', 1, 1, 109, '', '', NULL),
(61, '/admins/deleteAdmin', '删除管理员', 1, 1, 112, '', '', NULL),
(62, '/admins/update_admin', '编辑管理员', 1, 1, 112, '', '', NULL),
(63, '/group/admin/updateGroup', '编辑分组', 1, 1, 112, '', '', NULL),
(64, '/group/admin/deleteGroup', '删除分组', 1, 1, 112, '', '', NULL),
(65, '/group/admin/getGroupAll', '获取分组', 1, 1, 112, '', '', NULL),
(68, '/cms/update_sys', '更新配置', 1, 1, 111, '', '', NULL),
(69, '/gy/update_ys', '更新关于', 1, 1, 111, '', '', NULL),
(72, '/gy/update_Fw', '编辑服务', 1, 1, 111, '', '', NULL),
(99, '/user/del_teacher', '删除老师', 1, 1, 103, '', '', NULL),
(100, '/course/del_course', '删除课程', 1, 1, 108, '', '', NULL),
(101, '/student/del_student', '删除学生', 1, 1, 110, '', '', NULL),
(102, NULL, '首页', 1, 1, 0, '', 'home', NULL),
(103, NULL, '教师管理', 1, 1, 0, '', 'teacher', NULL),
(104, NULL, '文章管理', 1, 1, 0, '', 'article', NULL),
(105, NULL, '内容管理', 1, 1, 0, '', 'banner', NULL),
(106, NULL, '班级管理', 1, 1, 0, '', 'class_manage', NULL),
(107, NULL, '课程分类', 1, 1, 0, '', 'project', NULL),
(108, NULL, '课程管理', 1, 1, 0, '', 'course', NULL),
(109, NULL, '学生标签', 1, 1, 0, '', 'label', NULL),
(110, NULL, '学生管理', 1, 1, 0, '', 'student', NULL),
(111, NULL, '设置', 1, 1, 0, '', 'set', NULL),
(112, NULL, '管理员', 1, 1, 0, '', 'manage', NULL),
(113, NULL, '学习计划', 1, 1, 0, '', 'plan', NULL),
(114, NULL, '资源管理', 1, 1, 0, '', 'resources', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `rh_banner`
--

CREATE TABLE `rh_banner` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `img_id` int(11) NOT NULL DEFAULT '0' COMMENT '图片id',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0普通轮播图1跳转到文章、2跳转到优秀教师、3跳转到课程',
  `jump_id` int(11) NOT NULL DEFAULT '0' COMMENT '跳转id',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='轮播图';

--
-- 转存表中的数据 `rh_banner`
--

INSERT INTO `rh_banner` (`id`, `name`, `img_id`, `type`, `jump_id`, `sort`, `create_time`, `update_time`, `ucid`) VALUES
(22, 'sas', 10, 0, 0, 0, 1634709897, 1634710199, NULL),
(23, '12', 11, 0, 0, 0, 1634709939, 1634709994, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `rh_bind_teacher`
--

CREATE TABLE `rh_bind_teacher` (
  `id` int(11) NOT NULL,
  `mobile` varchar(255) DEFAULT NULL COMMENT '电话号码',
  `uid` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='教师绑定号码表';

-- --------------------------------------------------------

--
-- 表的结构 `rh_card_number`
--

CREATE TABLE `rh_card_number` (
  `id` int(11) NOT NULL,
  `num` varchar(255) DEFAULT NULL COMMENT '卡密',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '使用状态0待使用1已使用',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `ucid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='卡密表';

--
-- 转存表中的数据 `rh_card_number`
--

INSERT INTO `rh_card_number` (`id`, `num`, `money`, `state`, `create_time`, `update_time`, `ucid`) VALUES
(2, 'jRD16S237U61qc988w9Bk8k293', '9.00', 0, 1623718923, 1623719034, NULL),
(3, 'H21w623KT718HU9Du56ZXuLf23', '10.00', 0, 1623718923, 1623718923, NULL),
(4, '162j337Yb1saOBu89yodW2O2c3', '10.00', 0, 1623718923, 1623718923, NULL),
(5, 'U1O6m2dC3m718sIeMwt9wzkr23', '10.00', 0, 1623718923, 1623718923, NULL),
(6, '4cV1tB66253d71CN8iDT9s2qP3', '10.00', 0, 1623718923, 1623718923, NULL),
(7, 'QmAFC16e23iwu718XvGCfG9N23', '10.00', 0, 1623718923, 1623718923, NULL),
(8, '13r262gwhX37D818CxU9x12SF3', '10.00', 0, 1623718923, 1623718923, NULL),
(9, 'r1tec6lv2M3etQ71tdJ1892P13', '10.00', 0, 1623718923, 1623718923, NULL),
(10, '516t23xe77s1z684JCz4S9D2k3', '10.00', 0, 1623718923, 1623718923, NULL),
(11, '16Yx20UT46eLq5701y7F88nyA8', '10.00', 0, 1624601888, 1624601888, NULL),
(12, 'd1nzxmPBM62tQtq46o018u4899', '50.00', 0, 1624601899, 1624601899, NULL),
(13, '7162bxrV4z76019uR8chZi9ym9', '50.00', 0, 1624601899, 1624601899, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `rh_category`
--

CREATE TABLE `rh_category` (
  `category_id` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL DEFAULT '' COMMENT '栏目标题',
  `short_name` varchar(50) NOT NULL DEFAULT '' COMMENT '栏目描述',
  `type` varchar(20) NOT NULL COMMENT '类型list列表cover封面',
  `pid` int(11) NOT NULL DEFAULT '0',
  `level` tinyint(4) NOT NULL DEFAULT '0',
  `is_visible` int(11) NOT NULL DEFAULT '1' COMMENT '是否显示  1 显示 0 不显示',
  `sort` int(11) DEFAULT NULL,
  `category_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '商品分类图片',
  `template` varchar(255) NOT NULL COMMENT '模板',
  `seotitle` varchar(80) NOT NULL COMMENT 'seo标题',
  `keyword` varchar(80) NOT NULL COMMENT '关键字',
  `is_jump` int(11) NOT NULL COMMENT '是否跳转',
  `jumpaddress` varchar(255) NOT NULL COMMENT '跳转地址',
  `json` text,
  `content` text NOT NULL COMMENT '封面内容',
  `is_phone_index` int(11) NOT NULL COMMENT '是否手机端首页显示0否1是',
  `is_pc_index` int(11) NOT NULL DEFAULT '0' COMMENT '是否pc首页显示0否1是',
  `delete_time` int(11) DEFAULT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  `is_tui_index` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品分类表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `rh_category`
--

INSERT INTO `rh_category` (`category_id`, `uniacid`, `category_name`, `short_name`, `type`, `pid`, `level`, `is_visible`, `sort`, `category_pic`, `template`, `seotitle`, `keyword`, `is_jump`, `jumpaddress`, `json`, `content`, `is_phone_index`, `is_pc_index`, `delete_time`, `value`, `is_tui_index`, `ucid`) VALUES
(1, 0, '教师', '', 'teacher', 0, 1, 1, 1, 'http://192.168.124.16:8092/uploads/img/20210710/e2001862fe9fed7b44062bf1f9c39e13.jpg', '', '', '', 0, '', '[]', '', 0, 0, 1625896952, 0, 0, NULL),
(2, 0, '新闻', '', 'new', 0, 1, 1, 2, 'http://192.168.124.16:8092/uploads/img/20210430/4432d34d5fe166bb0d6d913aa0f3549a.jpg', '', '', '', 0, '', '[]', '', 0, 0, NULL, 0, 0, NULL),
(3, 0, '课程', '', 'course', 0, 1, 1, 0, 'http://192.168.124.16:8092/uploads/img/20210710/f08cb5aad520cae5005596d00ae124d6.png', '', '', '', 0, '', '[]', '', 0, 0, 1625896612, 0, 0, NULL),
(4, 0, '123', '', 'new', 0, 1, 1, 0, 'http://192.168.124.16:8092/uploads/img/20210430/4432d34d5fe166bb0d6d913aa0f3549a.jpg', '', '', '', 0, '', '\"\"', '', 0, 0, 1625896853, 0, 0, NULL),
(5, 0, '课程', '', 'course', 0, 1, 1, 0, 'http://192.168.124.16:8092/uploads/img/20210710/f08cb5aad520cae5005596d00ae124d6.png', '', '', '', 0, '', '[]', '', 0, 0, NULL, 0, 0, NULL),
(6, 0, '教师', '', 'teacher', 0, 1, 1, 0, 'http://192.168.124.16:8092/uploads/img/20210430/631a48c82733801f120373be436ad531.jpg', '', '', '', 0, '', '\"\"', '', 0, 0, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `rh_classes`
--

CREATE TABLE `rh_classes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '班级名称',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `course` int(11) NOT NULL DEFAULT '0' COMMENT '课程id',
  `plan_date` text COMMENT '开课日期',
  `classroom` varchar(255) DEFAULT NULL COMMENT '教室',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '10',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='班级表';

--
-- 转存表中的数据 `rh_classes`
--

INSERT INTO `rh_classes` (`id`, `name`, `create_time`, `update_time`, `start_time`, `end_time`, `course`, `plan_date`, `classroom`, `num`, `delete_time`, `ucid`) VALUES
(1, '舞蹈提升班', 1619765812, 1620268609, 1619798400, 1622390400, 2, '[\"2021-05-01\"]', '205教室', 20, 0, 0),
(2, '武术班', 1619766275, 1620267761, 1619625600, 1622390400, 1, '[\"2021-05-01\"]', '体操房', 50, 0, 0),
(3, '武术提升班', 1619766367, 1620264214, 1619798400, 1622390400, 1, '[\"2021-05-01\",\"2021-05-01\",\"2021-05-02\"]', '123', 20, 0, 0),
(4, 'qwe', 1619766580, 1620351740, 1619107200, 1619798400, 1, NULL, '123', 0, 1620351740, 0),
(5, '体能强化班', 1620267985, 1634867337, 1619798400, 1622390400, 1, '[\"\"]', '306教室', 20, 0, 0),
(6, '体能提升班', 1620268072, 1620351747, 1620316800, 1622390400, 3, '', '306教室', 20, 1620351747, 0),
(7, 'asd', 1620268180, 1620351732, 1620921600, 1622390400, 3, NULL, '', 0, 1620351732, 0),
(8, '音乐班', 1620350629, 1620351729, 1620662400, 1623859200, 3, NULL, '98989', 25, 1620351729, 0),
(9, '音乐2班', 1620350806, 1620351726, 1620057600, 1624982400, 2, NULL, '236', 99, 1620351726, 0),
(10, 'java基础培训班', 1620353061, 1635148941, 1622476800, 1624982400, 3, '[\"2021-06-01\",\"2021-06-01\",\"2021-06-02\",\"2021-05-03\",\"2021-07-12\",\"2021-07-13\",\"2021-07-14\"]', '505教室', 30, 0, 0),
(11, '123', 1635148846, 1635148846, 1637596800, 1638201600, 4, NULL, '123', 12, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `rh_class_project`
--

CREATE TABLE `rh_class_project` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL DEFAULT '0',
  `pid` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='班级科目表';

-- --------------------------------------------------------

--
-- 表的结构 `rh_class_stu`
--

CREATE TABLE `rh_class_stu` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='班级学生表';

--
-- 转存表中的数据 `rh_class_stu`
--

INSERT INTO `rh_class_stu` (`id`, `cid`, `uid`, `ucid`) VALUES
(1, 1, 10, NULL),
(2, 1, 9, NULL),
(3, 1, 8, NULL),
(4, 1, 4, NULL),
(5, 2, 12, NULL),
(6, 2, 11, NULL),
(7, 2, 10, NULL),
(8, 2, 9, NULL),
(9, 3, 10, NULL),
(10, 3, 9, NULL),
(11, 3, 8, NULL),
(12, 3, 4, NULL),
(17, 5, 10, NULL),
(18, 5, 9, NULL),
(19, 5, 8, NULL),
(20, 5, 4, NULL),
(23, 3, 11, NULL),
(24, 1, 11, NULL),
(33, 10, 12, NULL),
(34, 10, 5, NULL),
(35, 10, 8, NULL),
(36, 10, 11, NULL),
(37, 11, 12, NULL),
(38, 11, 11, NULL),
(39, 11, 10, NULL),
(40, 11, 9, NULL),
(41, 11, 8, NULL),
(42, 11, 7, NULL),
(43, 11, 6, NULL),
(44, 11, 5, NULL),
(45, 11, 4, NULL),
(46, 11, 1, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `rh_class_teacher`
--

CREATE TABLE `rh_class_teacher` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT '课程id',
  `tid` int(11) NOT NULL DEFAULT '0' COMMENT '教师id',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `course_id` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='教师班级绑定表';

--
-- 转存表中的数据 `rh_class_teacher`
--

INSERT INTO `rh_class_teacher` (`id`, `cid`, `tid`, `create_time`, `update_time`, `course_id`, `ucid`) VALUES
(3, 2, 1, 1619766275, 1619766275, 1, 0),
(6, 4, 3, 1619766580, 1619766580, 1, 0),
(11, 5, 3, 1620267985, 1620267985, 1, 0),
(12, 6, 3, 1620268072, 1620268072, 3, 0),
(13, 7, 3, 1620268180, 1620268180, 3, 0),
(14, 3, 3, 1620269674, 1620269674, 1, 0),
(15, 3, 1, 1620269674, 1620269674, 1, 0),
(16, 1, 2, 1620269684, 1620269684, 2, 0),
(17, 1, 1, 1620269684, 1620269684, 2, 0),
(18, 8, 3, 1620350629, 1620350629, 3, 0),
(19, 9, 2, 1620350806, 1620350806, 2, 0),
(26, 11, 3, 1635148846, 1635148846, 4, 0),
(27, 10, 2, 1635148942, 1635148942, 3, 0),
(28, 10, 1, 1635148942, 1635148942, 3, 0);

-- --------------------------------------------------------

--
-- 表的结构 `rh_course`
--

CREATE TABLE `rh_course` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '课程名称',
  `image` int(11) NOT NULL DEFAULT '0' COMMENT '课程封面图片',
  `play` int(11) NOT NULL DEFAULT '0' COMMENT '播放量',
  `content` text COMMENT '详细介绍',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '课程价格',
  `market_price` decimal(10,2) DEFAULT NULL COMMENT '市场价格',
  `teacher` int(11) NOT NULL DEFAULT '0' COMMENT '授课老师',
  `is_down` int(11) NOT NULL DEFAULT '0' COMMENT '是否下架',
  `is_tui` int(11) NOT NULL DEFAULT '0' COMMENT '推荐',
  `project` int(11) NOT NULL DEFAULT '0' COMMENT '课程分类',
  `yj` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '分享佣金',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `url` int(11) NOT NULL DEFAULT '0' COMMENT '视频连接',
  `buy` int(11) NOT NULL DEFAULT '0' COMMENT '购买开启',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  `url_name` varchar(255) DEFAULT NULL,
  `total_num` int(11) NOT NULL DEFAULT '100' COMMENT '总人数',
  `now_num` int(11) NOT NULL DEFAULT '0' COMMENT '50',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='视频课程表';

--
-- 转存表中的数据 `rh_course`
--

INSERT INTO `rh_course` (`id`, `name`, `image`, `play`, `content`, `price`, `market_price`, `teacher`, `is_down`, `is_tui`, `project`, `yj`, `sort`, `create_time`, `update_time`, `url`, `buy`, `delete_time`, `url_name`, `total_num`, `now_num`, `ucid`) VALUES
(1, '中华武术太极拳', 4, 0, '<p><img src=\"http://192.168.124.14:8092//ue_upload/img/20210430/1619764888.png\" style=\"\" title=\"1619764888.png\"/></p><p><img src=\"http://192.168.124.14:8092//ue_upload/img/20210430/1619764888.png\" style=\"\" title=\"1619764888.png\"/></p><p><br/></p>', '399.00', '0.00', 0, 0, 0, 3, '40.00', 0, 1619764896, 1634893418, 1, 1, 1634893418, 'CCTV.mp4', 100, 0, 0),
(2, '舞蹈提升课程', 5, 0, '<p><img src=\"http://192.168.124.14:8092//ue_upload/img/20210506/1620265445.png\" style=\"\" title=\"1620265445.png\"/></p><p><img src=\"http://192.168.124.14:8092//ue_upload/img/20210506/1620265445.png\" style=\"\" title=\"1620265445.png\"/></p><p><br/></p>', '199.00', '0.00', 0, 0, 0, 5, '1.00', 0, 1620265448, 1634893414, 0, 1, 1634893414, '', 100, 0, 0),
(3, '体能提升强化课', 11, 0, '<p>强生健体，保家卫国</p><p><br/></p>', '300.00', '0.00', 0, 0, 1, 3, '20.00', 0, 1620268028, 1634804437, 0, 1, 0, '', 100, 0, 0),
(4, '思维开阔基础java课', 10, 0, '<p><img src=\"http://192.168.124.23:8099//ue_upload/img/20211022/1634866162227228.png\" title=\"1634866162227228.png\" alt=\"QQ截图20211021104949.png\"/>课程介绍<br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p>baici</p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p>duidui</p>', '288.00', '0.00', 0, 0, 1, 8, '20.00', 0, 1620352974, 1634893523, 0, 1, 0, '', 100, 0, 0),
(5, '123', 10, 0, '<p>123<br/></p>', '0.00', '0.00', 0, 0, 0, 5, '0.00', 0, 1635150433, 1635150433, 0, 1, 0, '', 100, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `rh_course_teacher`
--

CREATE TABLE `rh_course_teacher` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL DEFAULT '0',
  `tid` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='教师课程关联表';

--
-- 转存表中的数据 `rh_course_teacher`
--

INSERT INTO `rh_course_teacher` (`id`, `course_id`, `tid`, `create_time`, `update_time`, `ucid`) VALUES
(13, 3, 3, 1634804437, 1634804437, 0),
(15, 4, 3, 1634893523, 1634893523, 0),
(16, 5, 2, 1635150433, 1635150433, 0);

-- --------------------------------------------------------

--
-- 表的结构 `rh_experience`
--

CREATE TABLE `rh_experience` (
  `id` int(11) NOT NULL,
  `certificate` text COMMENT '教师资质',
  `experience` text COMMENT '教师经验',
  `content` text COMMENT '教师特点',
  `json` text COMMENT '其它备用字段',
  `uid` int(11) NOT NULL DEFAULT '0',
  `infor` text COMMENT '教师简介',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `mobile` varchar(20) DEFAULT '0' COMMENT '电话号码',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='教师资质表';

-- --------------------------------------------------------

--
-- 表的结构 `rh_fx`
--

CREATE TABLE `rh_fx` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(20) DEFAULT NULL COMMENT '电话',
  `infor` text COMMENT '简介',
  `tid` int(11) NOT NULL DEFAULT '0' COMMENT '老师',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `child` varchar(20) DEFAULT NULL COMMENT '孩子',
  `sex` int(11) NOT NULL DEFAULT '0',
  `age` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分销表';

-- --------------------------------------------------------

--
-- 表的结构 `rh_image`
--

CREATE TABLE `rh_image` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL COMMENT '图片路径',
  `from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 来自本地，2 来自公网',
  `use_name` varchar(80) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '图片分类',
  `is_visible` int(11) NOT NULL DEFAULT '1' COMMENT '是否能显示1能0不能',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='图片总表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `rh_image`
--

INSERT INTO `rh_image` (`id`, `url`, `from`, `use_name`, `category_id`, `is_visible`, `delete_time`, `update_time`, `ucid`) VALUES
(10, '/uploads/img/20211020/2b92ed9615f664bf731ff1cb3338a5ad.jpeg', 1, '0', 0, 1, 0, 0, 0),
(11, '/uploads/img/20211020/3ad2d4d40953caf076f7f42aab6c8a13.jpeg', 1, '0', 0, 1, 0, 0, 0),
(12, '/uploads/img/20211022/01930ec62912d1af2cf630486c8c2586.png', 1, '0', 0, 1, 0, 0, 0),
(13, '/uploads/img/20211022/861278be87d368ace9ca5a87febd2205.png', 1, '0', 0, 1, 0, 0, 0),
(14, '/uploads/img/20211026/207cfffe74d0623e82108e78937f2275.jpg', 1, '0', 0, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `rh_image_category`
--

CREATE TABLE `rh_image_category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `is_visible` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='图片分类表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `rh_kids`
--

CREATE TABLE `rh_kids` (
  `id` int(11) NOT NULL,
  `name` varchar(10) DEFAULT NULL COMMENT '姓名',
  `sex` int(11) NOT NULL DEFAULT '0' COMMENT '性别',
  `age` int(11) NOT NULL DEFAULT '0' COMMENT '年龄',
  `person` int(11) NOT NULL DEFAULT '0' COMMENT '家长',
  `uid` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学生表';

-- --------------------------------------------------------

--
-- 表的结构 `rh_message`
--

CREATE TABLE `rh_message` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  `content` varchar(255) DEFAULT NULL COMMENT '留言内容',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '日期',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0请假1反馈2报名',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `read` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='留言表';

--
-- 转存表中的数据 `rh_message`
--

INSERT INTO `rh_message` (`id`, `uid`, `content`, `time`, `type`, `create_time`, `update_time`, `read`, `ucid`) VALUES
(2, 5, '重感冒，需要请假', 1620489600, 0, 1620269335, 1626245607, 1, 0),
(3, 2, '重感冒，要请假', 1620835200, 0, 1620269454, 1626245635, 1, 0),
(4, 11, '啊实打实的', 0, 1, 1626154442, 1626154442, 0, 0),
(5, 11, '啊实打实的', 1626192000, 0, 1626154565, 1626245612, 1, 0),
(6, 11, '阿斯顿', 0, 1, 1626154588, 1626154588, 0, 0),
(7, 2, '好，很好，非常好，越来越好！', 0, 1, 1626311787, 1626311787, 0, 0),
(8, 8, '请假一天', 1635177600, 0, 1635228000, 1635228000, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `rh_msg`
--

CREATE TABLE `rh_msg` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0分销记录1价格修改记录3换班',
  `content` text COMMENT '修改内容',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `value` decimal(10,2) NOT NULL DEFAULT '0.00',
  `read` int(11) NOT NULL DEFAULT '0' COMMENT '阅读',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='日志';

--
-- 转存表中的数据 `rh_msg`
--

INSERT INTO `rh_msg` (`id`, `uid`, `type`, `content`, `create_time`, `update_time`, `value`, `read`, `ucid`) VALUES
(1, 4, 3, '李小小A 加入中华武术班', 1619765812, 1619765812, '0.00', 0, 0),
(2, 8, 3, '李小虎 加入中华武术班', 1619765812, 1619765812, '0.00', 0, 0),
(3, 9, 3, '李小A 加入中华武术班', 1619765812, 1619765812, '0.00', 0, 0),
(4, 10, 3, '李小小 加入中华武术班', 1619765812, 1619765812, '0.00', 0, 0),
(5, 9, 3, '李小A 加入武术班', 1619766275, 1619766275, '0.00', 0, 0),
(6, 10, 3, '李小小 加入武术班', 1619766275, 1619766275, '0.00', 0, 0),
(7, 11, 3, '小明A 加入武术班', 1619766275, 1619766275, '0.00', 0, 0),
(8, 12, 3, '张小花 加入武术班', 1619766275, 1619766275, '0.00', 0, 0),
(9, 4, 3, '李小小A 加入武术', 1619766367, 1619766367, '0.00', 0, 0),
(10, 8, 3, '李小虎 加入武术', 1619766367, 1619766367, '0.00', 0, 0),
(11, 9, 3, '李小A 加入武术', 1619766367, 1619766367, '0.00', 0, 0),
(12, 10, 3, '李小小 加入武术', 1619766367, 1619766367, '0.00', 0, 0),
(13, 4, 3, '李小小A 加入qwe', 1619766581, 1619766581, '0.00', 0, 0),
(14, 8, 3, '李小虎 加入qwe', 1619766581, 1619766581, '0.00', 0, 0),
(15, 9, 3, '李小A 加入qwe', 1619766581, 1619766581, '0.00', 0, 0),
(16, 10, 3, '李小小 加入qwe', 1619766581, 1619766581, '0.00', 0, 0),
(17, 4, 3, '李小小A 加入体能强化班', 1620267985, 1620267985, '0.00', 0, 0),
(18, 8, 3, '李小虎 加入体能强化班', 1620267985, 1620267985, '0.00', 0, 0),
(19, 9, 3, '李小A 加入体能强化班', 1620267985, 1620267985, '0.00', 0, 0),
(20, 10, 3, '李小小 加入体能强化班', 1620267985, 1620267985, '0.00', 0, 0),
(21, 9, 3, '李小A 加入体能提升班', 1620268072, 1620268072, '0.00', 0, 0),
(22, 10, 3, '李小小 加入体能提升班', 1620268072, 1620268072, '0.00', 0, 0),
(23, 1, 3, '张小花C 加入音乐班', 1620350629, 1620350629, '0.00', 0, 0),
(24, 6, 3, '张小花B 加入音乐班', 1620350629, 1620350629, '0.00', 0, 0),
(25, 7, 3, '张小花A 加入音乐班', 1620350629, 1620350629, '0.00', 0, 0),
(26, 12, 3, '张小花 加入音乐班', 1620350629, 1620350629, '0.00', 0, 0),
(27, 4, 3, '李小小A 加入音乐2班', 1620350806, 1620350806, '0.00', 0, 0),
(28, 8, 3, '李小虎 加入音乐2班', 1620350806, 1620350806, '0.00', 0, 0),
(29, 9, 3, '李小A 加入音乐2班', 1620350806, 1620350806, '0.00', 0, 0),
(30, 10, 3, '李小小 加入音乐2班', 1620350806, 1620350806, '0.00', 0, 0),
(31, 12, 3, '张小花 加入java基础培训班', 1620353061, 1620353061, '0.00', 0, 0),
(32, 1, 3, '张小花C 加入123', 1635148846, 1635148846, '0.00', 0, 0),
(33, 4, 3, '李小小A 加入123', 1635148846, 1635148846, '0.00', 0, 0),
(34, 5, 3, '小明 加入123', 1635148846, 1635148846, '0.00', 0, 0),
(35, 6, 3, '张小花B 加入123', 1635148846, 1635148846, '0.00', 0, 0),
(36, 7, 3, '张小花A 加入123', 1635148846, 1635148846, '0.00', 0, 0),
(37, 8, 3, '李小虎 加入123', 1635148846, 1635148846, '0.00', 0, 0),
(38, 9, 3, '李小A 加入123', 1635148846, 1635148846, '0.00', 0, 0),
(39, 10, 3, '李小小 加入123', 1635148846, 1635148846, '0.00', 0, 0),
(40, 11, 3, '小明A 加入123', 1635148846, 1635148846, '0.00', 0, 0),
(41, 12, 3, '张小花 加入123', 1635148846, 1635148846, '0.00', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `rh_order`
--

CREATE TABLE `rh_order` (
  `id` int(11) NOT NULL,
  `order_num` varchar(255) DEFAULT NULL COMMENT '订单编号',
  `course_id` int(11) NOT NULL DEFAULT '0' COMMENT '课程id',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '课程价格',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '最终价格',
  `pay_statement` int(11) NOT NULL DEFAULT '0' COMMENT '支付状态',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `prepay_id` varchar(255) DEFAULT NULL,
  `pay_time` int(11) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `fx_teacher` int(11) NOT NULL DEFAULT '0' COMMENT '分享教师',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  `payment_type` varchar(255) NOT NULL DEFAULT 'xcx' COMMENT '支付方式',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0普通下单1拼团',
  `item_id` int(11) NOT NULL DEFAULT '0' COMMENT '拼团id',
  `user_ip` varchar(255) DEFAULT NULL,
  `pt_state` int(11) NOT NULL DEFAULT '0',
  `is_captain` int(11) NOT NULL DEFAULT '0' COMMENT '是否团长',
  `card_id` int(11) NOT NULL DEFAULT '0' COMMENT '卡密',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '0正常1退款中2已退款3已驳回',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

--
-- 转存表中的数据 `rh_order`
--

INSERT INTO `rh_order` (`id`, `order_num`, `course_id`, `price`, `total_price`, `pay_statement`, `uid`, `prepay_id`, `pay_time`, `fx_teacher`, `create_time`, `update_time`, `delete_time`, `payment_type`, `type`, `item_id`, `user_ip`, `pt_state`, `is_captain`, `card_id`, `state`, `ucid`) VALUES
(9, 'P602991124782873', 0, '30.00', '30.00', 1, 2, NULL, 0, 0, 1622599112, 1622599112, 0, 'xcx', 0, 1, '0.0.0.0', 1, 1, 0, 0, 0),
(11, 'P702897775919070', 0, '30.00', '30.00', 0, 2, NULL, 0, 0, 1625189777, 1625189777, 0, 'xcx', 0, 5, '0.0.0.0', 1, 1, 0, 0, 0),
(15, 'C714251240795814', 1, '399.00', '399.00', 0, 2, NULL, 0, 0, 1626225124, 1626225124, 0, 'xcx', 0, 0, NULL, 0, 0, 0, 0, 0),
(16, 'C714252240565191', 1, '399.00', '399.00', 0, 2, NULL, 0, 0, 1626225223, 1626225224, 0, 'xcx', 0, 0, NULL, 0, 0, 0, 0, 0),
(17, 'C714539978230990', 1, '399.00', '399.00', 0, 2, NULL, 0, 0, 1626253997, 1626253997, 0, 'xcx', 0, 0, NULL, 0, 0, 0, 0, 0),
(18, 'C714540525781906', 1, '399.00', '399.00', 0, 2, NULL, 0, 0, 1626254052, 1626254052, 0, 'xcx', 0, 0, NULL, 0, 0, 0, 0, 0),
(19, 'C714544461375767', 4, '0.01', '0.01', 1, 2, NULL, 0, 0, 1626254162, 1626254446, 0, 'xcx', 0, 0, NULL, 0, 0, 0, 0, 0),
(20, 'C715141472651865', 1, '399.00', '399.00', 0, 2, NULL, 0, 0, 1626314147, 1626314147, 0, 'xcx', 0, 0, NULL, 0, 0, 0, 0, 0),
(21, 'C715141477353909', 1, '399.00', '399.00', 1, 2, NULL, 0, 0, 1626314147, 1626328556, 0, 'xcx', 0, 0, NULL, 0, 0, 0, 1, 0),
(22, 'C715177821580678', 1, '399.00', '399.00', 0, 2, NULL, 0, 0, 1626317782, 1626317782, 0, 'xcx', 0, 0, NULL, 0, 0, 0, 0, 0),
(23, 'C717034180606619', 1, '399.00', '399.00', 0, 6, NULL, 0, 0, 1626503418, 1626503418, 0, 'xcx', 0, 0, NULL, 0, 0, 0, 0, 0),
(24, 'C717060005539857', 1, '399.00', '399.00', 0, 6, NULL, 0, 0, 1626506000, 1626506000, 0, 'xcx', 0, 0, NULL, 0, 0, 0, 0, 0),
(25, 'C717060647541782', 1, '399.00', '399.00', 0, 6, NULL, 0, 0, 1626506064, 1626506064, 0, 'xcx', 0, 0, NULL, 0, 0, 0, 0, 0),
(26, 'C717062018953644', 3, '300.00', '300.00', 0, 6, NULL, 0, 0, 1626506201, 1626506201, 0, 'xcx', 0, 0, NULL, 0, 0, 0, 0, 0),
(27, 'C717062329045371', 3, '300.00', '300.00', 0, 6, NULL, 0, 0, 1626506232, 1626506232, 0, 'xcx', 0, 0, NULL, 0, 0, 0, 0, 0),
(28, 'C717064968007673', 3, '300.00', '300.00', 0, 6, NULL, 0, 0, 1626506496, 1626506496, 0, 'xcx', 0, 0, NULL, 0, 0, 0, 0, 0),
(29, 'CA21991278924071', 3, '300.00', '300.00', 0, 8, NULL, 0, 0, 1634799127, 1634799127, 0, 'xcx', 0, 0, NULL, 0, 0, 0, 0, 0),
(30, 'CA22706096286946', 4, '0.01', '0.01', 0, 8, NULL, 0, 0, 1634866566, 1634870609, 0, 'xcx', 0, 0, NULL, 0, 0, 0, 0, 0),
(31, 'CA25322200980477', 3, '300.00', '300.00', 0, 9, NULL, 0, 0, 1635132219, 1635132220, 0, 'xcx', 0, 0, NULL, 0, 0, 0, 0, 0),
(32, 'CA25322228584758', 3, '300.00', '300.00', 0, 9, NULL, 0, 0, 1635132221, 1635132222, 0, 'xcx', 0, 0, NULL, 0, 0, 0, 0, 0),
(33, 'CA25322228578101', 3, '300.00', '300.00', 0, 9, NULL, 0, 0, 1635132221, 1635132222, 0, 'xcx', 0, 0, NULL, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `rh_pingce`
--

CREATE TABLE `rh_pingce` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '学生id',
  `class_id` int(11) NOT NULL DEFAULT '0',
  `index` int(11) NOT NULL DEFAULT '0',
  `name` varchar(30) DEFAULT NULL COMMENT '姓名',
  `cyxx` int(11) NOT NULL DEFAULT '0' COMMENT '创意想象',
  `hmbx` int(11) NOT NULL DEFAULT '0' COMMENT '画面表现',
  `scgz` int(11) NOT NULL DEFAULT '0' COMMENT '色彩感知',
  `qgbd` int(11) NOT NULL DEFAULT '0' COMMENT '情感表达',
  `hhjq` int(11) NOT NULL DEFAULT '0' COMMENT '绘画技巧',
  `zzl` int(11) NOT NULL DEFAULT '0' COMMENT '专注力',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='教学评测表';

--
-- 转存表中的数据 `rh_pingce`
--

INSERT INTO `rh_pingce` (`id`, `uid`, `class_id`, `index`, `name`, `cyxx`, `hmbx`, `scgz`, `qgbd`, `hhjq`, `zzl`, `create_time`, `update_time`, `ucid`) VALUES
(1, 10, 3, 0, '李小小', 1, 1, 2, 0, 5, 99, 1619766977, 1619766977, 0),
(2, 9, 3, 0, '李小A', 2, 3, 10, 3, 9, 98, 1619766977, 1619766977, 0),
(3, 8, 3, 0, '李小虎', 3, 5, 18, 6, 13, 97, 1619766977, 1619766977, 0),
(4, 4, 3, 0, '李小小A', 4, 7, 26, 9, 17, 96, 1619766977, 1619766977, 0),
(5, 10, 3, 1, '李小小', 1, 1, 2, 0, 5, 50, 1619767013, 1619767013, 0),
(6, 9, 3, 1, '李小A', 25, 30, 10, 3, 9, 98, 1619767013, 1619767013, 0),
(7, 8, 3, 1, '李小虎', 3, 5, 18, 6, 13, 97, 1619767013, 1619767013, 0),
(8, 4, 3, 1, '李小小A', 4, 7, 26, 9, 17, 96, 1619767013, 1619767013, 0),
(9, 12, 10, 0, '张小花', 6, 8, 7, 9, 10, 12, 1620353424, 1620353424, 0),
(10, 8, 10, 0, '李小虎', 8, 6, 10, 10, 10, 12, 1620353424, 1620353424, 0),
(11, 5, 10, 0, '小明', 9, 7, 9, 12, 10, 12, 1620353424, 1620353424, 0),
(12, 12, 10, 1, '张小花', 7, 6, 5, 7, 12, 14, 1620353722, 1620353722, 0),
(13, 8, 10, 1, '李小虎', 9, 8, 11, 12, 11, 13, 1620353722, 1620353722, 0),
(14, 5, 10, 1, '小明', 10, 9, 6, 10, 10, 12, 1620353722, 1620353722, 0),
(15, 12, 10, 2, '张小花', 7, 6, 5, 7, 12, 14, 1620354082, 1620354082, 0),
(16, 8, 10, 2, '李小虎', 9, 8, 11, 12, 11, 13, 1620354082, 1620354082, 0),
(17, 5, 10, 2, '小明', 10, 9, 6, 10, 10, 12, 1620354082, 1620354082, 0),
(18, 11, 10, 2, '小明A', 11, 6, 8, 11, 10, 12, 1620354082, 1620354082, 0),
(19, 8, 10, 3, '李小虎', 3, 5, 18, 6, 13, 97, 1620354615, 1620354615, 0),
(20, 11, 10, 3, '小明A', 14, 12, 60, 32, 50, 80, 1620354615, 1620354615, 0);

-- --------------------------------------------------------

--
-- 表的结构 `rh_plan`
--

CREATE TABLE `rh_plan` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '学生id',
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT '课程id',
  `tid` int(11) NOT NULL DEFAULT '0' COMMENT '老师id',
  `plan_time` int(11) NOT NULL DEFAULT '0' COMMENT '计划日期日',
  `content` text COMMENT '计划内容',
  `message` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  `class_id` int(11) NOT NULL DEFAULT '0' COMMENT '班级id',
  `index` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学习计划';

--
-- 转存表中的数据 `rh_plan`
--

INSERT INTO `rh_plan` (`id`, `uid`, `cid`, `tid`, `plan_time`, `content`, `message`, `create_time`, `update_time`, `delete_time`, `class_id`, `index`, `ucid`) VALUES
(1, 0, 0, 1, 1619798400, '{\"content\":\"武术课，讲解太极拳\",\"video\":\"http:\\/\\/192.168.124.14:8092\\/uploads\\/video\\/20210430\\/932762c06be7b73dcbfaade2ecffb79c.mp4\",\"time\":\"15:12\"}', NULL, 1619766762, 1619766762, 0, 3, 0, 0),
(2, 0, 0, 1, 1619798400, '{\"content\":\"这是一截很长的介绍内容\",\"video\":\"\",\"time\":\"17:16\"}', NULL, 1619767004, 1619767004, 0, 3, 1, 0),
(3, 0, 0, 1, 1619884800, '{\"content\":\"\\n这是一截很长的介绍内容\",\"video\":\"\",\"time\":\"08:11\"}', NULL, 1619767047, 1619767047, 0, 3, 2, 0),
(4, 0, 0, 1, 1620316800, '{\"content\":\"基础知识讲解\",\"video\":\"http:\\/\\/192.168.124.14:8092\\/uploads\\/video\\/20210506\\/fd33399f41719a8ce738136ca7db657d.mp4\",\"time\":\"09:40\"}', NULL, 1620265248, 1620265248, 0, 2, 0, 0),
(5, 0, 0, 1, 1620403200, '{\"content\":\"讲解舞蹈基础动作\",\"video\":\"\",\"time\":\"09:45\"}', NULL, 1620265527, 1620265527, 0, 1, 0, 0),
(6, 0, 0, 1, 1622476800, '{\"content\":\"基础训练\",\"video\":\"http:\\/\\/192.168.124.14:8092\\/uploads\\/video\\/20210507\\/283783a01fdda32006c6a60865f371ff.mp4\",\"time\":\"09:00\"}', NULL, 1620353115, 1620353115, 0, 10, 0, 0),
(7, 0, 0, 1, 1622476800, '{\"content\":\"深入知识讲解\",\"video\":\"\",\"time\":\"14:10\"}', NULL, 1620353454, 1620353454, 0, 10, 1, 0),
(8, 0, 0, 1, 1622563200, '{\"content\":\"讲解基础知识\",\"video\":\"\",\"time\":\"10:20\"}', NULL, 1620354072, 1620354072, 0, 10, 2, 0),
(9, 0, 0, 1, 1619884800, '{\"content\":\"asd\",\"video\":\"\",\"time\":\"23:29\"}', NULL, 1620354600, 1620354600, 0, 10, 3, 0),
(10, 0, 0, 1, 1626019200, '{\"content\":\"123\",\"video\":\"http:\\/\\/192.168.124.16:8092\\/uploads\\/video\\/20210712\\/1c8581b35adbe2620b4df718d004eac8.mp4\",\"time\":\"13:27\"}', NULL, 1626067653, 1626067653, 0, 10, 4, 0),
(11, 0, 0, 1, 1626105600, '{\"content\":\"123\",\"video\":\"\",\"time\":\"12:30\"}', NULL, 1626067818, 1626067818, 0, 10, 5, 0),
(12, 0, 0, 1, 1626192000, '{\"content\":\"有课的\",\"video\":\"http:\\/\\/192.168.124.16:8092\\/uploads\\/video\\/20210712\\/af9e9418c810e426a3d7ed1e93d8b1df.mp4\",\"time\":\"16:00\"}', NULL, 1626076871, 1626076871, 0, 10, 6, 0);

-- --------------------------------------------------------

--
-- 表的结构 `rh_project`
--

CREATE TABLE `rh_project` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级id',
  `sort` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT '上限人数',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学科表';

--
-- 转存表中的数据 `rh_project`
--

INSERT INTO `rh_project` (`id`, `name`, `pid`, `sort`, `create_time`, `update_time`, `count`, `ucid`) VALUES
(1, '绘画', 0, 0, 1619764753, 1619764753, 40, 0),
(3, '武术', 0, 0, 1619764797, 1619764797, 50, 0),
(5, '舞蹈', 0, 0, 1619765028, 1619765028, 20, 0),
(8, '编程', 0, 0, 1620352876, 1620352876, 20, 0),
(9, '123', 0, 0, 1635306795, 1635306795, 12, 3);

-- --------------------------------------------------------

--
-- 表的结构 `rh_pt`
--

CREATE TABLE `rh_pt` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '活动名称',
  `start_time` int(11) NOT NULL COMMENT '开始时间',
  `end_time` int(11) NOT NULL COMMENT '结束时间',
  `pt_time` int(11) NOT NULL COMMENT '拼团时间',
  `user_num` int(11) NOT NULL COMMENT '参团用户数量',
  `is_new_user` int(11) NOT NULL DEFAULT '0' COMMENT '0都能买1只能新用户购买',
  `is_buy_num` int(11) NOT NULL DEFAULT '0' COMMENT '是否开启购买数量限制',
  `buy_num` int(11) NOT NULL COMMENT '限制购买的数量',
  `is_sign_one` int(11) NOT NULL DEFAULT '0' COMMENT '是否开启团长代收',
  `visible_time` int(11) NOT NULL COMMENT '提现显示的时间',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='拼团活动表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `rh_pt`
--

INSERT INTO `rh_pt` (`id`, `name`, `start_time`, `end_time`, `pt_time`, `user_num`, `is_new_user`, `is_buy_num`, `buy_num`, `is_sign_one`, `visible_time`, `create_time`, `update_time`, `delete_time`, `ucid`) VALUES
(10, '123', 1634832000, 1634918400, 2, 3, 0, 0, 0, 0, 2, 1634893558, 1634893574, NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `rh_pt_goods`
--

CREATE TABLE `rh_pt_goods` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `pt_id` int(11) NOT NULL COMMENT '拼团活动id',
  `price` decimal(10,2) NOT NULL COMMENT '拼团价格',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='拼团商品表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `rh_pt_goods`
--

INSERT INTO `rh_pt_goods` (`id`, `goods_id`, `pt_id`, `price`, `ucid`) VALUES
(10, 4, 10, '99.00', 0);

-- --------------------------------------------------------

--
-- 表的结构 `rh_pt_item`
--

CREATE TABLE `rh_pt_item` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '拼团发起人团长id',
  `course_id` int(11) NOT NULL COMMENT '商品ID',
  `course_name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '商品名称',
  `state` int(11) NOT NULL COMMENT '团购订单状态0队长未付款团购未开启1队长付款开启拼团2团拼完成-1拼团未成功已关闭',
  `user_num` int(11) NOT NULL COMMENT '团购订单人数上限',
  `pay_user` int(11) NOT NULL DEFAULT '0' COMMENT '当前付款人数',
  `img_id` int(11) NOT NULL COMMENT '团购订单图片',
  `item_time` int(11) NOT NULL COMMENT '该团有效时间',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='拼团表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `rh_pt_item`
--

INSERT INTO `rh_pt_item` (`id`, `user_id`, `course_id`, `course_name`, `state`, `user_num`, `pay_user`, `img_id`, `item_time`, `create_time`, `update_time`, `delete_time`, `ucid`) VALUES
(1, 1, 1, '中华武术太极拳', 1, 3, 0, 4, 1622608877, 1622598077, 1622598077, NULL, 0),
(2, 1, 1, '中华武术太极拳', 1, 3, 0, 4, 1622608910, 1622598110, 1622598110, NULL, 0),
(3, 1, 1, '中华武术太极拳', 1, 3, 0, 4, 1622609463, 1622598663, 1622598663, NULL, 0),
(4, 1, 1, '中华武术太极拳', 1, 3, 0, 4, 1622609474, 1622598674, 1622598674, NULL, 0),
(5, 1, 1, '中华武术太极拳', 0, 3, 0, 4, 1625200577, 1625189777, 1625189777, NULL, 0),
(6, 1, 3, '体能提升强化课', 0, 3, 0, 2, 1625200611, 1625189811, 1625189811, NULL, 0),
(7, 1, 1, '中华武术太极拳', 0, 3, 0, 4, 1625215012, 1625204212, 1625204212, NULL, 0),
(8, 1, 1, '中华武术太极拳', 0, 3, 0, 4, 1625457658, 1625446858, 1625446858, NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `rh_sortable`
--

CREATE TABLE `rh_sortable` (
  `id` int(11) NOT NULL,
  `path` varchar(255) DEFAULT NULL COMMENT '页面地址',
  `name` varchar(255) DEFAULT NULL COMMENT '页面名称',
  `sortable` text NOT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT '页面的类型',
  `page_name` varchar(255) DEFAULT NULL COMMENT '页面标题',
  `page_background_color` varchar(255) DEFAULT NULL COMMENT '页面背景颜色',
  `json` text,
  `bg_img` varchar(255) DEFAULT '',
  `ucid` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `rh_sortable`
--

INSERT INTO `rh_sortable` (`id`, `path`, `name`, `sortable`, `type`, `page_name`, `page_background_color`, `json`, `bg_img`, `ucid`) VALUES
(1000, 'http://localhost:8080/h5/', '主页', '{\"id\":\"sort-1\",\"level\":1,\"child\":[{\"sorts\":\"st-swiper\",\"name\":\"轮播图\",\"img_url\":\"/cms/img/st-swiper.973d3789.png\",\"type\":[\"index\",\"cover\",\"article\",\"article_list\",\"pic_list\",\"us\"],\"banner_mode\":\"none\",\"banner_title\":false,\"banner_effect3d\":false,\"unique\":1625716833},{\"sorts\":\"st-grid\",\"name\":\"宫格导航\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADIAgMAAADQNkYNAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAAlQTFRFAAAA5ubmAAAAF/49xAAAAAF0Uk5TAEDm2GYAAAABYktHRACIBR1IAAAACXBIWXMAAABIAAAASABGyWs+AAAASElEQVRo3u3UoQ0AMAwDwZDuV9L9V+kAlQqCIvmeWkddpejWedvfAUEQBEEQBEEQBEGQ6URSZmNPCUEQBEEQBEEQBEGQNlFsFys0TXk1zfreAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIxLTAxLTIxVDA5OjQxOjIzKzA4OjAw2PWkZwAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMS0wMS0yMVQwOTo0MToyMyswODowMKmoHNsAAABQdEVYdHN2ZzpiYXNlLXVyaQBmaWxlOi8vL2hvbWUvYWRtaW4vaWNvbi1mb250L3RtcC9pY29uXzd1cXMyN2ZlcWh2L2ljX21vZGVfYmxvY2suc3ZnHyf84AAAAABJRU5ErkJggg==\",\"type\":[\"index\",\"cover\",\"article\",\"article_list\",\"pic_list\",\"us\"],\"grid_col\":\"3\",\"grid_border\":\"true\",\"unique\":1625716835},{\"sorts\":\"st-title\",\"name\":\"标题\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAACp0lEQVRoQ+1Yi3ETMRTcVwFOBZAKCBXgTQOEChIqIFRA0kGogKQCTAP3TAWEDkwFOBWI2RvJI3ssDiz/jjnNeM6+u/fZ99kn2dDzZT33HwOAQ2dwyMCQgcoI9L+E3P0KwPNNAkHy1t3HAD4CmAN4R1LXzuXudwBe6kWS7BQovGBN00zN7PUmCkiau/8CMIryX0le5Lrc/QWAS4HN7+d2pWcT+5LZBoCQGV8C4O5fALSAVp3cGoAS8r81oBIMIagc5mZ2QfIx6XT3BbijBfCn1PcCQGzi1EMPEdBlvN5kANP3nyTvuzLs7u8BiCBSf4kcJiSTjVZ1sXm6DGRlIsfEQm2px6uXMhNC+HZ+fj4u6Xf3MwDqHTX/uqUSFXG1bLcLAPPYE8jZTY63Bs0eSV6vA+Duivb35LxkzGwquRDCONMnHa92AoBka1DrX3sgzgaVjtYDSc2oxXL3PNsfSN5tPQOVAPKZcrJuKDZNI7Z7BmBG8vRoAEQySL0zA3Bf6AFlJfXHybECKHHA6v3yCN+UhTYtoTwDIYQnAIuBWEJjZtfHlAHRpxhIa8EyXak4GgByNGtQ/TwlqV7IWUg0+zkOtydtHHcKoGmamZmlrfoSqxTmQE6TouO3ORO5u5xP1PpJ82SnANx9AuDNShnckrwpDbIQgrb37TlBVBk/+i7madknhPDDzMYCt2sAZyGESZYF2S8CiMNvFGXWnlHidL5K5VUEEPck7UYqZ5bVpooHlsTLar6lE1ncHqhB09IAmnXpj891llAQRnFLMV31ZeOTUBc77Ov5AGBfkS4Os0M7UGt/KKHaCNbK63+d/Nxaq2/v8gKQ/6+zdwdqDQ4AaiNYKz+wUG0Ea+X7n4GBRmtroFL+v6DRfk/iygweXLz/LHTwEFY60PsM/Ab66dzaOfXFjwAAAABJRU5ErkJggg==\",\"type\":[\"index\",\"cover\",\"article\",\"article_list\",\"pic_list\",\"us\"],\"title_type\":\"list-type-3\",\"title_text\":\"精品课程\",\"unique\":1625801375},{\"sorts\":\"st-shop-list\",\"name\":\"商品列表\",\"img_url\":\"data:image/png;base64,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\",\"type\":[\"index\",\"article_list\",\"pic_list\"],\"list_type\":\"list-type-2\",\"shop_shape\":\"square\",\"is_show_title\":true,\"is_show_description\":true,\"is_show_price\":true,\"is_show_button\":true,\"button_text\":\"抢购\",\"button_type\":\"default\",\"unique\":1625716846},{\"sorts\":\"st-title\",\"name\":\"标题\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAACp0lEQVRoQ+1Yi3ETMRTcVwFOBZAKCBXgTQOEChIqIFRA0kGogKQCTAP3TAWEDkwFOBWI2RvJI3ssDiz/jjnNeM6+u/fZ99kn2dDzZT33HwOAQ2dwyMCQgcoI9L+E3P0KwPNNAkHy1t3HAD4CmAN4R1LXzuXudwBe6kWS7BQovGBN00zN7PUmCkiau/8CMIryX0le5Lrc/QWAS4HN7+d2pWcT+5LZBoCQGV8C4O5fALSAVp3cGoAS8r81oBIMIagc5mZ2QfIx6XT3BbijBfCn1PcCQGzi1EMPEdBlvN5kANP3nyTvuzLs7u8BiCBSf4kcJiSTjVZ1sXm6DGRlIsfEQm2px6uXMhNC+HZ+fj4u6Xf3MwDqHTX/uqUSFXG1bLcLAPPYE8jZTY63Bs0eSV6vA+Duivb35LxkzGwquRDCONMnHa92AoBka1DrX3sgzgaVjtYDSc2oxXL3PNsfSN5tPQOVAPKZcrJuKDZNI7Z7BmBG8vRoAEQySL0zA3Bf6AFlJfXHybECKHHA6v3yCN+UhTYtoTwDIYQnAIuBWEJjZtfHlAHRpxhIa8EyXak4GgByNGtQ/TwlqV7IWUg0+zkOtydtHHcKoGmamZmlrfoSqxTmQE6TouO3ORO5u5xP1PpJ82SnANx9AuDNShnckrwpDbIQgrb37TlBVBk/+i7madknhPDDzMYCt2sAZyGESZYF2S8CiMNvFGXWnlHidL5K5VUEEPck7UYqZ5bVpooHlsTLar6lE1ncHqhB09IAmnXpj891llAQRnFLMV31ZeOTUBc77Ov5AGBfkS4Os0M7UGt/KKHaCNbK63+d/Nxaq2/v8gKQ/6+zdwdqDQ4AaiNYKz+wUG0Ea+X7n4GBRmtroFL+v6DRfk/iygweXLz/LHTwEFY60PsM/Ab66dzaOfXFjwAAAABJRU5ErkJggg==\",\"type\":[\"index\",\"cover\",\"article\",\"article_list\",\"pic_list\",\"us\"],\"title_type\":\"list-type-2\",\"title_text\":\"最新消息\",\"unique\":1625801377},{\"sorts\":\"st-article-list\",\"name\":\"文章列表\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAABmElEQVRoge2YXZXCMBBGI6ESkICEOlgcgIOtA+pgkYADUDAXCTjYdVAcsA9NOaGnP0laOn3IPSdPhOT70mQyE2MSiUQi8WmAPfDDOEcg19b7BnABnoGt1NZtjDEGKCLENy3X1m9E5OauKpAPtJ2I3J3+J239phEjIjfP/ru+/wAb4HfR7RhhIB8wcIjZir5zL2FgIyJ/ESaKVRhQIRnQZm4DNkodA1u2CgPANiYKAddoA85FVjFys1LHeTftOLV+X94A9e0bM+kTOHSMt7NjhrRJWyhrpQdebRUHuAHIgLKVF/UKZy2ZaGJN2AizZyRmi8gXsNHW+4YVF3KIq64IpAJOfh9hYqut/60is+F0MGaLyMMxUbpj2W1YRSxG2a3Og9aEoyuKU7R0pBJ5gOhn3zihBl4DefYfyoUyn7ukJf7BlPM0pwEVkgFt5jYAfBNe0MSH45kPcVQUYmI9MKcBlYrMrQVG32eoX7Cb/ucegyHFTMHEguYcuWpehj8O9WvaI1S8iNy1tb+we/caYOA86bMnEolEYkn+AZY/bkCHk98BAAAAAElFTkSuQmCC\",\"type\":[\"index\",\"article_list\",\"pic_list\"],\"article_type\":\"list-type-2\",\"unique\":1625716847}],\"disable\":false}', 'index', 'index', '#FFFFFF', 'null', '', 0),
(1005, 'http://localhost:8080/h5/#/pages/study_list/study_list', '学习足迹', '{\"id\":1005,\"level\":1,\"disable\":false,\"child\":[{\"sorts\":\"st-article-list\",\"name\":\"文章列表\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAABmElEQVRoge2YXZXCMBBGI6ESkICEOlgcgIOtA+pgkYADUDAXCTjYdVAcsA9NOaGnP0laOn3IPSdPhOT70mQyE2MSiUQi8WmAPfDDOEcg19b7BnABnoGt1NZtjDEGKCLENy3X1m9E5OauKpAPtJ2I3J3+J239phEjIjfP/ru+/wAb4HfR7RhhIB8wcIjZir5zL2FgIyJ/ESaKVRhQIRnQZm4DNkodA1u2CgPANiYKAddoA85FVjFys1LHeTftOLV+X94A9e0bM+kTOHSMt7NjhrRJWyhrpQdebRUHuAHIgLKVF/UKZy2ZaGJN2AizZyRmi8gXsNHW+4YVF3KIq64IpAJOfh9hYqut/60is+F0MGaLyMMxUbpj2W1YRSxG2a3Og9aEoyuKU7R0pBJ5gOhn3zihBl4DefYfyoUyn7ukJf7BlPM0pwEVkgFt5jYAfBNe0MSH45kPcVQUYmI9MKcBlYrMrQVG32eoX7Cb/ucegyHFTMHEguYcuWpehj8O9WvaI1S8iNy1tb+we/caYOA86bMnEolEYkn+AZY/bkCHk98BAAAAAElFTkSuQmCC\",\"type\":[\"index\",\"article_list\",\"pic_list\"],\"article_type\":\"list-type-5\",\"unique\":1625813600},{\"sorts\":\"st-qrcode\",\"name\":\"二维码\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAADnUlEQVRoQ+1ZvWsUQRR/s3utYBMLQYggKUxjqVZJaSM2BkQLL9nZI4VWNlbGf0GLcDPjXiCIYIgRkRQ2SaWksrOxMAg2SSOksNndJxN2lslk9vZj7pJcuO3uZuY385v3/YbAiH9kxM8POYFer3cxjuM5AHjgQooQsouIXyil73QcxthDQkjggi3XIqIIw/CtwskJdLvde57nbbhukK3fb7VaU+12+6/8vby8PNlqtX4NCBviOL66uLi4K/F0Akue570AgFlK6XbTzbrd7jEc239N8DnnMwCwlabpy06nszQmYLvFsQT66FYjFcoWSds49kmPEwRBWx+oKwEhxAYiXjTBJTYAbAZBsKbGmhLYAgBpPNZPNyg5oQ4BbW4lbCcClNIjQc8G5kDgiOcrwh4T0OU8lkCBvchLGooKSWM1LU1G7kEYcVXsRjZQ5il835+en5//ocjV8ULqQEUeDhHbYRiuOLlRTaTH9knT9F+n09lxiQNRFF1PkuSSCR7H8a5K2JwJ1Em86kigDm6RbYyzUfMWT00CjLHHhJAeADSuBTIyEwAwrRcdmrG6YsstZFqTR+5chbKq6TkAhHV1U5+flZTrlNJnRuB7BQBPXLCzta8ppU8Vzvkp6gdwM6cCcf4kIL2Iy1VKG9Cjp47FGJsihFwuw/d9f0+P7pkTyJfpTYdcAkKIa4j4swy8yjghZCcIgpuGEfctjCy4h57Glsr07UoQQuYQcb/KQW1z0jSdMdszjLEbhJDvALCWpmmeNxXtIaXo+/76wsLCgbx9ianmmgnkiUTiovS47iU1ykbrbmKLxLaNOecfEXE1DMP1qnucGQJRFF1JkuQ3ALyhlB7pl5oGayFXvzNXBGp6C7lZFQkUESirDxSZWq3FsoLG7KW6EFAXUKZSnudtK1daasSc80P3V7Xsq0JAHpAxtkEIWaWUfig7cL/xygRc+kKD8kJRFE0kSbKnl5ojRaCRF1IqNCwJcM4/AcAFi5ocUErvGtG8/vvAIAhkz1fy9YeZT0+cc7TpOCHkWxAEt50JCCE2EfFOkSFV6Qv1M8KMgPQqs2XG3EiFJCjn/D0AyFLR/P5QSh/pf9Z9TjoRAmU3U4WAJJam6Yql1yNVaLgScCXQz42OhAROlMAw6gGdgEwDpERVKjAwCQyzIrMlacp76QSEEF8R8VaZylqTObVoWDWxiasSMiHEfdkkDsPws2yuIeJkBQK5Mzh/XYky9mdt/D8z0xt8hodtxAAAAABJRU5ErkJggg==\",\"type\":[\"index\",\"cover\",\"article\",\"article_list\",\"order\",\"pic_list\",\"us\"],\"unique\":1625798445},{\"sorts\":\"st-plan\",\"name\":\"学习计划\",\"img_url\":\"data:image/png;base64,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\",\"type\":[\"index\",\"cover\",\"article_list\",\"pic_list\",\"us\"],\"unique\":1625798443},{\"sorts\":\"st-plan\",\"name\":\"学习计划\",\"img_url\":\"data:image/png;base64,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\",\"type\":[\"index\",\"cover\",\"article_list\",\"pic_list\",\"us\"],\"unique\":1625798442},{\"sorts\":\"st-nav\",\"name\":\"导航\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADIAgMAAADQNkYNAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAAlQTFRFAAAA5ubmAAAAF/49xAAAAAF0Uk5TAEDm2GYAAAABYktHRACIBR1IAAAACXBIWXMAAABIAAAASABGyWs+AAAASElEQVRo3u3UoQ0AMAwDwZDuV9L9V+kAlQqCIvmeWkddpejWedvfAUEQBEEQBEEQBEGQ6URSZmNPCUEQBEEQBEEQBEGQNlFsFys0TXk1zfreAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIxLTAxLTIxVDA5OjQxOjIzKzA4OjAw2PWkZwAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMS0wMS0yMVQwOTo0MToyMyswODowMKmoHNsAAABQdEVYdHN2ZzpiYXNlLXVyaQBmaWxlOi8vL2hvbWUvYWRtaW4vaWNvbi1mb250L3RtcC9pY29uXzd1cXMyN2ZlcWh2L2ljX21vZGVfYmxvY2suc3ZnHyf84AAAAABJRU5ErkJggg==\",\"type\":[\"index\",\"cover\",\"article\",\"art_list\",\"pic_list\",\"us\"],\"nav_style\":\"style-1\",\"nav_right\":\"login\",\"nav_bgc\":\"\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\nav\"},{\"sorts\":\"st-minibanner\",\"name\":\"图片\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAD4AAAAwCAYAAABJy8k0AAADIUlEQVRoge2aPWgUQQCFB38RRYn4l+B/xCKFjdpo4Q9CsLKxSKEBRQvRQtRCrBTUxkrsIjaaQg4UQYkkl31vdnbvCOHAJqciIaBYqY1YWPhzFncLlzM7O7N3e3uXy4NX3HHzeB8zNzOXjRBCCMdxjgJ4BkDOY08D8EmeFEIIQfImyVKH+aIA8K0FijTVAD6LmjdOkDw8Hw3gcTXrLHCl1HoxTwXgbih4LpfbkHbBpLQAvgBe9WJ8fHxj2gWTkhac5Lq0C4aJ5D4AQyQ/VLp+BTDkOE6v4fjbOvBNSQPEEcnhmp6zDGAwKgPAnbYCJ/lSBx1YSrlfl9NW4CRPmUBXnNVltRu4ZwFe8n2/JyxLC66U6m4mWJRI/rQBl1IeCctqN3Bj6Ar46bAsLbhuqaQhkjOW4MfDsrTneAvO+FMb8Hw+vzYsq62WOoCDptAA7kdkaXf1zc2CMhWAKwbQOYOc9gIXQgiSx0i+nQO4SPKqSUbUXT0WuO/7PSQzccbaSCnVx/JfU/Zms9k1NmO1M+667pY4hVhW5PcsTWlnPA64lPJCzao5l0TxeqUF931/q02Y4zi9rLldAfitu0GlpYaBl0qlRQAKIbvsd8/zdicJYistuOM42yyCbkQcMzMTExOrk4SxUUPAlVJ7SP6KAC+RRCaTWRy3LMkBksP1ZASKOs62RwUUi8VlJN8ZQAd+GLPoIMm/lYznJJfEyanKqw+c5D0L6MCXbUpKKc9XQQd+VSgUliYC7rruDt1g13UPzFEo0gD+AOg3KUjykiZrLC58bPDR0dGVAD7GmO3AP5RSfRHQ1wxyxkZGRpY3DRzAozqgA3/yPK8rJP+WRQ7z+fyKhoF7nrczZFB/A6BLLC97v3a5Msa+ASBHclVi4J7ndZH80ijwip9UQT+oI2fSFD7qHP/vqQTJFw2GDny98mSk3pxJk4uSFXjlLE0CutF+E7Z3GIGT3BV8UCnVDeB7C0AZGcAUNc/+jMFZVupAlvDvw+CjwDvGC+Cd5gXwTnPngtf5i6stDWBaADibdpFmW0p5JrisDLTAv1Un7SmSrwEcEkKIf7/OIuh6zYZ9AAAAAElFTkSuQmCC\",\"type\":[\"index\",\"cover\",\"article\",\"art_list\",\"pic_list\",\"us\"],\"img_style\":\"style-1\",\"img_button\":\"\",\"img_serve_url\":\"http://qz.thinkphpcode.com/static/pc/imgs/index-item1-2.jpg\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\miniBanner\"},{\"sorts\":\"st-cover\",\"name\":\"封面\",\"img_url\":\"data:image/png;base64,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\",\"type\":[\"cover\",\"article\",\"art_list\",\"pic_list\",\"pro_list\"],\"cover_data\":0,\"cover_bgc\":\"\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\cover\"},{\"sorts\":\"st-footer\",\"name\":\"页脚\",\"img_url\":\"/cms/img/st-tabs.ec3c73a2.png\",\"type\":[\"index\",\"cover\",\"article\",\"art_list\",\"pic_list\",\"us\"],\"fot_style\":\"style-4\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\footer\",\"fot_list_bgc\":\"\"}]}', 'article_list', 'undefined', '#fff', NULL, '', 0),
(1006, 'http://localhost:8080/h5/#/pages/article_list/article_list', '文章列表', '{\"id\":\"sort-1\",\"level\":1,\"child\":[{\"sorts\":\"st-article-list\",\"name\":\"文章列表\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAABmElEQVRoge2YXZXCMBBGI6ESkICEOlgcgIOtA+pgkYADUDAXCTjYdVAcsA9NOaGnP0laOn3IPSdPhOT70mQyE2MSiUQi8WmAPfDDOEcg19b7BnABnoGt1NZtjDEGKCLENy3X1m9E5OauKpAPtJ2I3J3+J239phEjIjfP/ru+/wAb4HfR7RhhIB8wcIjZir5zL2FgIyJ/ESaKVRhQIRnQZm4DNkodA1u2CgPANiYKAddoA85FVjFys1LHeTftOLV+X94A9e0bM+kTOHSMt7NjhrRJWyhrpQdebRUHuAHIgLKVF/UKZy2ZaGJN2AizZyRmi8gXsNHW+4YVF3KIq64IpAJOfh9hYqut/60is+F0MGaLyMMxUbpj2W1YRSxG2a3Og9aEoyuKU7R0pBJ5gOhn3zihBl4DefYfyoUyn7ukJf7BlPM0pwEVkgFt5jYAfBNe0MSH45kPcVQUYmI9MKcBlYrMrQVG32eoX7Cb/ucegyHFTMHEguYcuWpehj8O9WvaI1S8iNy1tb+we/caYOA86bMnEolEYkn+AZY/bkCHk98BAAAAAElFTkSuQmCC\",\"type\":[\"index\",\"article_list\",\"pic_list\"],\"article_type\":\"list-type-2\",\"unique\":1625621659}],\"disable\":false}', 'article_list', 'article', '#fff', NULL, '', 0),
(1018, 'http://localhost:8080/h5/#/pages/pic_list/pic_list', '课程', '{\"id\":1018,\"level\":1,\"disable\":false,\"child\":[{\"sorts\":\"st-tabs\",\"name\":\"tab选项\",\"img_url\":\"/cms/img/st-tabs.ec3c73a2.png\",\"type\":[\"index\",\"cover\",\"article\",\"article_list\",\"pic_list\",\"us\"],\"tabs_type\":\"green\",\"tabs_text_blod\":\"true\",\"unique\":1625621204},{\"sorts\":\"st-shop-list\",\"name\":\"商品列表\",\"img_url\":\"data:image/png;base64,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\",\"type\":[\"index\",\"article_list\",\"pic_list\"],\"list_type\":\"list-type-1\",\"shop_shape\":\"square\",\"is_show_title\":true,\"is_show_description\":true,\"is_show_price\":true,\"is_show_button\":true,\"button_text\":\"抢购\",\"button_type\":\"default\",\"unique\":1625620843}]}', 'pic_list', 'undefined', '#fff', NULL, '', 0),
(1028, 'http://localhost:8080/h5/#/pages/teacher_list/teacher_list', '教师列表', '{\"id\":1028,\"level\":1,\"disable\":false,\"child\":[{\"sorts\":\"st-article-list\",\"name\":\"文章列表\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAABmElEQVRoge2YXZXCMBBGI6ESkICEOlgcgIOtA+pgkYADUDAXCTjYdVAcsA9NOaGnP0laOn3IPSdPhOT70mQyE2MSiUQi8WmAPfDDOEcg19b7BnABnoGt1NZtjDEGKCLENy3X1m9E5OauKpAPtJ2I3J3+J239phEjIjfP/ru+/wAb4HfR7RhhIB8wcIjZir5zL2FgIyJ/ESaKVRhQIRnQZm4DNkodA1u2CgPANiYKAddoA85FVjFys1LHeTftOLV+X94A9e0bM+kTOHSMt7NjhrRJWyhrpQdebRUHuAHIgLKVF/UKZy2ZaGJN2AizZyRmi8gXsNHW+4YVF3KIq64IpAJOfh9hYqut/60is+F0MGaLyMMxUbpj2W1YRSxG2a3Og9aEoyuKU7R0pBJ5gOhn3zihBl4DefYfyoUyn7ukJf7BlPM0pwEVkgFt5jYAfBNe0MSH45kPcVQUYmI9MKcBlYrMrQVG32eoX7Cb/ucegyHFTMHEguYcuWpehj8O9WvaI1S8iNy1tb+we/caYOA86bMnEolEYkn+AZY/bkCHk98BAAAAAElFTkSuQmCC\",\"type\":[\"index\",\"article_list\",\"pic_list\"],\"article_type\":\"list-type-1\",\"unique\":1625621745},{\"sorts\":\"st-nav\",\"name\":\"导航\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADIAgMAAADQNkYNAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAAlQTFRFAAAA5ubmAAAAF/49xAAAAAF0Uk5TAEDm2GYAAAABYktHRACIBR1IAAAACXBIWXMAAABIAAAASABGyWs+AAAASElEQVRo3u3UoQ0AMAwDwZDuV9L9V+kAlQqCIvmeWkddpejWedvfAUEQBEEQBEEQBEGQ6URSZmNPCUEQBEEQBEEQBEGQNlFsFys0TXk1zfreAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIxLTAxLTIxVDA5OjQxOjIzKzA4OjAw2PWkZwAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMS0wMS0yMVQwOTo0MToyMyswODowMKmoHNsAAABQdEVYdHN2ZzpiYXNlLXVyaQBmaWxlOi8vL2hvbWUvYWRtaW4vaWNvbi1mb250L3RtcC9pY29uXzd1cXMyN2ZlcWh2L2ljX21vZGVfYmxvY2suc3ZnHyf84AAAAABJRU5ErkJggg==\",\"type\":[\"index\",\"cover\",\"article\",\"art_list\",\"pic_list\",\"pro_list\"],\"nav_style\":\"style-1\",\"nav_right\":\"login\",\"nav_bgc\":\"\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\nav\"},{\"sorts\":\"st-minibanner\",\"name\":\"图片\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAD4AAAAwCAYAAABJy8k0AAADIUlEQVRoge2aPWgUQQCFB38RRYn4l+B/xCKFjdpo4Q9CsLKxSKEBRQvRQtRCrBTUxkrsIjaaQg4UQYkkl31vdnbvCOHAJqciIaBYqY1YWPhzFncLlzM7O7N3e3uXy4NX3HHzeB8zNzOXjRBCCMdxjgJ4BkDOY08D8EmeFEIIQfImyVKH+aIA8K0FijTVAD6LmjdOkDw8Hw3gcTXrLHCl1HoxTwXgbih4LpfbkHbBpLQAvgBe9WJ8fHxj2gWTkhac5Lq0C4aJ5D4AQyQ/VLp+BTDkOE6v4fjbOvBNSQPEEcnhmp6zDGAwKgPAnbYCJ/lSBx1YSrlfl9NW4CRPmUBXnNVltRu4ZwFe8n2/JyxLC66U6m4mWJRI/rQBl1IeCctqN3Bj6Ar46bAsLbhuqaQhkjOW4MfDsrTneAvO+FMb8Hw+vzYsq62WOoCDptAA7kdkaXf1zc2CMhWAKwbQOYOc9gIXQgiSx0i+nQO4SPKqSUbUXT0WuO/7PSQzccbaSCnVx/JfU/Zms9k1NmO1M+667pY4hVhW5PcsTWlnPA64lPJCzao5l0TxeqUF931/q02Y4zi9rLldAfitu0GlpYaBl0qlRQAKIbvsd8/zdicJYistuOM42yyCbkQcMzMTExOrk4SxUUPAlVJ7SP6KAC+RRCaTWRy3LMkBksP1ZASKOs62RwUUi8VlJN8ZQAd+GLPoIMm/lYznJJfEyanKqw+c5D0L6MCXbUpKKc9XQQd+VSgUliYC7rruDt1g13UPzFEo0gD+AOg3KUjykiZrLC58bPDR0dGVAD7GmO3AP5RSfRHQ1wxyxkZGRpY3DRzAozqgA3/yPK8rJP+WRQ7z+fyKhoF7nrczZFB/A6BLLC97v3a5Msa+ASBHclVi4J7ndZH80ijwip9UQT+oI2fSFD7qHP/vqQTJFw2GDny98mSk3pxJk4uSFXjlLE0CutF+E7Z3GIGT3BV8UCnVDeB7C0AZGcAUNc/+jMFZVupAlvDvw+CjwDvGC+Cd5gXwTnPngtf5i6stDWBaADibdpFmW0p5JrisDLTAv1Un7SmSrwEcEkKIf7/OIuh6zYZ9AAAAAElFTkSuQmCC\",\"type\":[\"index\",\"cover\",\"article\",\"art_list\",\"pic_list\",\"pro_list\"],\"img_style\":\"style-1\",\"img_button\":\"\",\"img_serve_url\":\"http://qz.thinkphpcode.com/static/pc/imgs/index-item1-2.jpg\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\miniBanner\"},{\"sorts\":\"st-pro-list\",\"name\":\"商品列表\",\"img_url\":\"data:image/png;base64,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\",\"type\":[\"index\",\"cover\",\"article\",\"art_list\",\"pic_list\",\"pro_list\"],\"pro_list_date\":0,\"pro_style\":\"style-1\",\"pro_bgd\":\"\",\"pro_list_bgc\":\"\",\"pro_type\":\"pic_type\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\picList\"},{\"sorts\":\"st-footer\",\"name\":\"页脚\",\"img_url\":\"/cms/img/st-tabs.ec3c73a2.png\",\"type\":[\"index\",\"cover\",\"article\",\"art_list\",\"pic_list\",\"pro_list\"],\"fot_style\":\"style-4\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\footer\",\"fot_list_bgc\":\"\"}]}', 'pic_list', '', '#fff', NULL, '', 0),
(1029, 'http://localhost:8080/h5/#/pages/video/video', '视频直播', '{\"id\":\"sort-1\",\"level\":1,\"child\":[{\"sorts\":\"st-video\",\"name\":\"视频\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAEHUlEQVRoQ+2ZTYgcRRTH36txBXFRVJQcRAQRRQIRXNCDaDwIguDJgzmoZLZez6yo6xfiBywuEvELNYmy2/1qEvUgYQ6KkktE2KAsQVBRhHxoXBRBEGJYl712PamlVybjTE9VTctsYBqGOcx7//d+9a/qrupBOM8vPM/7hzHAqB0cO9DtQLvdvnB1dXVKKXW9tXYbIl5MRHP/l1OVOLC0tHTBysrK7jzP70fEuwHOWVsniOimLQvAzM8BwDMAcEWfJrcmQJZldwLAXkTcMWB0NwCYeScAfIKIR621PymlPtNaLw/rTNQUyrLsEUR8z7N4J8BSV84viHgYERemp6dPeeqdExYMwMwvAMCegGJlAJsyZxDxDa316wG6G6FBAGmaPqmUeiuwiA/ApuQRIronRN8bwBhzr4gcDhEvYkMAXMpvRHStbx0vgHa7fdHa2tpxEfEW7mggFMCl/klE23wgvACY+U0AeNpHsEdMDICT2UdEs4NqDgRg5qsB4PdBQiW/xwKAtXa+0Wi8VFZ7IECWZfOIOMxWIBoAAM4i4q1a69P9IAYCGGNOisgNo3CgqLmfiB6PAjDGbBeRH4do3qUO48BG6Vqtdk29Xu85jUsdaLVaZK3NRg2AiLu01od69VEKwMz7AOCxUQOIyLtJkvTsoxTAGPOpiNw3agAAWCai22McOAYAt20BgFNEdGMwwMLCQsyT9z91ZmZmfi220927Ud+xOUNEVwYDuIQ0TS/1rdIvbmJi4pI8z68DgFgAIKKe033gc4CZzwLAZbEQInJofX29Pjk5eQARH4jUiXeAmb8BgFsiC88R0cvMvAsAPorUcGlxa8BlZlnWQsR6YPG/AaBORB9nWfYgIn4YmN8dHncXcirM/BAAfBDQwDFrbb3RaJxk5t0AcCAgt1/oi0T0StQiNsZcLiJ/eTbRIiLtYo0xWkTYM680LM/zm5vN5g9RAIULzgHnRN8LEZ/SWr9dTLumO6hX0byIfJ0kSd9n0cC7UAHgFrFbzL2uP0SkniTJEfdjmqaPKqX2V9F8odEgor77MS+AAqLXvuiLWq1W39wpGmNmReSdCpv/loimSp33LZam6YRS6jsA2O5yEHGv1vqJzXxmdkdOd/Ss8iod/Y0+Qqq1Wq0pa+1XADDbaasx5lkReS1EyyP2IBENvH0HAbiii4uLOzrvCBEvujx6h6NEdJdPYDBAp2iWZXOIOO9TKCDmVSJ63jd+KIA0TR9WSr3vW8wjzj29D3rE/RsyFEAxpe6o1WrudWPsfglE5HNr7Z5ms/llSPPBi7hMnJkTAHCfEJATImKSJAl931qdA91Q7uBird2plHL/H7hDyFXF92lE/FlE3Pf3iLgc+0q9s+bQUyjU8qrjxwBVj2io3tiB0BGrOn7sQNUjGqr3D6pZoUC/Wgl3AAAAAElFTkSuQmCC\",\"type\":[\"index\",\"cover\",\"article\",\"us\"],\"unique\":1625620574},{\"sorts\":\"st-html\",\"name\":\"数据文本\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADIAgMAAADQNkYNAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAAlQTFRFAAAA5ubmAAAAF/49xAAAAAF0Uk5TAEDm2GYAAAABYktHRACIBR1IAAAACXBIWXMAAABIAAAASABGyWs+AAAASElEQVRo3u3UoQ0AMAwDwZDuV9L9V+kAlQqCIvmeWkddpejWedvfAUEQBEEQBEEQBEGQ6URSZmNPCUEQBEEQBEEQBEGQNlFsFys0TXk1zfreAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIxLTAxLTIxVDA5OjQxOjIzKzA4OjAw2PWkZwAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMS0wMS0yMVQwOTo0MToyMyswODowMKmoHNsAAABQdEVYdHN2ZzpiYXNlLXVyaQBmaWxlOi8vL2hvbWUvYWRtaW4vaWNvbi1mb250L3RtcC9pY29uXzd1cXMyN2ZlcWh2L2ljX21vZGVfYmxvY2suc3ZnHyf84AAAAABJRU5ErkJggg==\",\"type\":[\"cover\",\"article\"],\"unique\":1626080656}],\"disable\":false}', 'cover', 'article', '#fff', NULL, '', 0),
(1030, 'http://localhost:8080/h5/#/pages/user/us/us', '关于我们', '{\"id\":1018,\"level\":1,\"disable\":false,\"child\":[{\"sorts\":\"st-image\",\"name\":\"图片\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAD4AAAAwCAYAAABJy8k0AAADIUlEQVRoge2aPWgUQQCFB38RRYn4l+B/xCKFjdpo4Q9CsLKxSKEBRQvRQtRCrBTUxkrsIjaaQg4UQYkkl31vdnbvCOHAJqciIaBYqY1YWPhzFncLlzM7O7N3e3uXy4NX3HHzeB8zNzOXjRBCCMdxjgJ4BkDOY08D8EmeFEIIQfImyVKH+aIA8K0FijTVAD6LmjdOkDw8Hw3gcTXrLHCl1HoxTwXgbih4LpfbkHbBpLQAvgBe9WJ8fHxj2gWTkhac5Lq0C4aJ5D4AQyQ/VLp+BTDkOE6v4fjbOvBNSQPEEcnhmp6zDGAwKgPAnbYCJ/lSBx1YSrlfl9NW4CRPmUBXnNVltRu4ZwFe8n2/JyxLC66U6m4mWJRI/rQBl1IeCctqN3Bj6Ar46bAsLbhuqaQhkjOW4MfDsrTneAvO+FMb8Hw+vzYsq62WOoCDptAA7kdkaXf1zc2CMhWAKwbQOYOc9gIXQgiSx0i+nQO4SPKqSUbUXT0WuO/7PSQzccbaSCnVx/JfU/Zms9k1NmO1M+667pY4hVhW5PcsTWlnPA64lPJCzao5l0TxeqUF931/q02Y4zi9rLldAfitu0GlpYaBl0qlRQAKIbvsd8/zdicJYistuOM42yyCbkQcMzMTExOrk4SxUUPAlVJ7SP6KAC+RRCaTWRy3LMkBksP1ZASKOs62RwUUi8VlJN8ZQAd+GLPoIMm/lYznJJfEyanKqw+c5D0L6MCXbUpKKc9XQQd+VSgUliYC7rruDt1g13UPzFEo0gD+AOg3KUjykiZrLC58bPDR0dGVAD7GmO3AP5RSfRHQ1wxyxkZGRpY3DRzAozqgA3/yPK8rJP+WRQ7z+fyKhoF7nrczZFB/A6BLLC97v3a5Msa+ASBHclVi4J7ndZH80ijwip9UQT+oI2fSFD7qHP/vqQTJFw2GDny98mSk3pxJk4uSFXjlLE0CutF+E7Z3GIGT3BV8UCnVDeB7C0AZGcAUNc/+jMFZVupAlvDvw+CjwDvGC+Cd5gXwTnPngtf5i6stDWBaADibdpFmW0p5JrisDLTAv1Un7SmSrwEcEkKIf7/OIuh6zYZ9AAAAAElFTkSuQmCC\",\"type\":[\"index\",\"cover\",\"article\",\"article_list\",\"pic_list\",\"us\"],\"img_button\":\"\",\"img_logbox\":\"\",\"img_height\":200,\"img_padding_show\":false,\"img_padding\":12,\"img_serve_url\":\"\",\"unique\":1625623244},{\"sorts\":\"st-presentation\",\"name\":\"介绍栏\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAABBUlEQVRoQ+2ayxHCMAxE5UqgE1AqoROgEyqxoBOoxBzgEIJt7Ik/UdicPZZ231r5TAwpv4zy/mm9AkTkuCQ6zHz29RMkICJuYQK8vUJAK0rMDAKtzPbWAYGu9hMRCKgnEEJYS9j0Rjo7QhCQiQoEUh3INDZ5eWr95Ie51Z0Ba+3VGLNLtjSy0Dl3G4ZhP15SnQAEjOzuQqBEdGJ7VI8QBPxwoDoBETkQ0aYQiQczXzCFchxQP0bfEdoWitC9eYQKNR7cpvohhoDeY1T9IYYAPMy9HPjfNzKM0d5jVB0BIjrVbnqy/0e92Z8WGzf/VQ4CNBJonfmoR8zs7We9vxr0jkxqffUEnnjyX0AMBwrBAAAAAElFTkSuQmCC\",\"type\":[\"index\",\"cover\",\"article\",\"article_list\",\"pic_list\",\"us\"],\"presentation_show\":true,\"presentation_title\":\"默认标题\",\"presentation_text\":\"默认内容默认内容默认内容默认内容默认内容默认内容默认内容\",\"presentation_type\":\"left\",\"unique\":1625623242},{\"sorts\":\"st-contact\",\"name\":\"联系我们\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAC2UlEQVRoQ+1ZvW4TQRCeOSNREt4gSPRATyCzdhnx8wQJDXWM6ENqJAg1BeYNgkLpu3GAB3B6JMITAC3CHjRmT1pffJddn31no9vK8s3tft98s7OzcwhrPnDN8UNDoG4FGwVWQgFmPgKAW3WD8Vi/S0RD124SQkmSDBDxvscEdZsQEQ1yCYjIdwA4rxtlZv0NREyjo5gAABwS0YtVIsDM2wDAFlNDoHJxGgUqd3lmwUaB/0IBZt4DgN0FkHlPRL2QeRYSQsysZ8NByMI5tsHnzKII7ImIqlBqIGJvDgU2ASBdW9+fqhSytVCwh0oxWsDLDYEFOLHUFCuhADPviMghANy0bL4i4gERfbyMnRcBmwl87wun2Zq9CAQznwDATo7NCRE9KHrfl0BIGvVOBMz8EgCeK0ARAcR/V/TM72fGmNd5JGolEMfxKIqiyAWcAk3/E5HfxpirpQhcFofzPO/3+1utVuuTz7uj0ehep9P5PMvWSwGfRUJtmHkfAHJDIzOfXua18XBh1EngLgDM9OoMnFtE9GWlCCiYOI7/RFHUKlJvPB6P2u32lZXbAwooSZIuIr4qIiAi5bNQaHyH2DNzT0R20xTqZiEAeGuMeVr6HAgBFGLLzLdtmf6o4L1jAHiTdzjWuYn1fnGhByUiZ04jy+V1RETdLNFaCDDzu7TGF5FfiKgpcqrWZ+bJPUBE9hHxmgWuNk9cEpUTcG931tvbRPQzL4SYeUNEtHebthc1nPQMmYxKCVivftOFFbwxRveA10iSZOiQuJN2qasmoBvyoQ2bzSLPZ1lZJc5tOH0gosnGzxLQlBbUNchznzHm1H2mAADgh/3Pu2LNzOFWxdfVAUv7PkBEU5+vbGtGN6+OG9nLuU8cuSEIAI+J6LhKAhPvafgYY1SNuQYzi6tiZR/5VAFtzSDi0M0ioSxsFasOGOjhVhmBUKC+9g0BX08ty65RYFme9Z137RX4C5bu3kCEsdBTAAAAAElFTkSuQmCC\",\"type\":[\"index\",\"cover\",\"article\",\"article_list\",\"pic_list\",\"us\"],\"contact_icon\":true,\"contact_icons\":[\"address\",\"phone\",\"time\",\"name\"],\"unique\":1625623241}]}', 'us', 'undefined', '#fff', NULL, '', 0);
INSERT INTO `rh_sortable` (`id`, `path`, `name`, `sortable`, `type`, `page_name`, `page_background_color`, `json`, `bg_img`, `ucid`) VALUES
(1031, 'http://localhost:8080/h5/#/pages/user/usinfo/usinfo', '个人信息', '{\"id\":1028,\"level\":1,\"disable\":false,\"child\":[{\"sorts\":\"st-form\",\"name\":\"表单\",\"img_url\":\"data:image/png;base64,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\",\"type\":[\"index\",\"cover\",\"us\"],\"form_style\":\"form1\",\"form_list\":[\"name\",\"phone\",\"message\"],\"unique\":1625712314},{\"sorts\":\"st-nav\",\"name\":\"导航\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADIAgMAAADQNkYNAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAAlQTFRFAAAA5ubmAAAAF/49xAAAAAF0Uk5TAEDm2GYAAAABYktHRACIBR1IAAAACXBIWXMAAABIAAAASABGyWs+AAAASElEQVRo3u3UoQ0AMAwDwZDuV9L9V+kAlQqCIvmeWkddpejWedvfAUEQBEEQBEEQBEGQ6URSZmNPCUEQBEEQBEEQBEGQNlFsFys0TXk1zfreAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIxLTAxLTIxVDA5OjQxOjIzKzA4OjAw2PWkZwAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMS0wMS0yMVQwOTo0MToyMyswODowMKmoHNsAAABQdEVYdHN2ZzpiYXNlLXVyaQBmaWxlOi8vL2hvbWUvYWRtaW4vaWNvbi1mb250L3RtcC9pY29uXzd1cXMyN2ZlcWh2L2ljX21vZGVfYmxvY2suc3ZnHyf84AAAAABJRU5ErkJggg==\",\"type\":[\"index\",\"cover\",\"article\",\"art_list\",\"pic_list\",\"pro_list\"],\"nav_style\":\"style-1\",\"nav_right\":\"login\",\"nav_bgc\":\"\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\nav\"},{\"sorts\":\"st-minibanner\",\"name\":\"图片\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAD4AAAAwCAYAAABJy8k0AAADIUlEQVRoge2aPWgUQQCFB38RRYn4l+B/xCKFjdpo4Q9CsLKxSKEBRQvRQtRCrBTUxkrsIjaaQg4UQYkkl31vdnbvCOHAJqciIaBYqY1YWPhzFncLlzM7O7N3e3uXy4NX3HHzeB8zNzOXjRBCCMdxjgJ4BkDOY08D8EmeFEIIQfImyVKH+aIA8K0FijTVAD6LmjdOkDw8Hw3gcTXrLHCl1HoxTwXgbih4LpfbkHbBpLQAvgBe9WJ8fHxj2gWTkhac5Lq0C4aJ5D4AQyQ/VLp+BTDkOE6v4fjbOvBNSQPEEcnhmp6zDGAwKgPAnbYCJ/lSBx1YSrlfl9NW4CRPmUBXnNVltRu4ZwFe8n2/JyxLC66U6m4mWJRI/rQBl1IeCctqN3Bj6Ar46bAsLbhuqaQhkjOW4MfDsrTneAvO+FMb8Hw+vzYsq62WOoCDptAA7kdkaXf1zc2CMhWAKwbQOYOc9gIXQgiSx0i+nQO4SPKqSUbUXT0WuO/7PSQzccbaSCnVx/JfU/Zms9k1NmO1M+667pY4hVhW5PcsTWlnPA64lPJCzao5l0TxeqUF931/q02Y4zi9rLldAfitu0GlpYaBl0qlRQAKIbvsd8/zdicJYistuOM42yyCbkQcMzMTExOrk4SxUUPAlVJ7SP6KAC+RRCaTWRy3LMkBksP1ZASKOs62RwUUi8VlJN8ZQAd+GLPoIMm/lYznJJfEyanKqw+c5D0L6MCXbUpKKc9XQQd+VSgUliYC7rruDt1g13UPzFEo0gD+AOg3KUjykiZrLC58bPDR0dGVAD7GmO3AP5RSfRHQ1wxyxkZGRpY3DRzAozqgA3/yPK8rJP+WRQ7z+fyKhoF7nrczZFB/A6BLLC97v3a5Msa+ASBHclVi4J7ndZH80ijwip9UQT+oI2fSFD7qHP/vqQTJFw2GDny98mSk3pxJk4uSFXjlLE0CutF+E7Z3GIGT3BV8UCnVDeB7C0AZGcAUNc/+jMFZVupAlvDvw+CjwDvGC+Cd5gXwTnPngtf5i6stDWBaADibdpFmW0p5JrisDLTAv1Un7SmSrwEcEkKIf7/OIuh6zYZ9AAAAAElFTkSuQmCC\",\"type\":[\"index\",\"cover\",\"article\",\"art_list\",\"pic_list\",\"pro_list\"],\"img_style\":\"style-1\",\"img_button\":\"\",\"img_serve_url\":\"http://qz.thinkphpcode.com/static/pc/imgs/index-item1-2.jpg\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\miniBanner\"},{\"sorts\":\"st-pro-list\",\"name\":\"商品列表\",\"img_url\":\"data:image/png;base64,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\",\"type\":[\"index\",\"cover\",\"article\",\"art_list\",\"pic_list\",\"pro_list\"],\"pro_list_date\":0,\"pro_style\":\"style-1\",\"pro_bgd\":\"\",\"pro_list_bgc\":\"\",\"pro_type\":\"pic_type\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\picList\"},{\"sorts\":\"st-footer\",\"name\":\"页脚\",\"img_url\":\"/cms/img/st-tabs.ec3c73a2.png\",\"type\":[\"index\",\"cover\",\"article\",\"art_list\",\"pic_list\",\"pro_list\"],\"fot_style\":\"style-4\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\footer\",\"fot_list_bgc\":\"\"}]}', 'us', '', '#fff', NULL, '', 0),
(1032, 'http://localhost:8080/h5/#/pages/teacher_list/teacher/info', '教师信息', '{\"id\":1005,\"level\":1,\"disable\":false,\"child\":[{\"sorts\":\"st-chart\",\"name\":\"图表\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAEHUlEQVRoQ+2ZTYgcRRTH36txBXFRVJQcRAQRRQIRXNCDaDwIguDJgzmoZLZez6yo6xfiBywuEvELNYmy2/1qEvUgYQ6KkktE2KAsQVBRhHxoXBRBEGJYl712PamlVybjTE9VTctsYBqGOcx7//d+9a/qrupBOM8vPM/7hzHAqB0cO9DtQLvdvnB1dXVKKXW9tXYbIl5MRHP/l1OVOLC0tHTBysrK7jzP70fEuwHOWVsniOimLQvAzM8BwDMAcEWfJrcmQJZldwLAXkTcMWB0NwCYeScAfIKIR621PymlPtNaLw/rTNQUyrLsEUR8z7N4J8BSV84viHgYERemp6dPeeqdExYMwMwvAMCegGJlAJsyZxDxDa316wG6G6FBAGmaPqmUeiuwiA/ApuQRIronRN8bwBhzr4gcDhEvYkMAXMpvRHStbx0vgHa7fdHa2tpxEfEW7mggFMCl/klE23wgvACY+U0AeNpHsEdMDICT2UdEs4NqDgRg5qsB4PdBQiW/xwKAtXa+0Wi8VFZ7IECWZfOIOMxWIBoAAM4i4q1a69P9IAYCGGNOisgNo3CgqLmfiB6PAjDGbBeRH4do3qUO48BG6Vqtdk29Xu85jUsdaLVaZK3NRg2AiLu01od69VEKwMz7AOCxUQOIyLtJkvTsoxTAGPOpiNw3agAAWCai22McOAYAt20BgFNEdGMwwMLCQsyT9z91ZmZmfi220927Ud+xOUNEVwYDuIQ0TS/1rdIvbmJi4pI8z68DgFgAIKKe033gc4CZzwLAZbEQInJofX29Pjk5eQARH4jUiXeAmb8BgFsiC88R0cvMvAsAPorUcGlxa8BlZlnWQsR6YPG/AaBORB9nWfYgIn4YmN8dHncXcirM/BAAfBDQwDFrbb3RaJxk5t0AcCAgt1/oi0T0StQiNsZcLiJ/eTbRIiLtYo0xWkTYM680LM/zm5vN5g9RAIULzgHnRN8LEZ/SWr9dTLumO6hX0byIfJ0kSd9n0cC7UAHgFrFbzL2uP0SkniTJEfdjmqaPKqX2V9F8odEgor77MS+AAqLXvuiLWq1W39wpGmNmReSdCpv/loimSp33LZam6YRS6jsA2O5yEHGv1vqJzXxmdkdOd/Ss8iod/Y0+Qqq1Wq0pa+1XADDbaasx5lkReS1EyyP2IBENvH0HAbiii4uLOzrvCBEvujx6h6NEdJdPYDBAp2iWZXOIOO9TKCDmVSJ63jd+KIA0TR9WSr3vW8wjzj29D3rE/RsyFEAxpe6o1WrudWPsfglE5HNr7Z5ms/llSPPBi7hMnJkTAHCfEJATImKSJAl931qdA91Q7uBird2plHL/H7hDyFXF92lE/FlE3Pf3iLgc+0q9s+bQUyjU8qrjxwBVj2io3tiB0BGrOn7sQNUjGqr3D6pZoUC/Wgl3AAAAAElFTkSuQmCC\",\"type\":[\"index\",\"cover\",\"article_list\",\"pic_list\",\"us\"],\"chart_style\":\"radar\",\"unique\":1625823826},{\"sorts\":\"st-title\",\"name\":\"标题\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAACp0lEQVRoQ+1Yi3ETMRTcVwFOBZAKCBXgTQOEChIqIFRA0kGogKQCTAP3TAWEDkwFOBWI2RvJI3ssDiz/jjnNeM6+u/fZ99kn2dDzZT33HwOAQ2dwyMCQgcoI9L+E3P0KwPNNAkHy1t3HAD4CmAN4R1LXzuXudwBe6kWS7BQovGBN00zN7PUmCkiau/8CMIryX0le5Lrc/QWAS4HN7+d2pWcT+5LZBoCQGV8C4O5fALSAVp3cGoAS8r81oBIMIagc5mZ2QfIx6XT3BbijBfCn1PcCQGzi1EMPEdBlvN5kANP3nyTvuzLs7u8BiCBSf4kcJiSTjVZ1sXm6DGRlIsfEQm2px6uXMhNC+HZ+fj4u6Xf3MwDqHTX/uqUSFXG1bLcLAPPYE8jZTY63Bs0eSV6vA+Duivb35LxkzGwquRDCONMnHa92AoBka1DrX3sgzgaVjtYDSc2oxXL3PNsfSN5tPQOVAPKZcrJuKDZNI7Z7BmBG8vRoAEQySL0zA3Bf6AFlJfXHybECKHHA6v3yCN+UhTYtoTwDIYQnAIuBWEJjZtfHlAHRpxhIa8EyXak4GgByNGtQ/TwlqV7IWUg0+zkOtydtHHcKoGmamZmlrfoSqxTmQE6TouO3ORO5u5xP1PpJ82SnANx9AuDNShnckrwpDbIQgrb37TlBVBk/+i7madknhPDDzMYCt2sAZyGESZYF2S8CiMNvFGXWnlHidL5K5VUEEPck7UYqZ5bVpooHlsTLar6lE1ncHqhB09IAmnXpj891llAQRnFLMV31ZeOTUBc77Ov5AGBfkS4Os0M7UGt/KKHaCNbK63+d/Nxaq2/v8gKQ/6+zdwdqDQ4AaiNYKz+wUG0Ea+X7n4GBRmtroFL+v6DRfk/iygweXLz/LHTwEFY60PsM/Ab66dzaOfXFjwAAAABJRU5ErkJggg==\",\"type\":[\"index\",\"cover\",\"article\",\"article_list\",\"pic_list\",\"us\"],\"title_type\":\"list-type-3\",\"title_text\":\"标题\",\"unique\":1625801833},{\"sorts\":\"st-article-list\",\"name\":\"文章列表\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAABmElEQVRoge2YXZXCMBBGI6ESkICEOlgcgIOtA+pgkYADUDAXCTjYdVAcsA9NOaGnP0laOn3IPSdPhOT70mQyE2MSiUQi8WmAPfDDOEcg19b7BnABnoGt1NZtjDEGKCLENy3X1m9E5OauKpAPtJ2I3J3+J239phEjIjfP/ru+/wAb4HfR7RhhIB8wcIjZir5zL2FgIyJ/ESaKVRhQIRnQZm4DNkodA1u2CgPANiYKAddoA85FVjFys1LHeTftOLV+X94A9e0bM+kTOHSMt7NjhrRJWyhrpQdebRUHuAHIgLKVF/UKZy2ZaGJN2AizZyRmi8gXsNHW+4YVF3KIq64IpAJOfh9hYqut/60is+F0MGaLyMMxUbpj2W1YRSxG2a3Og9aEoyuKU7R0pBJ5gOhn3zihBl4DefYfyoUyn7ukJf7BlPM0pwEVkgFt5jYAfBNe0MSH45kPcVQUYmI9MKcBlYrMrQVG32eoX7Cb/ucegyHFTMHEguYcuWpehj8O9WvaI1S8iNy1tb+we/caYOA86bMnEolEYkn+AZY/bkCHk98BAAAAAElFTkSuQmCC\",\"type\":[\"index\",\"article_list\",\"pic_list\"],\"article_type\":\"list-type-1\",\"unique\":1625715123},{\"sorts\":\"st-nav\",\"name\":\"导航\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADIAgMAAADQNkYNAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAAlQTFRFAAAA5ubmAAAAF/49xAAAAAF0Uk5TAEDm2GYAAAABYktHRACIBR1IAAAACXBIWXMAAABIAAAASABGyWs+AAAASElEQVRo3u3UoQ0AMAwDwZDuV9L9V+kAlQqCIvmeWkddpejWedvfAUEQBEEQBEEQBEGQ6URSZmNPCUEQBEEQBEEQBEGQNlFsFys0TXk1zfreAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIxLTAxLTIxVDA5OjQxOjIzKzA4OjAw2PWkZwAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMS0wMS0yMVQwOTo0MToyMyswODowMKmoHNsAAABQdEVYdHN2ZzpiYXNlLXVyaQBmaWxlOi8vL2hvbWUvYWRtaW4vaWNvbi1mb250L3RtcC9pY29uXzd1cXMyN2ZlcWh2L2ljX21vZGVfYmxvY2suc3ZnHyf84AAAAABJRU5ErkJggg==\",\"type\":[\"index\",\"cover\",\"article\",\"art_list\",\"pic_list\",\"us\"],\"nav_style\":\"style-1\",\"nav_right\":\"login\",\"nav_bgc\":\"\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\nav\"},{\"sorts\":\"st-minibanner\",\"name\":\"图片\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAD4AAAAwCAYAAABJy8k0AAADIUlEQVRoge2aPWgUQQCFB38RRYn4l+B/xCKFjdpo4Q9CsLKxSKEBRQvRQtRCrBTUxkrsIjaaQg4UQYkkl31vdnbvCOHAJqciIaBYqY1YWPhzFncLlzM7O7N3e3uXy4NX3HHzeB8zNzOXjRBCCMdxjgJ4BkDOY08D8EmeFEIIQfImyVKH+aIA8K0FijTVAD6LmjdOkDw8Hw3gcTXrLHCl1HoxTwXgbih4LpfbkHbBpLQAvgBe9WJ8fHxj2gWTkhac5Lq0C4aJ5D4AQyQ/VLp+BTDkOE6v4fjbOvBNSQPEEcnhmp6zDGAwKgPAnbYCJ/lSBx1YSrlfl9NW4CRPmUBXnNVltRu4ZwFe8n2/JyxLC66U6m4mWJRI/rQBl1IeCctqN3Bj6Ar46bAsLbhuqaQhkjOW4MfDsrTneAvO+FMb8Hw+vzYsq62WOoCDptAA7kdkaXf1zc2CMhWAKwbQOYOc9gIXQgiSx0i+nQO4SPKqSUbUXT0WuO/7PSQzccbaSCnVx/JfU/Zms9k1NmO1M+667pY4hVhW5PcsTWlnPA64lPJCzao5l0TxeqUF931/q02Y4zi9rLldAfitu0GlpYaBl0qlRQAKIbvsd8/zdicJYistuOM42yyCbkQcMzMTExOrk4SxUUPAlVJ7SP6KAC+RRCaTWRy3LMkBksP1ZASKOs62RwUUi8VlJN8ZQAd+GLPoIMm/lYznJJfEyanKqw+c5D0L6MCXbUpKKc9XQQd+VSgUliYC7rruDt1g13UPzFEo0gD+AOg3KUjykiZrLC58bPDR0dGVAD7GmO3AP5RSfRHQ1wxyxkZGRpY3DRzAozqgA3/yPK8rJP+WRQ7z+fyKhoF7nrczZFB/A6BLLC97v3a5Msa+ASBHclVi4J7ndZH80ijwip9UQT+oI2fSFD7qHP/vqQTJFw2GDny98mSk3pxJk4uSFXjlLE0CutF+E7Z3GIGT3BV8UCnVDeB7C0AZGcAUNc/+jMFZVupAlvDvw+CjwDvGC+Cd5gXwTnPngtf5i6stDWBaADibdpFmW0p5JrisDLTAv1Un7SmSrwEcEkKIf7/OIuh6zYZ9AAAAAElFTkSuQmCC\",\"type\":[\"index\",\"cover\",\"article\",\"art_list\",\"pic_list\",\"us\"],\"img_style\":\"style-1\",\"img_button\":\"\",\"img_serve_url\":\"http://qz.thinkphpcode.com/static/pc/imgs/index-item1-2.jpg\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\miniBanner\"},{\"sorts\":\"st-cover\",\"name\":\"封面\",\"img_url\":\"data:image/png;base64,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\",\"type\":[\"cover\",\"article\",\"art_list\",\"pic_list\",\"pro_list\"],\"cover_data\":0,\"cover_bgc\":\"\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\cover\"},{\"sorts\":\"st-footer\",\"name\":\"页脚\",\"img_url\":\"/cms/img/st-tabs.ec3c73a2.png\",\"type\":[\"index\",\"cover\",\"article\",\"art_list\",\"pic_list\",\"us\"],\"fot_style\":\"style-4\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\footer\",\"fot_list_bgc\":\"\"}]}', 'article_list', 'undefined', '#fff', NULL, '', 0),
(1033, 'http://localhost:8080/h5/#/pages/study/plan/plan', '学习计划', '{\"id\":\"sort-1\",\"level\":1,\"child\":[{\"sorts\":\"st-plan\",\"name\":\"学习计划\",\"img_url\":\"data:image/png;base64,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\",\"type\":[\"index\",\"cover\",\"article\",\"article_list\",\"pic_list\",\"us\"],\"unique\":1625716799}],\"disable\":false}', 'cover', 'article', '#fff', NULL, '', 0),
(1037, 'http://localhost:8080/h5/#/pages/user/index', '我的', '{\"id\":1018,\"level\":1,\"disable\":false,\"child\":[{\"sorts\":\"st-qrcode\",\"name\":\"二维码\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAADnUlEQVRoQ+1ZvWsUQRR/s3utYBMLQYggKUxjqVZJaSM2BkQLL9nZI4VWNlbGf0GLcDPjXiCIYIgRkRQ2SaWksrOxMAg2SSOksNndJxN2lslk9vZj7pJcuO3uZuY385v3/YbAiH9kxM8POYFer3cxjuM5AHjgQooQsouIXyil73QcxthDQkjggi3XIqIIw/CtwskJdLvde57nbbhukK3fb7VaU+12+6/8vby8PNlqtX4NCBviOL66uLi4K/F0Akue570AgFlK6XbTzbrd7jEc239N8DnnMwCwlabpy06nszQmYLvFsQT66FYjFcoWSds49kmPEwRBWx+oKwEhxAYiXjTBJTYAbAZBsKbGmhLYAgBpPNZPNyg5oQ4BbW4lbCcClNIjQc8G5kDgiOcrwh4T0OU8lkCBvchLGooKSWM1LU1G7kEYcVXsRjZQ5il835+en5//ocjV8ULqQEUeDhHbYRiuOLlRTaTH9knT9F+n09lxiQNRFF1PkuSSCR7H8a5K2JwJ1Em86kigDm6RbYyzUfMWT00CjLHHhJAeADSuBTIyEwAwrRcdmrG6YsstZFqTR+5chbKq6TkAhHV1U5+flZTrlNJnRuB7BQBPXLCzta8ppU8Vzvkp6gdwM6cCcf4kIL2Iy1VKG9Cjp47FGJsihFwuw/d9f0+P7pkTyJfpTYdcAkKIa4j4swy8yjghZCcIgpuGEfctjCy4h57Glsr07UoQQuYQcb/KQW1z0jSdMdszjLEbhJDvALCWpmmeNxXtIaXo+/76wsLCgbx9ianmmgnkiUTiovS47iU1ykbrbmKLxLaNOecfEXE1DMP1qnucGQJRFF1JkuQ3ALyhlB7pl5oGayFXvzNXBGp6C7lZFQkUESirDxSZWq3FsoLG7KW6EFAXUKZSnudtK1daasSc80P3V7Xsq0JAHpAxtkEIWaWUfig7cL/xygRc+kKD8kJRFE0kSbKnl5ojRaCRF1IqNCwJcM4/AcAFi5ocUErvGtG8/vvAIAhkz1fy9YeZT0+cc7TpOCHkWxAEt50JCCE2EfFOkSFV6Qv1M8KMgPQqs2XG3EiFJCjn/D0AyFLR/P5QSh/pf9Z9TjoRAmU3U4WAJJam6Yql1yNVaLgScCXQz42OhAROlMAw6gGdgEwDpERVKjAwCQyzIrMlacp76QSEEF8R8VaZylqTObVoWDWxiasSMiHEfdkkDsPws2yuIeJkBQK5Mzh/XYky9mdt/D8z0xt8hodtxAAAAABJRU5ErkJggg==\",\"type\":[\"index\",\"cover\",\"article\",\"article_list\",\"order\",\"pic_list\",\"us\"],\"unique\":1625798214}]}', 'us', 'undefined', '#fff', NULL, '', 0),
(1039, 'http://localhost:8080/h5/#/pages/article_list/article/article', '文章详情', '{\"id\":1018,\"level\":1,\"disable\":false,\"child\":[{\"sorts\":\"st-server-title\",\"name\":\"数据标题\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADIAgMAAADQNkYNAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAAlQTFRFAAAA5ubmAAAAF/49xAAAAAF0Uk5TAEDm2GYAAAABYktHRACIBR1IAAAACXBIWXMAAABIAAAASABGyWs+AAAASElEQVRo3u3UoQ0AMAwDwZDuV9L9V+kAlQqCIvmeWkddpejWedvfAUEQBEEQBEEQBEGQ6URSZmNPCUEQBEEQBEEQBEGQNlFsFys0TXk1zfreAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIxLTAxLTIxVDA5OjQxOjIzKzA4OjAw2PWkZwAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMS0wMS0yMVQwOTo0MToyMyswODowMKmoHNsAAABQdEVYdHN2ZzpiYXNlLXVyaQBmaWxlOi8vL2hvbWUvYWRtaW4vaWNvbi1mb250L3RtcC9pY29uXzd1cXMyN2ZlcWh2L2ljX21vZGVfYmxvY2suc3ZnHyf84AAAAABJRU5ErkJggg==\",\"type\":[\"cover\",\"article\"],\"server_title_type\":\"center\",\"server_title_time\":true,\"server_title_soure\":true,\"unique\":1625792838},{\"sorts\":\"st-html\",\"name\":\"数据文本\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADIAgMAAADQNkYNAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAAlQTFRFAAAA5ubmAAAAF/49xAAAAAF0Uk5TAEDm2GYAAAABYktHRACIBR1IAAAACXBIWXMAAABIAAAASABGyWs+AAAASElEQVRo3u3UoQ0AMAwDwZDuV9L9V+kAlQqCIvmeWkddpejWedvfAUEQBEEQBEEQBEGQ6URSZmNPCUEQBEEQBEEQBEGQNlFsFys0TXk1zfreAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIxLTAxLTIxVDA5OjQxOjIzKzA4OjAw2PWkZwAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMS0wMS0yMVQwOTo0MToyMyswODowMKmoHNsAAABQdEVYdHN2ZzpiYXNlLXVyaQBmaWxlOi8vL2hvbWUvYWRtaW4vaWNvbi1mb250L3RtcC9pY29uXzd1cXMyN2ZlcWh2L2ljX21vZGVfYmxvY2suc3ZnHyf84AAAAABJRU5ErkJggg==\",\"type\":[\"cover\",\"article\"],\"unique\":1625792837}]}', 'article', 'undefined', '#fff', NULL, '', 0),
(1040, 'http://localhost:8080/h5/#/pages/order/order', '订单', '{\"id\":1018,\"level\":1,\"disable\":false,\"child\":[{\"sorts\":\"st-order\",\"name\":\"订单\",\"img_url\":\"data:image/png;base64,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\",\"type\":[\"index\",\"cover\",\"order\",\"us\"],\"unique\":1625796340},{\"sorts\":\"st-server-title\",\"name\":\"数据标题\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADIAgMAAADQNkYNAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAAlQTFRFAAAA5ubmAAAAF/49xAAAAAF0Uk5TAEDm2GYAAAABYktHRACIBR1IAAAACXBIWXMAAABIAAAASABGyWs+AAAASElEQVRo3u3UoQ0AMAwDwZDuV9L9V+kAlQqCIvmeWkddpejWedvfAUEQBEEQBEEQBEGQ6URSZmNPCUEQBEEQBEEQBEGQNlFsFys0TXk1zfreAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIxLTAxLTIxVDA5OjQxOjIzKzA4OjAw2PWkZwAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMS0wMS0yMVQwOTo0MToyMyswODowMKmoHNsAAABQdEVYdHN2ZzpiYXNlLXVyaQBmaWxlOi8vL2hvbWUvYWRtaW4vaWNvbi1mb250L3RtcC9pY29uXzd1cXMyN2ZlcWh2L2ljX21vZGVfYmxvY2suc3ZnHyf84AAAAABJRU5ErkJggg==\",\"type\":[\"cover\",\"article\"],\"server_title_type\":\"center\",\"server_title_time\":true,\"server_title_soure\":true,\"unique\":1625792838},{\"sorts\":\"st-html\",\"name\":\"数据文本\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADIAgMAAADQNkYNAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAAlQTFRFAAAA5ubmAAAAF/49xAAAAAF0Uk5TAEDm2GYAAAABYktHRACIBR1IAAAACXBIWXMAAABIAAAASABGyWs+AAAASElEQVRo3u3UoQ0AMAwDwZDuV9L9V+kAlQqCIvmeWkddpejWedvfAUEQBEEQBEEQBEGQ6URSZmNPCUEQBEEQBEEQBEGQNlFsFys0TXk1zfreAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIxLTAxLTIxVDA5OjQxOjIzKzA4OjAw2PWkZwAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMS0wMS0yMVQwOTo0MToyMyswODowMKmoHNsAAABQdEVYdHN2ZzpiYXNlLXVyaQBmaWxlOi8vL2hvbWUvYWRtaW4vaWNvbi1mb250L3RtcC9pY29uXzd1cXMyN2ZlcWh2L2ljX21vZGVfYmxvY2suc3ZnHyf84AAAAABJRU5ErkJggg==\",\"type\":[\"cover\",\"article\"],\"unique\":1625792837}]}', 'order', 'undefined', '#f4f4f5', 'null', '', 0),
(1041, 'http://localhost:8080/h5/#/pages/study/evaluating/evaluating', '学习评测', '{\"id\":1018,\"level\":1,\"disable\":false,\"child\":[{\"sorts\":\"st-title\",\"name\":\"标题\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAACp0lEQVRoQ+1Yi3ETMRTcVwFOBZAKCBXgTQOEChIqIFRA0kGogKQCTAP3TAWEDkwFOBWI2RvJI3ssDiz/jjnNeM6+u/fZ99kn2dDzZT33HwOAQ2dwyMCQgcoI9L+E3P0KwPNNAkHy1t3HAD4CmAN4R1LXzuXudwBe6kWS7BQovGBN00zN7PUmCkiau/8CMIryX0le5Lrc/QWAS4HN7+d2pWcT+5LZBoCQGV8C4O5fALSAVp3cGoAS8r81oBIMIagc5mZ2QfIx6XT3BbijBfCn1PcCQGzi1EMPEdBlvN5kANP3nyTvuzLs7u8BiCBSf4kcJiSTjVZ1sXm6DGRlIsfEQm2px6uXMhNC+HZ+fj4u6Xf3MwDqHTX/uqUSFXG1bLcLAPPYE8jZTY63Bs0eSV6vA+Duivb35LxkzGwquRDCONMnHa92AoBka1DrX3sgzgaVjtYDSc2oxXL3PNsfSN5tPQOVAPKZcrJuKDZNI7Z7BmBG8vRoAEQySL0zA3Bf6AFlJfXHybECKHHA6v3yCN+UhTYtoTwDIYQnAIuBWEJjZtfHlAHRpxhIa8EyXak4GgByNGtQ/TwlqV7IWUg0+zkOtydtHHcKoGmamZmlrfoSqxTmQE6TouO3ORO5u5xP1PpJ82SnANx9AuDNShnckrwpDbIQgrb37TlBVBk/+i7madknhPDDzMYCt2sAZyGESZYF2S8CiMNvFGXWnlHidL5K5VUEEPck7UYqZ5bVpooHlsTLar6lE1ncHqhB09IAmnXpj891llAQRnFLMV31ZeOTUBc77Ov5AGBfkS4Os0M7UGt/KKHaCNbK63+d/Nxaq2/v8gKQ/6+zdwdqDQ4AaiNYKz+wUG0Ea+X7n4GBRmtroFL+v6DRfk/iygweXLz/LHTwEFY60PsM/Ab66dzaOfXFjwAAAABJRU5ErkJggg==\",\"type\":[\"index\",\"cover\",\"article\",\"article_list\",\"pic_list\",\"us\"],\"title_type\":\"list-type-2\",\"title_text\":\"标题\",\"unique\":1625800601},{\"sorts\":\"st-chart\",\"name\":\"图表\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAEHUlEQVRoQ+2ZTYgcRRTH36txBXFRVJQcRAQRRQIRXNCDaDwIguDJgzmoZLZez6yo6xfiBywuEvELNYmy2/1qEvUgYQ6KkktE2KAsQVBRhHxoXBRBEGJYl712PamlVybjTE9VTctsYBqGOcx7//d+9a/qrupBOM8vPM/7hzHAqB0cO9DtQLvdvnB1dXVKKXW9tXYbIl5MRHP/l1OVOLC0tHTBysrK7jzP70fEuwHOWVsniOimLQvAzM8BwDMAcEWfJrcmQJZldwLAXkTcMWB0NwCYeScAfIKIR621PymlPtNaLw/rTNQUyrLsEUR8z7N4J8BSV84viHgYERemp6dPeeqdExYMwMwvAMCegGJlAJsyZxDxDa316wG6G6FBAGmaPqmUeiuwiA/ApuQRIronRN8bwBhzr4gcDhEvYkMAXMpvRHStbx0vgHa7fdHa2tpxEfEW7mggFMCl/klE23wgvACY+U0AeNpHsEdMDICT2UdEs4NqDgRg5qsB4PdBQiW/xwKAtXa+0Wi8VFZ7IECWZfOIOMxWIBoAAM4i4q1a69P9IAYCGGNOisgNo3CgqLmfiB6PAjDGbBeRH4do3qUO48BG6Vqtdk29Xu85jUsdaLVaZK3NRg2AiLu01od69VEKwMz7AOCxUQOIyLtJkvTsoxTAGPOpiNw3agAAWCai22McOAYAt20BgFNEdGMwwMLCQsyT9z91ZmZmfi220927Ud+xOUNEVwYDuIQ0TS/1rdIvbmJi4pI8z68DgFgAIKKe033gc4CZzwLAZbEQInJofX29Pjk5eQARH4jUiXeAmb8BgFsiC88R0cvMvAsAPorUcGlxa8BlZlnWQsR6YPG/AaBORB9nWfYgIn4YmN8dHncXcirM/BAAfBDQwDFrbb3RaJxk5t0AcCAgt1/oi0T0StQiNsZcLiJ/eTbRIiLtYo0xWkTYM680LM/zm5vN5g9RAIULzgHnRN8LEZ/SWr9dTLumO6hX0byIfJ0kSd9n0cC7UAHgFrFbzL2uP0SkniTJEfdjmqaPKqX2V9F8odEgor77MS+AAqLXvuiLWq1W39wpGmNmReSdCpv/loimSp33LZam6YRS6jsA2O5yEHGv1vqJzXxmdkdOd/Ss8iod/Y0+Qqq1Wq0pa+1XADDbaasx5lkReS1EyyP2IBENvH0HAbiii4uLOzrvCBEvujx6h6NEdJdPYDBAp2iWZXOIOO9TKCDmVSJ63jd+KIA0TR9WSr3vW8wjzj29D3rE/RsyFEAxpe6o1WrudWPsfglE5HNr7Z5ms/llSPPBi7hMnJkTAHCfEJATImKSJAl931qdA91Q7uBird2plHL/H7hDyFXF92lE/FlE3Pf3iLgc+0q9s+bQUyjU8qrjxwBVj2io3tiB0BGrOn7sQNUjGqr3D6pZoUC/Wgl3AAAAAElFTkSuQmCC\",\"type\":[\"index\",\"cover\",\"article_list\",\"pic_list\",\"us\"],\"chart_style\":\"radar\",\"unique\":1625800598},{\"sorts\":\"st-title\",\"name\":\"标题\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAACp0lEQVRoQ+1Yi3ETMRTcVwFOBZAKCBXgTQOEChIqIFRA0kGogKQCTAP3TAWEDkwFOBWI2RvJI3ssDiz/jjnNeM6+u/fZ99kn2dDzZT33HwOAQ2dwyMCQgcoI9L+E3P0KwPNNAkHy1t3HAD4CmAN4R1LXzuXudwBe6kWS7BQovGBN00zN7PUmCkiau/8CMIryX0le5Lrc/QWAS4HN7+d2pWcT+5LZBoCQGV8C4O5fALSAVp3cGoAS8r81oBIMIagc5mZ2QfIx6XT3BbijBfCn1PcCQGzi1EMPEdBlvN5kANP3nyTvuzLs7u8BiCBSf4kcJiSTjVZ1sXm6DGRlIsfEQm2px6uXMhNC+HZ+fj4u6Xf3MwDqHTX/uqUSFXG1bLcLAPPYE8jZTY63Bs0eSV6vA+Duivb35LxkzGwquRDCONMnHa92AoBka1DrX3sgzgaVjtYDSc2oxXL3PNsfSN5tPQOVAPKZcrJuKDZNI7Z7BmBG8vRoAEQySL0zA3Bf6AFlJfXHybECKHHA6v3yCN+UhTYtoTwDIYQnAIuBWEJjZtfHlAHRpxhIa8EyXak4GgByNGtQ/TwlqV7IWUg0+zkOtydtHHcKoGmamZmlrfoSqxTmQE6TouO3ORO5u5xP1PpJ82SnANx9AuDNShnckrwpDbIQgrb37TlBVBk/+i7madknhPDDzMYCt2sAZyGESZYF2S8CiMNvFGXWnlHidL5K5VUEEPck7UYqZ5bVpooHlsTLar6lE1ncHqhB09IAmnXpj891llAQRnFLMV31ZeOTUBc77Ov5AGBfkS4Os0M7UGt/KKHaCNbK63+d/Nxaq2/v8gKQ/6+zdwdqDQ4AaiNYKz+wUG0Ea+X7n4GBRmtroFL+v6DRfk/iygweXLz/LHTwEFY60PsM/Ab66dzaOfXFjwAAAABJRU5ErkJggg==\",\"type\":[\"index\",\"cover\",\"article\",\"article_list\",\"pic_list\",\"us\"],\"title_type\":\"list-type-2\",\"title_text\":\"标题\",\"unique\":1625800576},{\"sorts\":\"st-chart\",\"name\":\"图表\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAEHUlEQVRoQ+2ZTYgcRRTH36txBXFRVJQcRAQRRQIRXNCDaDwIguDJgzmoZLZez6yo6xfiBywuEvELNYmy2/1qEvUgYQ6KkktE2KAsQVBRhHxoXBRBEGJYl712PamlVybjTE9VTctsYBqGOcx7//d+9a/qrupBOM8vPM/7hzHAqB0cO9DtQLvdvnB1dXVKKXW9tXYbIl5MRHP/l1OVOLC0tHTBysrK7jzP70fEuwHOWVsniOimLQvAzM8BwDMAcEWfJrcmQJZldwLAXkTcMWB0NwCYeScAfIKIR621PymlPtNaLw/rTNQUyrLsEUR8z7N4J8BSV84viHgYERemp6dPeeqdExYMwMwvAMCegGJlAJsyZxDxDa316wG6G6FBAGmaPqmUeiuwiA/ApuQRIronRN8bwBhzr4gcDhEvYkMAXMpvRHStbx0vgHa7fdHa2tpxEfEW7mggFMCl/klE23wgvACY+U0AeNpHsEdMDICT2UdEs4NqDgRg5qsB4PdBQiW/xwKAtXa+0Wi8VFZ7IECWZfOIOMxWIBoAAM4i4q1a69P9IAYCGGNOisgNo3CgqLmfiB6PAjDGbBeRH4do3qUO48BG6Vqtdk29Xu85jUsdaLVaZK3NRg2AiLu01od69VEKwMz7AOCxUQOIyLtJkvTsoxTAGPOpiNw3agAAWCai22McOAYAt20BgFNEdGMwwMLCQsyT9z91ZmZmfi220927Ud+xOUNEVwYDuIQ0TS/1rdIvbmJi4pI8z68DgFgAIKKe033gc4CZzwLAZbEQInJofX29Pjk5eQARH4jUiXeAmb8BgFsiC88R0cvMvAsAPorUcGlxa8BlZlnWQsR6YPG/AaBORB9nWfYgIn4YmN8dHncXcirM/BAAfBDQwDFrbb3RaJxk5t0AcCAgt1/oi0T0StQiNsZcLiJ/eTbRIiLtYo0xWkTYM680LM/zm5vN5g9RAIULzgHnRN8LEZ/SWr9dTLumO6hX0byIfJ0kSd9n0cC7UAHgFrFbzL2uP0SkniTJEfdjmqaPKqX2V9F8odEgor77MS+AAqLXvuiLWq1W39wpGmNmReSdCpv/loimSp33LZam6YRS6jsA2O5yEHGv1vqJzXxmdkdOd/Ss8iod/Y0+Qqq1Wq0pa+1XADDbaasx5lkReS1EyyP2IBENvH0HAbiii4uLOzrvCBEvujx6h6NEdJdPYDBAp2iWZXOIOO9TKCDmVSJ63jd+KIA0TR9WSr3vW8wjzj29D3rE/RsyFEAxpe6o1WrudWPsfglE5HNr7Z5ms/llSPPBi7hMnJkTAHCfEJATImKSJAl931qdA91Q7uBird2plHL/H7hDyFXF92lE/FlE3Pf3iLgc+0q9s+bQUyjU8qrjxwBVj2io3tiB0BGrOn7sQNUjGqr3D6pZoUC/Wgl3AAAAAElFTkSuQmCC\",\"type\":[\"index\",\"cover\",\"article_list\",\"pic_list\",\"us\"],\"chart_style\":\"line\",\"unique\":1625800595},{\"sorts\":\"st-server-title\",\"name\":\"数据标题\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADIAgMAAADQNkYNAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAAlQTFRFAAAA5ubmAAAAF/49xAAAAAF0Uk5TAEDm2GYAAAABYktHRACIBR1IAAAACXBIWXMAAABIAAAASABGyWs+AAAASElEQVRo3u3UoQ0AMAwDwZDuV9L9V+kAlQqCIvmeWkddpejWedvfAUEQBEEQBEEQBEGQ6URSZmNPCUEQBEEQBEEQBEGQNlFsFys0TXk1zfreAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIxLTAxLTIxVDA5OjQxOjIzKzA4OjAw2PWkZwAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMS0wMS0yMVQwOTo0MToyMyswODowMKmoHNsAAABQdEVYdHN2ZzpiYXNlLXVyaQBmaWxlOi8vL2hvbWUvYWRtaW4vaWNvbi1mb250L3RtcC9pY29uXzd1cXMyN2ZlcWh2L2ljX21vZGVfYmxvY2suc3ZnHyf84AAAAABJRU5ErkJggg==\",\"type\":[\"cover\",\"article\"],\"server_title_type\":\"center\",\"server_title_time\":true,\"server_title_soure\":true,\"unique\":1625792838},{\"sorts\":\"st-html\",\"name\":\"数据文本\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADIAgMAAADQNkYNAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAAlQTFRFAAAA5ubmAAAAF/49xAAAAAF0Uk5TAEDm2GYAAAABYktHRACIBR1IAAAACXBIWXMAAABIAAAASABGyWs+AAAASElEQVRo3u3UoQ0AMAwDwZDuV9L9V+kAlQqCIvmeWkddpejWedvfAUEQBEEQBEEQBEGQ6URSZmNPCUEQBEEQBEEQBEGQNlFsFys0TXk1zfreAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIxLTAxLTIxVDA5OjQxOjIzKzA4OjAw2PWkZwAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMS0wMS0yMVQwOTo0MToyMyswODowMKmoHNsAAABQdEVYdHN2ZzpiYXNlLXVyaQBmaWxlOi8vL2hvbWUvYWRtaW4vaWNvbi1mb250L3RtcC9pY29uXzd1cXMyN2ZlcWh2L2ljX21vZGVfYmxvY2suc3ZnHyf84AAAAABJRU5ErkJggg==\",\"type\":[\"cover\",\"article\"],\"unique\":1625792837}]}', 'index', 'undefined', '#fff', NULL, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `rh_star_order`
--

CREATE TABLE `rh_star_order` (
  `id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '完成进度',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '0未完成1已完成2已过期',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `course_id` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='助力订单';

--
-- 转存表中的数据 `rh_star_order`
--

INSERT INTO `rh_star_order` (`id`, `task_id`, `uid`, `num`, `state`, `create_time`, `update_time`, `course_id`, `ucid`) VALUES
(1, 2, 1, 3, 0, 1622524610, 1622525570, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `rh_star_task`
--

CREATE TABLE `rh_star_task` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '活动名称',
  `course_id` int(11) NOT NULL DEFAULT '0' COMMENT '课程id',
  `star` int(11) NOT NULL DEFAULT '0' COMMENT '助力数量',
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `json` text,
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='助力任务表';

--
-- 转存表中的数据 `rh_star_task`
--

INSERT INTO `rh_star_task` (`id`, `name`, `course_id`, `star`, `start_time`, `end_time`, `json`, `create_time`, `update_time`, `ucid`) VALUES
(1, '助力', 0, 0, 1625068800, 1625932800, '[]', 1625447799, 1625447799, 0),
(2, '助力', 0, 0, 1625068800, 1625932800, '[]', 1625447920, 1625447920, 0),
(3, '助力', 0, 0, 1625068800, 1625932800, '[]', 1625449732, 1625449732, 0);

-- --------------------------------------------------------

--
-- 表的结构 `rh_star_task_goods`
--

CREATE TABLE `rh_star_task_goods` (
  `task_id` int(11) NOT NULL DEFAULT '0',
  `course_id` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `star` int(11) NOT NULL DEFAULT '0' COMMENT '助力人数',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='活动商品表';

--
-- 转存表中的数据 `rh_star_task_goods`
--

INSERT INTO `rh_star_task_goods` (`task_id`, `course_id`, `create_time`, `update_time`, `star`, `ucid`) VALUES
(2, 2, 1625447920, 1625447920, 10, 0),
(3, 2, 1625449732, 1625449732, 10, 0);

-- --------------------------------------------------------

--
-- 表的结构 `rh_star_user`
--

CREATE TABLE `rh_star_user` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '任务id',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='助力用户';

--
-- 转存表中的数据 `rh_star_user`
--

INSERT INTO `rh_star_user` (`id`, `uid`, `order_id`, `create_time`, `update_time`, `ucid`) VALUES
(14, 1, 1, 1622525570, 1622525570, 0);

-- --------------------------------------------------------

--
-- 表的结构 `rh_student`
--

CREATE TABLE `rh_student` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '学生姓名',
  `img` varchar(255) DEFAULT NULL COMMENT '学生头像',
  `age` int(11) NOT NULL DEFAULT '0' COMMENT '学生年龄',
  `sex` int(11) NOT NULL DEFAULT '0' COMMENT '学生性别0男1女',
  `mobile` varchar(20) DEFAULT NULL COMMENT '学生电话',
  `person` int(11) NOT NULL DEFAULT '0' COMMENT '家长id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '学生绑定用户id',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  `label` text COMMENT '标签',
  `fee_course_num` int(11) NOT NULL DEFAULT '0' COMMENT '交费课时',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学生表';

--
-- 转存表中的数据 `rh_student`
--

INSERT INTO `rh_student` (`id`, `name`, `img`, `age`, `sex`, `mobile`, `person`, `uid`, `create_time`, `update_time`, `delete_time`, `label`, `fee_course_num`, `ucid`) VALUES
(1, '张小花C', NULL, 12, 1, '', 0, 0, 1619765352, 1619765352, 0, '[4,1]', 30, 0),
(2, '李小虎A', NULL, 12, 0, '', 0, 0, 1619765481, 1619765650, 1619765650, '[2]', 30, 0),
(3, '李小A', NULL, 8, 0, '', 0, 0, 1619765520, 1619765648, 1619765648, '[2]', 30, 0),
(4, '李小小A', NULL, 13, 0, '', 0, 0, 1619765553, 1619765553, 0, '[2]', 30, 0),
(5, '小明', NULL, 12, 0, '', 0, 1, 1619765587, 1620269317, 0, '[3]', 30, 0),
(6, '张小花B', NULL, 12, 1, '', 0, 0, 1619765352, 1619765352, 0, '[4,1]', 30, 0),
(7, '张小花A', NULL, 12, 1, '', 0, 0, 1619765352, 1619765352, 0, '[4,1]', 30, 0),
(8, '李小虎', NULL, 12, 0, '', 0, 9, 1619765481, 1635132563, 0, '[2]', 30, 0),
(9, '李小A', NULL, 8, 0, '', 0, 0, 1619765520, 1619765520, 0, '[2]', 30, 0),
(10, '李小小', NULL, 13, 0, '', 0, 0, 1619765553, 1619765553, 0, '[2]', 30, 0),
(11, '小明A', NULL, 12, 0, '', 0, 2, 1619765587, 1620269656, 0, '[3]', 30, 0),
(12, '张小花', NULL, 12, 1, '', 0, 0, 1619765352, 1619765352, 0, '[4,1]', 30, 0),
(13, '12', NULL, 0, 0, '', 0, 0, 1635149706, 1635149706, 0, '[1]', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `rh_study_history`
--

CREATE TABLE `rh_study_history` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL DEFAULT '0' COMMENT '课程Id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学习轨迹';

-- --------------------------------------------------------

--
-- 表的结构 `rh_stu_label`
--

CREATE TABLE `rh_stu_label` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL COMMENT '标签名',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学生标签表';

--
-- 转存表中的数据 `rh_stu_label`
--

INSERT INTO `rh_stu_label` (`id`, `name`, `ucid`) VALUES
(1, '舞蹈女生', 0),
(2, '武术男生', 0),
(3, '油画男生', 0),
(4, '武术女生', 0);

-- --------------------------------------------------------

--
-- 表的结构 `rh_sys_config`
--

CREATE TABLE `rh_sys_config` (
  `id` int(11) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text,
  `desc` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1基础2微信3支付宝4短信5物流6上传配置',
  `switch` int(11) NOT NULL DEFAULT '0' COMMENT '0填写框1开关2单选3多选',
  `other` varchar(255) DEFAULT NULL,
  `delete_time` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置表' ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `rh_sys_config`
--

INSERT INTO `rh_sys_config` (`id`, `key`, `value`, `desc`, `type`, `switch`, `other`, `delete_time`, `ucid`) VALUES
(1, 'api_url', 'http://rhedu.ruhuashop.com', '入口位置', 1, 0, NULL, 0, 3),
(5, 'wx_app_id', 'wx40342b8063b72fc1', '小程序appid', 2, 0, NULL, 0, 3),
(6, 'wx_app_secret', 'bc8719518f6c5e792286832c2e47671b', '小程序秘钥', 2, 0, NULL, 0, 3),
(7, 'pay_num', '1514141031', '商户id', 2, 0, NULL, 0, 3),
(8, 'pay_key', 'asf983rhfsjkyhFSt5hDS45a23kj12h3', '商户key', 2, 0, NULL, 0, 3),
(9, 'wx_token_expire', '72000', 'token有效期', 1, 0, NULL, 0, 3),
(35, 'app_appid', '', 'app的appid', 2, 0, NULL, 0, 3),
(39, 'fx_royalty', '1', '提现方式', 1, 2, '0手动提现1自动打款', 1618996528, 3),
(40, 'yzm_tmp_id', '', '阿里云模板ID', 4, 0, NULL, 1618996528, 3),
(41, 'yzm_sign', '黔域', '阿里云短信签名', 4, 0, NULL, 1618996528, 3),
(42, 'yzm_keyid', '', '阿里云短信KeyId', 4, 0, NULL, 1618996528, 3),
(43, 'yzm_secret', '', '阿里云短信秘钥', 4, 0, NULL, 1618996528, 3),
(97, 'title', 'ABC培训机构', '系统标题', 1, 0, NULL, 0, 3),
(98, 'copyright', 'CCLV@1209', '版权信息', 1, 0, NULL, 0, 3),
(99, 'yd_id', '11bcff0645f00f79', '有道智云id', 1, 0, NULL, 0, 3),
(100, 'yd_key', 'AEm3aw8mWjGykQPBqVDL18LqA857gpAT', '有道智云秘钥', 1, 0, NULL, 0, 3),
(101, 'page_theme', '#00f', '页面主题', 1, 1, NULL, 0, 3),
(102, 'address', '1', '公司地址', 1, 0, NULL, 0, 3),
(103, 'phone', '1', '联系电话', 1, 0, NULL, 0, 3),
(104, 'date', '1', '营业时间', 1, 0, NULL, 0, 3),
(105, 'name', '1', '公司名称', 1, 0, NULL, 0, 3),
(106, 'gzh_appid', 'wx5d1a2220005b9c0e', '公众号appid', 2, 0, NULL, 0, 3),
(107, 'gzh_secret', '5d62b991d040004100c3aad7cb87ebd7', '公众号秘钥', 2, 0, NULL, 0, 3);

-- --------------------------------------------------------

--
-- 表的结构 `rh_teacher`
--

CREATE TABLE `rh_teacher` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '教师名称',
  `label` text NOT NULL COMMENT '教师标签',
  `t_json` text COMMENT '教师简介',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '教师id',
  `header` varchar(255) DEFAULT NULL COMMENT '教师头像',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  `is_tui` int(11) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '教师改价额度',
  `already` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '教师已用额度',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='教师表';

--
-- 转存表中的数据 `rh_teacher`
--

INSERT INTO `rh_teacher` (`id`, `name`, `label`, `t_json`, `uid`, `header`, `create_time`, `update_time`, `delete_time`, `is_tui`, `money`, `already`, `ucid`) VALUES
(1, '李易峰', '', '{\"count\":\"<p style=\\\"white-space: normal;\\\"><strong>教学经历<\\/strong><\\/p><p style=\\\"white-space: normal;\\\"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/strong>&nbsp;&nbsp;&nbsp;&nbsp;某某学校&nbsp; 2008-2013<strong><br\\/><\\/strong><\\/p><p style=\\\"white-space: normal;\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;某某中学&nbsp; 20013-2019<\\/p><p style=\\\"white-space: normal;\\\"><strong>教学资质<\\/strong><\\/p><p style=\\\"white-space: normal;\\\"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/strong>教师资格证 [123348762-ttrx]<\\/p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;担任中华武术馆馆主<br style=\\\"white-space: normal;\\\"\\/><\\/p><p><br\\/><\\/p>\",\"xueli\":\"本科\",\"jinyan\":\"5年\"}', 2, 'http://192.168.124.16:8092/uploads/img/20210430/4432d34d5fe166bb0d6d913aa0f3549a.jpg', 1619764679, 1626245144, 0, 1, '2000.00', '0.00', 0),
(2, '刘诗诗', '', '{\"count\":\"<p style=\\\"white-space: normal;\\\"><strong>教学经历<\\/strong><\\/p><p style=\\\"white-space: normal;\\\"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/strong>&nbsp;&nbsp;&nbsp;&nbsp;某某学校&nbsp; 2008-2013<strong><br\\/><\\/strong><\\/p><p style=\\\"white-space: normal;\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;某某中学&nbsp; 20013-2019<\\/p><p style=\\\"white-space: normal;\\\"><strong>教学资质<\\/strong><\\/p><p style=\\\"white-space: normal;\\\"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/strong>教师资格证 [123348762-ttrx]<\\/p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;中国舞蹈戏剧学员<br\\/><\\/p>\",\"xueli\":\"本科\",\"jinyan\":\"3年\"}', 0, 'http://192.168.124.16:8092/uploads/img/20210430/6ad9d45e19084c1b4d3208e3a7052a38.jpg', 1619765084, 1626227815, 0, 1, '3000.00', '0.00', 0),
(3, '吴奇隆', '', '{\"count\":\"<p style=\\\"white-space: normal;\\\"><strong>教学经历<\\/strong><\\/p><p style=\\\"white-space: normal;\\\"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/strong>&nbsp;&nbsp;&nbsp;&nbsp;某某学校&nbsp; 2008-2013<strong><br\\/><\\/strong><\\/p><p style=\\\"white-space: normal;\\\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;某某中学&nbsp; 20013-2019<\\/p><p style=\\\"white-space: normal;\\\"><strong>教学资质<\\/strong><\\/p><p style=\\\"white-space: normal;\\\"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<\\/strong>教师资格证 [123348762-ttrx]<\\/p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;太极拳K1总冠军<br\\/><\\/p>\",\"xueli\":\"研究生\",\"jinyan\":\"6年\"}', 0, 'http://192.168.124.23:8099/uploads/img/20211026/207cfffe74d0623e82108e78937f2275.jpg', 1619765203, 1635220831, 0, 1, '5000.00', '0.00', 0),
(4, '123', '', '{\"count\":\"<p>123<\\/p>\",\"xueli\":\"123\",\"jinyan\":\"\"}', 0, 'http://192.168.124.23:8099/uploads/img/20211020/2b92ed9615f664bf731ff1cb3338a5ad.jpeg', 1635306352, 1635306352, 0, 0, '12.00', '0.00', 0),
(5, '123', '', '{\"count\":\"\",\"xueli\":\"\",\"jinyan\":\"\"}', 0, '', 1635306462, 1635306462, 0, 0, '0.00', '0.00', 0),
(6, '123', '', '{\"count\":\"\",\"xueli\":\"\",\"jinyan\":\"\"}', 0, '', 1635306557, 1635306557, 0, 0, '0.00', '0.00', 0),
(7, '123', '', '{\"count\":\"<p>123123<\\/p>\",\"xueli\":\"123\",\"jinyan\":\"\"}', 0, 'http://192.168.124.23:8099/uploads/img/20211020/2b92ed9615f664bf731ff1cb3338a5ad.jpeg', 1635306594, 1635306594, 0, 0, '123.00', '0.00', 0),
(8, '213', '', '{\"count\":\"<p>123<\\/p>\",\"xueli\":\"123\",\"jinyan\":\"\"}', 0, '', 1635306781, 1635306813, 0, 0, '123.00', '0.00', 3);

-- --------------------------------------------------------

--
-- 表的结构 `rh_tui`
--

CREATE TABLE `rh_tui` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `tui_num` varchar(30) DEFAULT NULL COMMENT '退款单号',
  `nickname` varchar(255) NOT NULL COMMENT '昵称',
  `order_num` varchar(40) NOT NULL COMMENT '订单号',
  `money` decimal(10,2) NOT NULL COMMENT '价钱',
  `message` varchar(255) NOT NULL COMMENT '信息',
  `ip` varchar(100) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0退款中1已退款2驳回中',
  `aid` int(11) NOT NULL DEFAULT '0',
  `wx_id` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `ucid` int(11) NOT NULL DEFAULT '3',
  `uid` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='退货管理表' ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `rh_tui`
--

INSERT INTO `rh_tui` (`id`, `order_id`, `tui_num`, `nickname`, `order_num`, `money`, `message`, `ip`, `status`, `aid`, `wx_id`, `remark`, `create_time`, `ucid`, `uid`) VALUES
(1, 19, NULL, '咩～', 'C714544461375767', '0.01', '请求退款', '192.168.124.19', 0, 0, 'wx40342b8063b72fc1', NULL, 1626319681, 3, 2),
(2, 19, NULL, '咩～', 'C714544461375767', '0.01', '请求退款', '192.168.124.16', 0, 0, 'wx40342b8063b72fc1', NULL, 1626319696, 3, 2),
(3, 9, NULL, '咩～', 'P602991124782873', '30.00', '请求退款', '192.168.124.19', 2, 0, 'wx40342b8063b72fc1', NULL, 1626320074, 3, 2),
(4, 21, NULL, '咩～', 'C715141477353909', '399.00', '请求退款', '192.168.124.19', 0, 0, 'wx40342b8063b72fc1', NULL, 1626328556, 3, 2);

-- --------------------------------------------------------

--
-- 表的结构 `rh_tui_form`
--

CREATE TABLE `rh_tui_form` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  `tid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(15) DEFAULT NULL COMMENT '电话',
  `address` varchar(255) DEFAULT NULL COMMENT '家庭住址',
  `kids` varchar(20) DEFAULT NULL COMMENT '孩子',
  `sex` int(11) NOT NULL DEFAULT '0' COMMENT '性别',
  `age` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='教师推广表单';

-- --------------------------------------------------------

--
-- 表的结构 `rh_user`
--

CREATE TABLE `rh_user` (
  `id` int(11) NOT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `openid_gzh` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL COMMENT '微信昵称',
  `headpic` varchar(255) DEFAULT NULL COMMENT '微信头像',
  `name` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(20) DEFAULT NULL COMMENT '电话号码',
  `project` int(11) NOT NULL DEFAULT '0' COMMENT '学科',
  `qrcode_xcx` varchar(255) DEFAULT NULL COMMENT '小程序分享码',
  `qrcode_gzh` varchar(255) DEFAULT NULL COMMENT 'H5分享码',
  `img` varchar(255) DEFAULT NULL COMMENT '真实头像',
  `fans` int(11) NOT NULL DEFAULT '0' COMMENT '粉丝数',
  `coach_time` varchar(255) NOT NULL DEFAULT '0小时' COMMENT '辅导时长',
  `rate` int(11) NOT NULL DEFAULT '5' COMMENT '综合评价',
  `job` int(11) NOT NULL DEFAULT '0' COMMENT '0普通用户1老师2家长',
  `unionid` varchar(255) DEFAULT NULL,
  `is_you` int(11) NOT NULL DEFAULT '0' COMMENT '优秀老师',
  `teacher_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '修改课程费用额度',
  `yj` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '佣金',
  `backgroud` varchar(255) DEFAULT NULL COMMENT '推荐封面图',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `session_key` varchar(255) DEFAULT NULL,
  `invite_code` int(11) NOT NULL DEFAULT '0' COMMENT '身份码',
  `chird` varchar(255) DEFAULT NULL COMMENT '孩子',
  `bind_code` varchar(10) DEFAULT NULL COMMENT '绑定教师的code',
  `t_json` text COMMENT '教师简介',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

--
-- 转存表中的数据 `rh_user`
--

INSERT INTO `rh_user` (`id`, `openid`, `openid_gzh`, `nickname`, `headpic`, `name`, `mobile`, `project`, `qrcode_xcx`, `qrcode_gzh`, `img`, `fans`, `coach_time`, `rate`, `job`, `unionid`, `is_you`, `teacher_money`, `yj`, `backgroud`, `create_time`, `update_time`, `session_key`, `invite_code`, `chird`, `bind_code`, `t_json`, `ucid`) VALUES
(10, 'oq_jb4rLOXUkdTcZPtrFfAtflJj8', NULL, '5ZKp772e', 'https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eo6V4KJDvtPjzLmEUIH8q99Ycble6ZrbSx0KxfOz9rdvEQv1EqFAmDicEhVPmeiauX0iapB454n9OlTQ/132', '李某人', NULL, 0, '/uploads/img/7650289xcxcode.png', NULL, NULL, 0, '0小时', 5, 2, 'o-6THw566fwte9gEQiFtHwqLTyX4', 0, '0.00', '0.00', NULL, 1635403093, 1635403137, 'B7c0m2Ih9A8CAt92ulbamQ==', 7650289, '李小虎', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `rh_user_course`
--

CREATE TABLE `rh_user_course` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学生课程表';

-- --------------------------------------------------------

--
-- 表的结构 `rh_user_project`
--

CREATE TABLE `rh_user_project` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  `label` int(11) NOT NULL DEFAULT '0' COMMENT '标签id',
  `tid` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户标签表';

--
-- 转存表中的数据 `rh_user_project`
--

INSERT INTO `rh_user_project` (`id`, `uid`, `label`, `tid`, `ucid`) VALUES
(15, 9, 2, 0, 0),
(16, 9, 3, 0, 0),
(17, 10, 2, 0, 0),
(18, 10, 3, 0, 0),
(19, 11, 8, 0, 0),
(20, 11, 3, 0, 0),
(21, 12, 8, 0, 0),
(22, 12, 7, 0, 0),
(59, 8, 7, 8, 0),
(60, 8, 3, 8, 0),
(61, 8, 8, 8, 0),
(183, 38, 9, 38, 0),
(184, 38, 14, 38, 0),
(185, 38, 6, 38, 0),
(186, 40, 15, 40, 0),
(187, 40, 14, 40, 0),
(188, 40, 9, 40, 0),
(193, 45, 9, 45, 0),
(194, 45, 7, 45, 0),
(218, 53, 8, 53, 0),
(219, 53, 7, 53, 0),
(220, 53, 5, 53, 0),
(238, 52, 5, 52, 0),
(239, 52, 3, 52, 0),
(240, 52, 7, 52, 0),
(253, 56, 3, 56, 0),
(254, 56, 7, 56, 0),
(255, 54, 9, 54, 0),
(256, 54, 5, 54, 0),
(257, 49, 5, 49, 0),
(258, 49, 8, 49, 0),
(259, 49, 2, 49, 0),
(266, 58, 9, 58, 0),
(267, 58, 7, 58, 0),
(268, 58, 3, 58, 0),
(278, 59, 15, 59, 0),
(281, 50, 5, 50, 0),
(282, 50, 3, 50, 0),
(283, 50, 8, 50, 0),
(284, 57, 9, 57, 0),
(285, 57, 5, 57, 0),
(295, 2, 5, 2, 0),
(296, 2, 1, 2, 0),
(300, 1, 3, 1, 0),
(303, 3, 3, 3, 0),
(304, 3, 1, 3, 0),
(306, 0, 5, 7, 0),
(307, 8, 9, 8, 3);

-- --------------------------------------------------------

--
-- 表的结构 `rh_video`
--

CREATE TABLE `rh_video` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='视频表';

--
-- 转存表中的数据 `rh_video`
--

INSERT INTO `rh_video` (`id`, `url`, `name`, `create_time`, `update_time`, `ucid`) VALUES
(1, '/uploads/video/20210430/9460b6b25a6b07894e013aa384f5717a.mp4', '视频', 1619764873, 1619764873, 0),
(2, '/uploads/video/20210430/932762c06be7b73dcbfaade2ecffb79c.mp4', '视频', 1619766761, 1619766761, 0),
(3, '/uploads/video/20210506/fd33399f41719a8ce738136ca7db657d.mp4', '视频', 1620265247, 1620265247, 0),
(4, '/uploads/video/20210507/283783a01fdda32006c6a60865f371ff.mp4', '视频', 1620353114, 1620353114, 0),
(5, '/uploads/video/20210712/1c8581b35adbe2620b4df718d004eac8.mp4', '视频', 1626067652, 1626067652, 0),
(6, '/uploads/video/20210712/af9e9418c810e426a3d7ed1e93d8b1df.mp4', '视频', 1626076870, 1626076870, 0);

--
-- 转储表的索引
--

--
-- 表的索引 `rh_admin`
--
ALTER TABLE `rh_admin`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_article`
--
ALTER TABLE `rh_article`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_auth_group`
--
ALTER TABLE `rh_auth_group`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `rh_auth_group_access`
--
ALTER TABLE `rh_auth_group_access`
  ADD KEY `group_id` (`group_id`) USING BTREE,
  ADD KEY `uid` (`aid`) USING BTREE;

--
-- 表的索引 `rh_auth_rule`
--
ALTER TABLE `rh_auth_rule`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `rh_banner`
--
ALTER TABLE `rh_banner`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_bind_teacher`
--
ALTER TABLE `rh_bind_teacher`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_card_number`
--
ALTER TABLE `rh_card_number`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_category`
--
ALTER TABLE `rh_category`
  ADD PRIMARY KEY (`category_id`);

--
-- 表的索引 `rh_classes`
--
ALTER TABLE `rh_classes`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_class_project`
--
ALTER TABLE `rh_class_project`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_class_stu`
--
ALTER TABLE `rh_class_stu`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_class_teacher`
--
ALTER TABLE `rh_class_teacher`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_course`
--
ALTER TABLE `rh_course`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_course_teacher`
--
ALTER TABLE `rh_course_teacher`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_experience`
--
ALTER TABLE `rh_experience`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_fx`
--
ALTER TABLE `rh_fx`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_image`
--
ALTER TABLE `rh_image`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `rh_image_category`
--
ALTER TABLE `rh_image_category`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `rh_kids`
--
ALTER TABLE `rh_kids`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_message`
--
ALTER TABLE `rh_message`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_msg`
--
ALTER TABLE `rh_msg`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_order`
--
ALTER TABLE `rh_order`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_pingce`
--
ALTER TABLE `rh_pingce`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_plan`
--
ALTER TABLE `rh_plan`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_project`
--
ALTER TABLE `rh_project`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_pt`
--
ALTER TABLE `rh_pt`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `rh_pt_goods`
--
ALTER TABLE `rh_pt_goods`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `rh_pt_item`
--
ALTER TABLE `rh_pt_item`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `rh_sortable`
--
ALTER TABLE `rh_sortable`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `rh_star_order`
--
ALTER TABLE `rh_star_order`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_star_task`
--
ALTER TABLE `rh_star_task`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_star_task_goods`
--
ALTER TABLE `rh_star_task_goods`
  ADD PRIMARY KEY (`task_id`,`course_id`);

--
-- 表的索引 `rh_star_user`
--
ALTER TABLE `rh_star_user`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_student`
--
ALTER TABLE `rh_student`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_study_history`
--
ALTER TABLE `rh_study_history`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_stu_label`
--
ALTER TABLE `rh_stu_label`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_sys_config`
--
ALTER TABLE `rh_sys_config`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `rh_teacher`
--
ALTER TABLE `rh_teacher`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_tui`
--
ALTER TABLE `rh_tui`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `rh_tui_form`
--
ALTER TABLE `rh_tui_form`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_user`
--
ALTER TABLE `rh_user`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_user_course`
--
ALTER TABLE `rh_user_course`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_user_project`
--
ALTER TABLE `rh_user_project`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `rh_video`
--
ALTER TABLE `rh_video`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `rh_admin`
--
ALTER TABLE `rh_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `rh_article`
--
ALTER TABLE `rh_article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- 使用表AUTO_INCREMENT `rh_auth_group`
--
ALTER TABLE `rh_auth_group`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `rh_auth_rule`
--
ALTER TABLE `rh_auth_rule`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- 使用表AUTO_INCREMENT `rh_banner`
--
ALTER TABLE `rh_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- 使用表AUTO_INCREMENT `rh_bind_teacher`
--
ALTER TABLE `rh_bind_teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `rh_card_number`
--
ALTER TABLE `rh_card_number`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用表AUTO_INCREMENT `rh_category`
--
ALTER TABLE `rh_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `rh_classes`
--
ALTER TABLE `rh_classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用表AUTO_INCREMENT `rh_class_project`
--
ALTER TABLE `rh_class_project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `rh_class_stu`
--
ALTER TABLE `rh_class_stu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- 使用表AUTO_INCREMENT `rh_class_teacher`
--
ALTER TABLE `rh_class_teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- 使用表AUTO_INCREMENT `rh_course`
--
ALTER TABLE `rh_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `rh_course_teacher`
--
ALTER TABLE `rh_course_teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- 使用表AUTO_INCREMENT `rh_experience`
--
ALTER TABLE `rh_experience`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `rh_fx`
--
ALTER TABLE `rh_fx`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `rh_image`
--
ALTER TABLE `rh_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- 使用表AUTO_INCREMENT `rh_image_category`
--
ALTER TABLE `rh_image_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `rh_kids`
--
ALTER TABLE `rh_kids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `rh_message`
--
ALTER TABLE `rh_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `rh_msg`
--
ALTER TABLE `rh_msg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- 使用表AUTO_INCREMENT `rh_order`
--
ALTER TABLE `rh_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- 使用表AUTO_INCREMENT `rh_pingce`
--
ALTER TABLE `rh_pingce`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- 使用表AUTO_INCREMENT `rh_plan`
--
ALTER TABLE `rh_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用表AUTO_INCREMENT `rh_project`
--
ALTER TABLE `rh_project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- 使用表AUTO_INCREMENT `rh_pt`
--
ALTER TABLE `rh_pt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `rh_pt_goods`
--
ALTER TABLE `rh_pt_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `rh_pt_item`
--
ALTER TABLE `rh_pt_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `rh_sortable`
--
ALTER TABLE `rh_sortable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1042;

--
-- 使用表AUTO_INCREMENT `rh_star_order`
--
ALTER TABLE `rh_star_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `rh_star_task`
--
ALTER TABLE `rh_star_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `rh_star_user`
--
ALTER TABLE `rh_star_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- 使用表AUTO_INCREMENT `rh_student`
--
ALTER TABLE `rh_student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用表AUTO_INCREMENT `rh_study_history`
--
ALTER TABLE `rh_study_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `rh_stu_label`
--
ALTER TABLE `rh_stu_label`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `rh_sys_config`
--
ALTER TABLE `rh_sys_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- 使用表AUTO_INCREMENT `rh_teacher`
--
ALTER TABLE `rh_teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `rh_tui`
--
ALTER TABLE `rh_tui`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `rh_tui_form`
--
ALTER TABLE `rh_tui_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `rh_user`
--
ALTER TABLE `rh_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `rh_user_course`
--
ALTER TABLE `rh_user_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `rh_user_project`
--
ALTER TABLE `rh_user_project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=308;

--
-- 使用表AUTO_INCREMENT `rh_video`
--
ALTER TABLE `rh_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
