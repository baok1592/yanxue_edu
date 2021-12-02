<template>
	<view>
		<view class="timetable" v-if="dateArr">
			<view class="timetable-header">
				<view >课时：<span style="color: #fa3534;">2</span>/<span
						style="color: #19be6b;">11</span></view>
				<!-- <view v-else></view> -->
				<view>{{dateArr[0].date}} <span style="font-size: 28rpx;font-weight:normal;margin-left:8rpx;">今日</span>
				</view>
			</view>
			<view class="timetable-body">
				<view class="day" v-for="(item,index) in dateArr" :key="index">{{item.week}}</view>
			</view>
			<view class="timetable-fooder">
				<view class="day" :class="changenum==index?'day-color':''" v-for="(item,index) in dateArr" :key="index"
					@click="change(index)">
					<view style="margin-top: 24rpx;">
						{{item.date}}
					</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	import {
		dateData,
		timeData,
		timeStamp
	} from '@/common/time/date.js';
	export default{
		data(){
			return {
				dateArr: null,	//时间
				changenum: 0,	//选中下表
				
				
			}
		},
		onLoad(e){
			
		},
		onShow() {
			this.show_data();
			this.dateArr = dateData();
		},
		methods:{
			//全局mixin便于下拉刷新与分享
			show_data(){
				
			},
			change(index) {
				this.changenum = index;
				
			},
		}
	}
</script>

<style lang="scss" scoped>
	.timetable {
		background: #f5f5f5;
		min-height: 300rpx;
	}
	
	.timetable-header {
		display: flex;
		margin: 0rpx 30rpx;
		padding-top: 28rpx;
		justify-content: space-between;
		font-size: 34rpx;
		font-weight: bold;
	}
	
	.timetable-body {
		display: flex;
		margin: 30rpx 30rpx 0rpx;
	
		.day {
			width: calc(100%/7);
			text-align: center;
		}
	}
	
	.timetable-fooder {
		display: flex;
		margin: 30rpx;
	
		.day {
			width: calc(100%/7);
			text-align: center;
			height: 94rpx;
			padding: 6rpx 0rpx 0rpx 0rpx;
			border-radius: 50%;
		}
	
		.day-color {
			background: #19be6b;
		}
	}
</style>
