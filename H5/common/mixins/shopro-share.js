 

export default {
	data() {
		return { 
		}
	},
	onLoad(options) { 
		console.log("全局mixin")
	},
	onShow(){
		
	},
	methods: {
		
	},
	onPullDownRefresh() {
		this.show_data()
		setTimeout(function () {
		           uni.stopPullDownRefresh();
		       }, 2000);
	} 
}
