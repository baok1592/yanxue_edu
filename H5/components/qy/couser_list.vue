<template>
	<view>
		<u-cell-group v-if="show">
				<u-cell-item  icon="account-fill" :title="item.name" v-for="item in stu_list" @click="goodsdestion(item.id)"></u-cell-item>
		</u-cell-group>		
		<view v-else style="margin-top: 40%;">
			<u-empty  text="暂无内容" mode="list"></u-empty>
		</view>
	</view>
</template>

<script>
	export default{
		props:{
			fresh:{
				type:Boolean
			}
		},
		data(){
			return {
				datas:"",
				stu_list:[
					{
						name:"筱丹桂"
					}
				],
				show:false,
			}
		},
		onLoad(e){
			
		},
		onShow() {
			
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
				this.show=true
				//this.get_stu()
			},
			//获取班级
			get_stu(){
				this.$api.get("plan/job_get_class").then(res=>{
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

<style>
	.delivery-type{
		width: 128rpx;
		height: 36rpx;
		background: #FFFFFF;
		border-radius: 18rpx;
		font-size: 24rpx;
		color:#8A8D99;
		line-height: 36rpx;
		text-align: center;
		font-weight: 500;
		margin-left: 0rpx;
	}
	.mt16{
		margin-top: 0px;
	}
	.te-type{
		background: #82848a;
		color: #EEEEEE;
		padding: 4rpx 6rpx;
		margin-right: 24rpx;
		font-size: 20rpx;
		border-radius: 6rpx;
	}
	.cl-star{
		color: #ff9900;
	}
	.touxiang-labels{
		font-size: 12px;
		margin: 5px;
		padding: 0px 15rpx;
		height: 20px;
		line-height: 20px;
		text-align: center;
		border-radius: 10px;
		background-color: #eeeeee;
	}
	.contach{
		
	}
</style>
