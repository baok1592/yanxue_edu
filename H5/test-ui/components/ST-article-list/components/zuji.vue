<template>
	<view class="des" style="margin: 28rpx;">
		<view style="display: flex;">
			<image v-if="dio.img" :src="dio.img" style="width: 100px; height: 100px; border-radius: 8px;" mode="scaleToFill"></image>
			<view style="margin-left: 28rpx;line-height: 54rpx;">
				<view style="font-weight: bold;">{{dio.name}}</view>
				<view style="color: #909399;" v-if="dio.teachers"><span style="margin-right: 28rpx;">班级：{{dio.name}}
				</span > <block style="50%">老师：<span  style="padding-right: 24rpx;" v-for="tes in dio.teachers">{{tes}}</span></block></view>
				<!-- <view style="color: #909399;margin-right: 34px;">开始：{{item.start_time}}</view> -->
				<view style="display: flex;justify-content: space-between;">
					<!-- <view style="color: #909399;margin-right: 34px;">结束：{{item.end_time}}</view> -->
					<view style="color: #909399;margin-right: 14px;">{{dio.start}}至{{dio.end}}</view>
					<u-button type="warning" size="mini"  @click="skip(dio.id)">学习评测</u-button>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
	  name: '', 
	  props: ['dio'], 
	  data() {
	    return {   } 
	  },
	   mounted(){     
		  
	  },
	  methods:{
		  skip(id){
		  	uni.navigateTo({
		  		url:"/pages/study/evaluating/evaluating?id="+id
		  	})
		  }
	  }
	}
</script>

<style lang="scss">

	
</style>
