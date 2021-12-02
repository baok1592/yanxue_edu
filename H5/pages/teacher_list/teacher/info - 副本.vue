<template>
	<view class="index">
		<view class="header"></view>
		<view class="body">
			<view class="touxiang">
				<view class="touxiang-img">
					<image style="width: 80px;height: 80px; border-radius: 40px;" :src="info.header"></image>
				</view>
				<view class="touxiang-text">
					<view class="touxiang-title">{{info.name}}</view>					
					<view style="display: flex;">
						<view class="touxiang-label" v-for="item in info.labels">{{item.project.name}}</view>
					</view>
				</view>
			</view>
			<!-- <view class="teaching" v-if="info.experience">
				<view class="teaching-tit">教学资质</view>
				<view class="teaching-des" v-for="item in info.experience.certificate"> {{item}}</view>
			</view>
			<view class="teaching" v-if="info.experience">
				<view class="teaching-tit">教学经历</view>
				<view class="teaching-des" v-for="item in info.experience.experience"> {{item}}</view>
			</view>
			<view class="teaching" v-if="info.experience">
				<view class="teaching-tit">教师特点</view>
				<view class="teaching-des" > {{info.experience.content}}</view>
			</view> -->
			<view style="padding: 40rpx 28rpx;">
				<u-parse :html="info.t_json.count"></u-parse>
			</view>
		</view>
		<!-- <view class="footer">
			<view class="footer-tit" v-if="info.courses">课程 <span style="font-size: 24rpx;font-weight: normal;margin-left: 24rpx;"> 共({{info.courses.length}})门课程</span></view>
			<view style="margin-top: 42rpx;margin-left: 7px;">
				<block v-for="(item,index) in info.courses" :key="index">
					<couserList style="width: 49%; display: inline-block;" :list="item.course"  ></couserList> 
				</block>
			</view>
		</view> -->
	</view>
</template>

<script>
	//import couserList from "@/components/qy/list-text.vue"
	export default{
		components:{
			//couserList
		},
		data(){
			return{
				listpro:[
					
					],
				info:"",
				id:"",
			}
		},
		onLoad(option) {
			this.get_teacher(option.id)
			this.id=option.id;
		},
		onShareAppMessage(res) {
			let path = "/pages/details/teacher?id="+this.id		    
		    return {
		      title: '首页',
		      path: path
		    }
		  },
		methods:{
			show_data(){
				this.get_teacher(this.id)
			},
			//获取教师信息
			get_teacher(id){
				this.$api.get("user/get_teacher?id="+id).then(res=>{
					this.info=res.data;
					uni.stopPullDownRefresh()
				})
			}
		}
	}
</script>

<style lang="scss">
	.index{
		background-color: #EEEEEE;
	}
	.header{
		height: 200rpx;
		background-color: #FF8D8D;

	}
	.body{
		background-color: #FFFFFF;
		min-height: 300px;
		border-radius: 0px 0px 20px 20px;
	}
	.touxiang{
		display: flex;
		position: relative;
		.touxiang-img{
			position: absolute;
			top: -18px;
			padding: 5px;
			border-radius: 50px;
			background-color: #FFFFFF;
		}
		.touxiang-text{
			margin-left: 30%;padding-top: 15px;
			.touxiang-title{
				font-size: 34rpx;
				font-weight: bold;
			}
			.touxiang-label{
				font-size: 12px;
				margin: 5px;
				padding: 0px 20px;
				height: 20px;
				line-height: 20px;
				text-align: center;
				border-radius: 10px;
				background-color: #eeeeee;
			}
		}
		
	}
	.teaching{
		font-size: 28rpx;
		padding-top: 18rpx;
		margin-left: 20px;
		.teaching-tit{
			font-size: 28rpx;
			font-weight: bold;
		}
		.teaching-des{
			margin-top: 18rpx;
			font-size: 26rpx;
			color: #B5B5B5;
		}
	}
	.footer{
		background-color: #FFFFFF;
		min-height: 300px;
		margin-top: 20rpx;
		padding: 40rpx 0rpx;
		border-radius: 20px 20px 0px 0px ;
		.footer-tit{
			padding: 0rpx 40rpx;
			font-size: 28rpx;
			font-weight: bold;
		}
	}
</style>
