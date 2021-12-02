const siteinfo=require('../siteinfo.js')

const CONFIG = {
    // 开发环境配置
	development: 'http://localhost:8099/',
	//development: 'https://wy.phps.shop/',
    // 生产环境配置
    production: '/../'  //http://rhedu.ruhuashop.com/
	

};
const Api_url=CONFIG[process.env.NODE_ENV];  //独立版
//const Api_url='../index.php/';  //微擎H5版本

//const Api_url = siteinfo.siteroot +"/addons/qy_edu2021/tp6/public/index.php/";	//小程序地址
const is_w7_xcx = false

export {
	Api_url,is_w7_xcx
}