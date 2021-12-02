import {Api_url,is_w7_xcx} from '@/common/config'
const siteinfo = require('@/siteinfo.js'); 
import Vue from 'vue'

class XcxToken {
	constructor() {
		this.tokenUrl = Api_url + 'auth/getXcxToken';		//微信获取token
		this.verifyUrl = Api_url + 'auth/check_token';
		this.getInfo = Api_url + 'user/info';
	}
	
	//初始化登陆
	async verify() {  
		var that = this;
		var token = uni.getStorageSync('token'); //获取缓存
		
		if (!token) {
			console.log("111")
			//向微信api拿code，再向tp的api拿token
			this.getTokenFromServer();
		} else {
			console.log("222")
			this._veirfyFromServer(token); //验证token是否过期，过期调用.getTokenFromServer函数获取
		}
	}
	//验证token
	_veirfyFromServer(token) {
		var that = this;
		uni.request({
			url: that.verifyUrl,
			method: 'POST',
			data: {
				token: token
			},
			success: function(res) {
				console.log("sfsdf",res.data.data.data)
				var valid = res.data.data.data;
				if (!valid) {
					that.getTokenFromServer();
				}
			}
		})
	}
	//获取Token
	getTokenFromServer() {
		var that = this;
		console.log('x1')
		uni.login({
			provider: 'weixin',
			success: function(res) {
				console.log('login:',res)
				let data ={
						code: res.code
					}
				if (is_w7_xcx) {
					data = {
						code: res.code,
						ucid: siteinfo.uniacid
					}
				}
				uni.request({
					url: that.tokenUrl,
					method: 'POST',
					data: data,
					success: function(res) {
						console.log("aaa",res)
						if(res.data.status==200){							
							uni.setStorageSync('token',res.data.data.token);
						}
					}
				})
			}
		})
	}
}
export {
	XcxToken
};


