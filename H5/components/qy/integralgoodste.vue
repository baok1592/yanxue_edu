<template>
	<view>
		<view class="box mt16 pd16_15">
			<view class="order-list-item-tit" style="margin-bottom: 20upx;">
				<view class="d-flex alcenter space justify-content-between">
					<view class="d-flex alcenter">
						<text class="ft14 cl-main">{{datas.order_num}}</text>
					</view>
					<view>
						<text class="ft14 ftw500" :style="{color:getColor}">{{datas.pay_statement==0?"未支付":"已支付"}}</text>
					</view>
				</view>
			</view>
			<view class="d-flex" @click="skipinfo(datas.id)">
				<image mode="aspectFill" class="order-list-item-l" :src="datas.course.img.url" v-if="datas.course" style="width: 45%; height: auto; margin-right: 5%; border-radius: 5px;"></image>
				<view class="order-list-item-r">
					<view style="width: 300upx;" class="ft14 ftw600 cl-main text-over" v-if="datas.course">						
						{{datas.course.name}}
					</view>
					<!-- <view style="width:300upx;" class="ft14 ftw600 cl-main text-over">
						这是一个商品
					</view> -->
					<view class="mt8 ft12 cl-notice">价格：{{datas.price}}</view>
					<view class="d-flex alcenter cl-orange mt8" >
							<text class="ft16 ftw600"> ¥{{datas.total_price}}</text>
					</view>
				</view>
			</view>
			<view class="d-flex alcenter space mt16" style="margin-top: 28rpx;">
				<view>
					<countdown-time v-if="datas.status == 0" :t="900" size="small"></countdown-time>
				</view>
				<u-input v-model="prices" :type="type" :border="border" placeholder="请输入优惠价格"/>
				<u-button shape="circle" style="margin-left: 28rpx;" type="success" size="mini" @click="upprice()">修改价格</u-button>
				<u-toast ref="uToast" />
			</view>
		</view>
	</view>
</template>

<script>
	//status  0,待付款  1待使用    4已过期  8已完成
	import user from "@/api/user.js"
	export default{
		props:{
			datas:{
				type:Object,
				default:function(){
					return new Object;
				}
			},
			xiugai:{
				type:Boolean
			}
		},
		computed:{
			getColor(){
				if(this.datas.status != 0){
					return  '#000000';
				}
				return this.tempColor;
			}
		},
		data(){
			return {
				status:["已支付","未支付"],
				value: '',
				type: 'number',
				border: true,
				prices:null,
			}
		},
		created(){
			
		},
		methods:{
			/* goodsdestion(){
				//console.log("data",this.datas)
				uni.navigateTo({
					url:"/pages/client/order/detail"
				})
			}, */
			skipinfo(id){
				uni.navigateTo({
					url:"/pages/client/order/detail?id="+id
				})
			},
			skip(type,id){
				if(type==2){
					uni.navigateTo({
						url:"/pages/client/tuan/detail?id="+id
					})
				}else{
					//支付
					let data = {
						order_id: this.datas.id
					}
					user.vip_pay(data).then(res => {
						if (res.status == 200) {
							this.wx_pay(res.data)
						} else {
							uni.showToast({
								title: '支付失败',
								icon: 'none'
							})
						}
					})
				}
			},
			wx_pay(data) {
				const that = this
				console.log('wx:', data)
				uni.requestPayment({
					provider: 'wxpay',
					timeStamp: data.timeStamp,
					nonceStr: data.nonceStr,
					package: data.package,
					signType: data.signType,
					paySign: data.paySign,
					success: function(res) {
						console.log('success:' + JSON.stringify(res));
						uni.redirectTo({
							url: "/pages/index/index"
						})
					},
					fail: function(err) {
						uni.showToast({
							title: '支付失败',
							icon: 'none'
						})
						console.log("+++++", err)
						// console.log('fail:' + JSON.stringify(err));
						// uni.navigateTo({
						// 	url:'./detail?id='+that.orderID
						// })
						// uni.navigateBack();
						/* setTimeout(() => {
							uni.switchTab({
								url: '/pages/index/index'
							})
						}, 1000) */
					}
				});
			},
			//修改价格
			upprice(){
				if(this.prices==null){
					this.$refs.uToast.show({
						title: '请输入价格',
						type: 'default',
					})
					return;
				}
				this.$http.put(this.$api.teacherCms.up_order+"?order_id="+this.datas.id+"&price="+this.prices).then(res=>{
					if(res.status==200){
						this.$refs.uToast.show({
							title: '修改成功',
							type: 'success',
						})
						this.$emit("upprice")
					}
				})
			}
		}
	}
</script>

<style>
	.pd16_15{
		padding: 32rpx 30rpx;
	}
	.box{
		width: 100%;
		    background: #FFFFFF;
		    box-shadow: 0rpx 8rpx 40rpx 0rpx rgba(0,0,0,0.04);
		    border-radius: 32rpx;
	}
	.btn-small {
		background-color: #00C657;
		color: #FFFFFF;
	}
	
	.slot-content {
		font-size: 28rpx;
		color: $u-content-color;
		text-align: center;
	}
	
	.del-but {
		background: #F56C6C;
		height: 32px;
		text-align: center;
		line-height: 32px;
		color: #FFFFFF;
		width: 88px;
		border-radius: 44px;
		margin-right: 24rpx;
	}
	
	.tui-but {
		background: #ff9900;
		height: 32px;
		text-align: center;
		line-height: 32px;
		color: #FFFFFF;
		width: 88px;
		border-radius: 44px;
		margin-right: 24rpx;
	}
	
	.delivery-type {
		width: 128rpx;
		height: 36rpx;
		background: #FFFFFF;
		border-radius: 18rpx;
		font-size: 24rpx;
		color: #8A8D99;
		line-height: 36rpx;
		text-align: center;
		font-weight: 500;
		margin-left: 0rpx;
	}
	
	.mt16 {
		margin-top: 0px;
	}
</style>