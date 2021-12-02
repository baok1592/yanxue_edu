<template>
	<view>
		<view style="background-color: #FFFFFF;">
			<u-dropdown>
						<u-dropdown-item v-model="value1" title="时间" :options="options1" @change="screen1"></u-dropdown-item>
						<u-dropdown-item v-model="value2" title="老师" :options="options2" @change="screen2"></u-dropdown-item>
						<u-dropdown-item v-model="value3" title="类别" :options="options3" @change="screen3"></u-dropdown-item>
			</u-dropdown>
			<view class="plan mx-3 my-2">
				<view >时间：2月32日 08：00</view>
				<view style="display: flex;margin: 24rpx 0rpx;">
					<image mode="aspectFill" class="plan-img" src="@/static/img/11.jpeg"></image>
					<view style="width: 70%;">
						<view class="plan-title">
							分类：数学
						</view>
						<view class="u-order-desc mt-3">
							课程：初中数学纯干初中干
						</view>
					</view>
				</view>
				<view style="display: flex;justify-content: space-between;">
					<view class="u-order-desc">
						老师：李某某
					</view>
					<view class="u-order-desc text-end w-25" @click="skip()">
						查看详情
					</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	export default{
		data(){
			return {
				value1:"",
				value2:"",
				value3:"",
				options1: [{
					label: '默认排序',
					value: "a",
				},
				{
					label: '距离优先',
					value: "b",
				}
				],
				options2: [{
						label: '去冰',
						value: 1,
					},
					{
						label: '加冰',
						value: 2,
					},
				],
				options3:[],
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
				
			},
			//跳转页面
			skip(){
				uni.navigateTo({
					url:"/pages/study/kcp/info/info"
				})
			},
			//下拉列表选择
			screen1(e){
				console.log(e)
				const that =this;
				let list =[]
				let data =that.kcp_all;
				list = data.filter(item=>{
					return item.date==e;
				})
				that.kcp_list=list;
			},
			screen2(e){
				console.log(e)
				//this.screen1(this.value1)
				const that =this;
				let list =[]
				let data =that.kcp_list;
				list = data.filter(item=>{
					return item.teacher[0].tea.name==e;
				})
				that.kcp_list=list;
			},
			screen3(e){
				console.log(e)
				//this.screen1(this.value1)
				const that =this;
				let list =[]
				let data =that.kcp_list;
				list = data.filter(item=>{
					return item.project.pro.name==e;
				})
				that.kcp_list=list;
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
	
		.plan {
			padding: 24rpx;
			border-radius: 12rpx;
			box-shadow: 0rpx 0rpx 5rpx #82848a;
		}
	
		.plan-img {
			margin-right: 24rpx;
			width: 30%;
			height: auto;
		}
	
		.plan-title {
			font-size: 28rpx;
			font-weight: bold;
		}
	
		.u-node {
			width: 44rpx;
			height: 44rpx;
			border-radius: 100rpx;
			display: flex;
			justify-content: center;
			align-items: center;
			background: #d0d0d0;
		}
	
		.u-order-title {
			color: #333333;
			font-weight: bold;
			font-size: 32rpx;
		}
	
		.u-order-desc {
			color: rgb(150, 150, 150);
			font-size: 28rpx;
			margin-bottom: 6rpx;
			display: flex;
			width: 100%;
			align-items: center;
			justify-content: space-between;
		}
	
		.u-order-time {
			color: rgb(200, 200, 200);
			font-size: 26rpx;
		}
</style>
