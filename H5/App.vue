<script>
	import {XcxToken} from '@/common/loging/xcx_token.js'
	var xcxtoken = new XcxToken();
	import {WxToken} from '@/common/loging/wx_token.js'	
	var wxtoken = new WxToken();
	import {Api_url} from '@/common/config.js' 
	export default {
		onLaunch: function() {
			console.log('App Launch')
			// #ifdef MP-WEIXIN
				xcxtoken.verify(); //小程序获取token 
			// #endif
			
			// #ifdef H5
					var ua = navigator.userAgent.toLowerCase();
					var isWeixin = ua.indexOf('micromessenger') != -1;
					if (!isWeixin) { 
						console.log("非公众号-暂不登陆")
						return false;
					}else{ 
						let token = uni.getStorageSync('token')
						if (!token) {
							console.log(Api_url + 'weixin/gzh_code')
							window.location.href = Api_url + 'weixin/gzh_code'
						}	
					}
				//微信公众号获取token -必须是认证的服务号					
			// #endif
		},
		onShow: function() {
			console.log('App Show')
		},
		onHide: function() {
			console.log('App Hide')
		}
	}
</script>

<style lang="scss">
	@import "uview-ui/index.scss";
	@import './common/css/bootstrap.min.css';
	//@import url("./common/icon/domeicon/iconfont.css");	
	//@import url("./static/css/common.css");
	@import './common/css/qy/all.css';
	page,uni-page-body,html,body{  
		height: 98%;
		background-color: white;
	}
	/*每个页面公共css */
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}
</style>
