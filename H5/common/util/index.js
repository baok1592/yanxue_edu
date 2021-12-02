const msg = (title, duration=1500, mask=false, icon='none')=>{
	//统一提示方便全局修改
	if(Boolean(title) === false){
		return;
	}
	uni.showToast({
		title,
		duration,
		mask, 
		icon
	});
}
 


const _set_home_cache =	(res) =>{
		let arr={}
		arr['data'] = res
		arr['cache_time']=time
		uni.setStorageSync('home', arr);//放入缓存
		console.log('set')
}
//存入时间限制的缓存
const set_verify =(name,res)=>{
	var time = Date.parse(new Date()) /1000
		let goods={
			data:null,
			pro_time:time+60*20
		}
		goods.data=res 
		uni.setStorageSync(name,goods)
	}
//获取缓存数据
const time_verify = (res)=>{
		var time = Date.parse(new Date()) /1000
		let data=  0;
			data=uni.getStorageSync(res);
		if(data==0){
			return false;
		}
		if(data.pro_time>time){
			return data;
		}else{
			return false;
		}
}
export  default{ 
	msg,
	_set_home_cache,
	set_verify,
	time_verify,
}