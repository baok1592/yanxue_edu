<template>
	<view>
		<!-- <studyplan v-if="show" :fresh="fresh"></studyplan> -->
		<!-- <couserList :fresh="fresh"></couserList> -->
		
		<!-- <view class="des" style="margin: 28rpx;" v-for="(dio,index) in course" :key="index" v-if="show">
			<view style="display: flex;">
				<image v-if="dio.img" :src="dio.img" style="width: 100px; height: 100px; border-radius: 8px;" mode="scaleToFill"></image>
				<view style="margin-left: 28rpx;line-height: 54rpx;">
					<view style="font-weight: bold;">{{dio.name}}</view>
					<view style="color: #909399;" v-if="dio.teachers"><span style="margin-right: 28rpx;">班级：{{dio.name}}
					</span > </view>
					<view style="color: #909399;">
						<block style="50%">老师：<span  style="padding-right: 24rpx;" v-for="tes in dio.teachers">{{tes}}</span></block>
					</view>
					<view style="display: flex;justify-content: space-between;">
						<view style="color: #909399;margin-right: 14px;">{{dio.start}}至{{dio.end}}</view>
						<u-button type="success" size="mini"  @click="goodsdestion(dio.id)">学习计划</u-button>
					</view>
				</view>
			</view>
		</view> -->
		<u-cell-group v-if="show">
				<u-cell-item  icon="account-fill" :title="item.name" v-for="item in stu_list" @click="goodsdestion(item.id)"></u-cell-item>
		</u-cell-group>	
		<view v-else style="margin-top: 40%;">
			<u-empty  text="暂无内容" mode="list"></u-empty>
		</view>
	</view>
</template>

<script>
	
	
	export default {
		
		data() {
			return {
				datas:"",
				stu_list:[
					{
						name:"筱丹桂"
					}
				],
				show:false,
				course:[
					{	
						id:12,
						name:'舞蹈',
						img:"https://edu.ruhuashop.com/uploads/img/20210430/9aff5d6e9ef12ab7bc288970ddebb885.jpg",
						teachers:["刘诗诗","李师师"],
						start:"07-03",
						end:'07-24'
					}
				]
				
			}
		},
		onLoad(e) {
			
		},
		watch:{
			fresh(){
				console.log("shuaxi")
				this.show_data()
			}
		},
		mounted() {
			this.show_data();
		},
		methods:{
			//全局mixin便于下拉刷新与分享
			show_data(){
				
				this.get_stu()
			},
			//获取班级
			get_stu(){
				this.$http.get(this.$api.plan.get_class).then(res=>{
					if(res.status==200){
						this.show=true
						this.stu_list=res.data
						uni.stopPullDownRefresh()
					}else{
						this.show=false
					}
				})
			},
			goodsdestion(id){
				console.log("data",id)
				uni.navigateTo({
					url:"/pages/study/plan/plan?id="+id
				})
			}
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
		.day{
			width: calc(100%/7);
			text-align: center;
		}
	}
	.timetable-fooder{
		display: flex;
		margin: 30rpx;		
		.day{
			width: calc(100%/7);
			text-align: center;
			height: 94rpx;
			padding: 6rpx 0rpx 0rpx 0rpx;
			border-radius: 50%;
		}
		.day-color{
			background: #19be6b;
		}
	}
	.plan{
		padding: 24rpx;
		border-radius: 12rpx;
		box-shadow: 0rpx 0rpx 5rpx #82848a;
	}
	.plan-img{
		margin-right: 24rpx;
		width: 40%;
		height: 100rpx;
	}
	.plan-title{
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
	}

	.u-order-time {
		color: rgb(200, 200, 200);
		font-size: 26rpx;
	}
</style>
