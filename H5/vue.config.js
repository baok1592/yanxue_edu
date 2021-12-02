
module.exports = {
	devServer: {
		port: 8081, //这里的端口是必须和父应用配置的子应用端口一致
		headers: {
			//因为qiankun内部请求都是fetch来请求资源，所以子应用必须允许跨域
			'Access-Control-Allow-Origin': '*'
		}
	},
}
