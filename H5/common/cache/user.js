//  用户的缓存数据 
import http from '../http/axios.js'

var time = Date.parse(new Date()) / 1000

class CUser { 
	constructor() {  
		
	}
	
	info(){   
		const token=uni.getStorageSync('token')
		if(!token) return; 
		const my=uni.getStorageSync('my')
		if(my && (my.save_time+3600*2)>time){
			return my.data
		}
		return http.get('/user/get_infor').then(res => { 
			let arr={}
			arr['data'] = res.data
			arr['save_time']=time
			uni.setStorageSync('my', arr);//放入缓存
			return res.data			
		})
	}
	
	async info_wait(){ 
		const my=uni.getStorageSync('my')
		if(my.data && my.data.headpic && (my.save_time+3600*2)>time){
			return my.data
		}		
		return http.get('user/get_infor').then(res => { 
			console.log("获取用户信息：",res.data)
			let arr={}
			arr['data'] = res.data
			arr['save_time']=time
			uni.setStorageSync('my', arr);//放入缓存
			return res.data			
		})
	}
	
	async reset_storage(){ 
			return http.get('/user/get_infor').then(res => { 
				let arr={}
				arr['data'] = res.data
				arr['save_time']=time
				uni.setStorageSync('my', arr);//放入缓存
				console.log('重置缓存')
				console.log(arr)
				return res.data			
			})
		
	}
} 


export { CUser };