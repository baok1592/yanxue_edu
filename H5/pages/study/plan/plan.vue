<template>
	<view class="content" :style="{'background-color': diydata.background.page_background_color}">
		
		<view class="timetable mb-4" v-if="dateArr">
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
		<view id="sort-1" class="sortable sortable-panel">
			<block v-for="(result,index) in diydata.sorts.child" :key="index">
				<st-qrcode v-if="result.sorts == 'st-qrcode'" :isPhone="diydata.isPhone" :dat="result" @getUnique="activeGetUnique"></st-qrcode>
				
				<st-plan v-if="result.sorts == 'st-plan'" :isPhone="diydata.isPhone" :cid="plan_id" :refresh="diydata.shop_list"  :planNum="changenum" :dat="result" @getUnique="activeGetUnique"></st-plan>
				
				<st-search v-if="result.sorts=='st-search'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-search>
				
				<st-form v-if="result.sorts=='st-form'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique" :color="diydata.background.backgroundColor"></st-form>
				
				<st-button v-if="result.sorts == 'st-button'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-button>
				
			
				<st-notice v-if="result.sorts == 'st-notice'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-notice>
				
				<st-line v-if="result.sorts == 'st-line'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-line>
				
				<st-cell v-if="result.sorts == 'st-cell'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-cell>
				
				<st-title v-if="result.sorts == 'st-title'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-title>
				
				<st-presentation v-if="result.sorts == 'st-presentation'" :isPhone="diydata.isPhone" :dat="result"
					:content="videoInfo.content" @getUnique="activeGetUnique"></st-presentation>
				
				<st-contact v-if="result.sorts == 'st-contact'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-contact>
				
				<st-map v-if="result.sorts == 'st-map'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-map>
				
				<st-image v-if="result.sorts == 'st-image'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-image>
				
				<st-tag v-if="result.sorts == 'st-tag'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-tag>
				
				<st-tabs v-if="result.sorts == 'st-tabs'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-tabs>
				
				<st-video v-if="result.sorts == 'st-video'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique" :url="videoInfo.video"></st-video>
				
				<st-html v-if="result.sorts == 'st-html'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique" :contens="videoInfo.content" :is_article="true"></st-html>
				
				
				
				
			</block>
		</view>
		<view style="height: 50rpx;">
			
		</view>
	</view>
</template>

<script>
	// import draggable from 'vuedraggable'
	import Sortable from "sortablejs";
	
	import {DIYdata} from "@/common/DIYdemo.js"
	import {
		dateData,
		timeData,
		timeStamp
	} from '@/common/time/date.js';
	const diy=new DIYdata;
	export default {
		components: {
			
		},
		
		data() {
			return {
				diydata:diy.diyData,
				dateArr: null,	//时间
				changenum: 0,	//选中下表
				id:1033,
				plan_id:0,
			}
		},
		mounted() {
			
			
		},
		
		computed: {
			// 监听页面布局是否发生改变
			isPageChange() {
				return this.data_sorts == JSON.stringify(this.sorts);
			},
			
		},
		onLoad(option){
			this.plan_id=option.id;
		},
		onShow(){
			this.dateArr = dateData();
			this.get_info()
			this.getPageTheme();
			this.show_data();
			
		},
		methods: {
			//全局mixin便于下拉刷新与分享
			show_data(){
				diy.diyData.shop_list=!diy.diyData.shop_list;
			},
				get_info(){
					// #ifdef H5
						diy.change(this.id) 
						const _this = this; 				
						window.addEventListener('message',this.response);		
						let isPhone = navigator.userAgent.toLowerCase();
						if (isPhone.indexOf('windows') != -1) {
							diy.getEff(_this,false,"false");
							diy.diyData.isPhone = false;
						} else {
							diy.getEff(_this,true,"false");
							diy.diyData.isPhone = true;
						}
					// #endif
					// #ifdef MP-WEIXIN ||MP-TOUTIAO
						diy.change(this.id) 
						const _this = this;
						const diyRes= diy.getEff(_this,true,'false');
						diyRes.then(res=>{
							console.log("aaaaa",res)
						  res.isPhone = true;
						  _this.diydata=res
						}) 
					// #endif
								
					//#ifdef APP-PLUS
						diy.change(this.id)
						const _this = this;
						diy.getEff(_this,true,'false');
						diy.diyData.isPhone = true;
					//#endif
				},
			
			
			//鼠标点击获取点击id
			activeGetUnique(item){
				const _this = this;
				diy.activeGetUnique(item,_this)
			},
			//获取页面主题
			getPageTheme(){						
				diy.getPageTheme()
			},
			// 更新页面主题
			updatePageTheme() {
				this.getPageTheme();
			},
			//响应cms窗口的数据
			response(event){
				console.log("event",event)
				diy.save(event,this,"index");
			},
			//切换日期
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
	.sortable_delete {
		position: fixed;
		top: 2rpx;
		left: 2rpx;
		width: 250rpx;
		height: 250rpx;
		display: flex;
		justify-content: center;
		align-items: center;
		border: 2rpx dotted #F56C6C;
		padding: 40rpx;
		border-radius: 20rpx;
		color: #F56C6C;
		z-index: 999;
		background-color: white;
		transition: all 1s;
		overflow: hidden;
		* {
			width: 0;
			height: 0;
			overflow: hidden;
		}
	}
	
	.content {
		min-height: calc(100vh - 44px);

		.sortable {
			width: 100%;

			>* {
				margin-top: 30rpx;
				margin-bottom: 30rpx;
				&:first-child {
					margin-top: 0;
				}
				&:last-child {
					margin-bottom: 0;
					padding-bottom: 30rpx;
				}
			}
		}
	}
</style>
