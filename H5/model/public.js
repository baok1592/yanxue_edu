import http from '../main.js'

// 请求 Sortable
const getSortable = (id) => {
	let url = 'get_data?id=' + id;
	return http.$u.get(url).then(res => {
		return res;
	}).catch(err => {
		return err;
	})
}

// 获取页面主题
const getPageTheme = () => {
	let url = '/get_theme';
	return http.$u.get(url).then(res => {
		return res;
	}).catch(err => {
		return err;
	})
}


//保存局部页面到数据库
// const save_page=(id,sorts)=>{
// 	uni.showToast({
// 		title:"仅演示"
// 	})
// }

const save_page =(id,sorts) =>{
	let url ='/update_data';
	let form ={
		id:id,
		sortable:sorts
	};	
	return http.$u.post(url,form).then(res=>{
		return res;
	}).catch(err => {
		return err;
	})
}
export default {
	getSortable,
	getPageTheme,
	save_page
}