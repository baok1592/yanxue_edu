<template>
	<view class="index">		
		<view class="more">
			<view class='mo'>
				<view class='mo_01'>数据交易</view>
			</view>
		</view>
		<view class="shuju">
			<view class="shuju_01">
				<view>支付统计</view>
				<view class="shuju_01_s" v-if="order_data">{{order_data.sum_order}}</view>
			</view>
			<view class="shuju_01 no">
				<view>绑定统计</view>
				<view class="shuju_01_s" v-if="order_data">{{order_data.bind}}</view> 
			</view>
			<view class="shuju_01">
				<view>佣金</view>
				<view class="shuju_01_s" v-if="order_data">{{order_data.yj}}</view>
			</view>
			<view class="shuju_01 no">
				<view>总销售金额</view>
				<view class="shuju_01_s" v-if="order_data">¥ {{order_data.total_price}}</view>
			</view>
		</view>
		<view class="BH"></view>
		<view class="six">
		
			<view class="jiu_01">
				<navigator url="/teacher/teachercms/vacate_list/index?type=teacher">
					<view><img src="@/static/imgs/6.png" /></view>
					<view>请假记录</view>
				</navigator>
				<view class="new" v-if="show">
					
				</view>
			</view>
			
			<view class="jiu_01">
				<navigator url="/teacher/teachercms/order_teacher/order_teacher">
					<view><img src="@/static/imgs/8.png"/></view>
					<view>修改订单</view>
				</navigator>
			</view>
			<!-- 
			<view class="jiu_01">
				<navigator url="/pages/client/order/index?type=teacher">
					<view><img src="@/static/imgs/8.png"/></view>
					<view>门店编辑</view>
				</navigator>
			</view>
			<view class="jiu_01">
				<navigator url="/pages/cms/user/tongji/tongji"> 
					<view><img src="@/static/imgs/date.png" /></view>
					<view>经营数据</view>
				</navigator>
			</view> -->
			<!-- <view class="jiu_01 ">
				<navigator url="/means/cms/notice/notice">
					<view><img src="@/static/imgs/4.png" /></view>
					<view>通知</view>
				</navigator>
			</view> -->
			<!-- <view class="jiu_01">
				<navigator url="/means/cms/couponlist/couponlist">
					<view><img src="@/static/imgs/yhq.png" /></view>
					<view>优惠券</view>
				</navigator>
			</view>
			 <view class="jiu_01 ">
				<navigator url="/means/cms/kehu/kehu">
					<view><img src="@/static/imgs/people.png" /></view>
					<view>客户管理</view>
				</navigator>
			</view>  -->
			<!-- <view class="jiu_01"> 
					<view><img src="@/static/imgs/7.png" /></view>
					<view>商家注册</view> 
			</view> -->
		</view>
		
	</view>
</template>

<script>
	
	//import Tan from "@/components/qy/Tan.vue"
	export default {
		data() {
			return {
				tancl: false,
				shop: {},
				order_data: '',
				show:false,
				res:{"status":200,"msg":"操作成功","data":{"all_order":40,"all_money":"1869.06","today_order":0,"today_money":0,"yesterday_order":0,"yesterday_money":0}},
				
			}
		},
		components: {
			
			
		},
		onShow() {
			this._load()
		},
		methods: {
			jump_order() {
				uni.navigateTo({
					url: '/pages/details/teachercms/course_list/couser_list'
				})
			},
			_load() {
				//this.order_data = this.res.data
				this.$http.get(this.$api.teacherCms.get_data).then(res => {
					this.order_data = res.data
					uni.stopPullDownRefresh()
				})
				this.$http.get(this.$api.teacherCms.get_leave+"?type=1").then(res=>{
					if(res.data.data==1){
						this.show=true;
					}else{
						this.show=false;
					}
					uni.stopPullDownRefresh()
				})
			},
			//弹窗
			tan() {
				this.tancl = !this.tancl
			},
			//扫码
			shao() {
				const that = this
				uni.scanCode({
					onlyFromCamera: false,
					success: function(res) {
						console.log(res)
						that.jump_yz(res.result)
					}
				})
			},
			jump_yz(code){
				this.$api.http.post('order/mcms/hexiao', {
					number:code
				}).then(res => {
					if (res.status == 200) {
						this.$api.msg(res.msg);
						this.code = ''
					}
					if(res.status == 400){
						this.$api.msg(res.msg);
						this.code = ''
					}
				})
			},
		},
		onPullDownRefresh() {
			this._load()
			setTimeout(function() {
				uni.stopPullDownRefresh();
			}, 2000);
		}
	}
</script>


<style lang="scss">
	.index {
		background: #fff;
		font-size: 14px;

		.H50 {
			height: 50px;
		}

		.head {
			background: linear-gradient(to bottom, #52c693, #27a26c);
			text-align: center;
			padding: 20px 0 10px;
			color: #fff;
			font-size: 14px;
		}

		.jiu {
			padding: 10px;
			display: flex;
			flex-wrap: wrap;
			color: #fff;
			min-height: 115px;
		}

		.jiu_01 {
			width: 50%;
			text-align: center;
			padding: 15px 10px 15px;
			box-sizing: border-box;
			font-size: 12px;
			position: relative;
		}
		.jiu_01 .new{
			background: #fa3534;
			width: 30rpx;
			height: 30rpx;
			border-radius: 50%;
			position: absolute;
			top: 5px;
			right: 50px;
		}
		.jiu_01 img {
			width: 32px;
			height: 32px;
			margin-bottom: 10px;
		}

		.mo {
			padding: 10px;
			display: flex;
			justify-content: space-between;
			border-bottom: 1px solid #f0f0f0;
			line-height: 20px;
		}

		.mo_01 {
			padding-left: 10px;
			box-sizing: border-box;
			width: 80%;
			height: 20px;
			overflow: hidden;
			border-left: 3px solid #EC521B;
			font-size: 14px;
			font-weight: bold;
		}

		.mo_01 span {
			color: #8E8E8E;
			font-weight: 100;
			font-size: 12px;
			padding-left: 10px;
		}

		.mo_02 {
			color: #D6D6D6;
		}

		.shuju {
			display: flex;
			flex-wrap: wrap;
		}

		.shuju_01 {
			width: 50%;
			text-align: center;
			padding: 18px 10px;
			box-sizing: border-box;
			font-size: 14px;
			line-height: 25px;
			font-size: 14px;
			border-right: 1px solid #f0f0f0;
			border-bottom: 1px solid #f0f0f0;
		}

		.shuju_01_s {
			color: #EB511B;
			font-weight: 800;
			font-size: 16px;
		}

		.no {
			border-right: none;
		}

		.BH {
			background-color: #F1F1F1;
			height: 5px;
		}

		.six {
			padding: 10px;
			display: flex;
			flex-wrap: wrap;
		}

		.list_01 {
			padding: 15px 10px 8px;
			border-bottom: 1px solid #F4F4F4;
			font-size: 12px;
		}
	}
	
</style>
