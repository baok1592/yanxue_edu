// 商品请求
import http from '@/common/http/axios.js'
// 所有商品
function getProduct(page){ 
	let url='banner/get_banner'
	return http.get(url,{page:page}).then(res=>{
		return res;
	})
}
//修改个人信息
function setuser(data){ 
	let url='auth/xcx_upinfo'
	return http.post(url,data).then(res=>{
		return res;
	})
}

export default {
	getProduct, // 获取单个商品的信息
	setuser,
}