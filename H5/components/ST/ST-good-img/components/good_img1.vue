<template>
	<view>
		<u-image width="100%" height="300rpx" :src="src"></u-image>
	</view>
</template>

<script>
	export default{
		data(){
			return {
				
			}
		},
		onLoad(e){
			
		},
		onShow() {
			this.show_data();
		},
		methods:{
			//全局mixin便于下拉刷新与分享
			show_data(){
				
			}
		}
	}
</script>

<style>
	
</style>
