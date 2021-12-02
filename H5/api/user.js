import http from '@/common/http/axios.js'

//小程序获取token
function get_xcx_token(data) {
	let url = 'auth/xcx_login'
	return http.post(url, data).then(res => {
		return res;
	})
}
//更新用户信息
function upinfo(data) {
	let url = 'weixin/upinfo'
	return http.post(url, data).then(res => {
		return res;
	})
}
//获取用户信息
function get_info() {
	let url = 'user/info'
	return http.get(url).then(res => {
		return res;
	})
}
//验证token
function verify_token() {
	let url = 'index/verify_token'
	return http.get(url).then(res => {
		return res;
	})
}
//创建会员订单
function create_vip(token,data){
	let url="order/create_order"
	return http.post(url,data).then(res=>{
		return res;
	})
}
//小程序支付
function vip_pay(data) {
	let url = 'order/xcx_pay_prder'
	return http.post(url,data).then(res => {
		return res;
	})
}
//公众号支付
function h5_vip_pay(data) {
	let url = 'order/gzh_pay'
	return http.post(url,data).then(res => {
		return res;
	})
}
export default {
	get_xcx_token,
	upinfo,
	get_info,
	verify_token,
	create_vip,
	vip_pay,
	h5_vip_pay,
}
