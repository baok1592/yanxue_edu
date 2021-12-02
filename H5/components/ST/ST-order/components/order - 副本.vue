<template>
	<view>
		<view class="box mt16 pd16_15">
			<view class="order-list-item-tit" style="margin-bottom: 20upx;">
				<view class="flex alcenter space">
					<view class="flex alcenter">
						<text class="ft14 cl-main">{{datas.order_num}}</text>
					</view>
					<text class="ft14 ftw500" :style="{color:getColor}">{{datas.pay_statement==0?"未支付":"已支付"}}</text>
				</view>
			</view>
			<view class="flex" @click="skipinfo(datas.id)">
				<image mode="aspectFill" class="order-list-item-l" :src="datas.goods.banner_imgs[0]"
					style="width: 45%; height: auto; margin-right: 5%; border-radius: 5px;"></image>
				<view class="order-list-item-r">
					<view style="width: 300upx;" class="ft14 ftw600 cl-main text-over">
						{{datas.goods.goods_name}}
					</view>
					<view class="mt8 ft12 cl-notice">价格：{{datas.price}}</view>
					<view class="flex alcenter cl-orange mt8">
						<text class="ft16 ftw600"> ¥{{datas.total_price}}</text>
					</view>
				</view>
			</view>
			<view class="flex justify-content-end mt-3">
				<view class="tui-but" @click="open_tui(datas.id)" v-if="datas.pay_statement!=0">退款</view>
				<view class="del-but" @click="open_del(datas.id)">删除</view>
				<view v-if="datas.pay_statement==0" class="btn-small" @click="skip(1,19)">去支付</view>
				<view v-if="datas.pay_statement!=0">
					<view class="btn-small " @click="skip(2,19)">评价</view>
				</view>
			</view>
		</view>
		<u-toast ref="uToast" />
		<u-modal v-model="show" :show-title="false" :content="content" :show-cancel-button="true" @confirm="del()">
		</u-modal>
		<u-modal v-model="tuiShow" :show-title="false" :content="tuiContent" :show-cancel-button="true"	@confirm="tui()">
		</u-modal>
		ssss
	</view>
</template>

<script>
	//status  0,待付款  1待使用    4已过期  8已完成
	import user from "@/api/user.js"
	export default {
		props: {
			datas: {
				type: Object,
				default: function() {
					return new Object;
				}
			},
			xiugai: {
				type: Boolean
			}
		},
		computed: {
			getColor() {
				if (this.datas.status != 0) {
					return '#000000';
				}
				return this.tempColor;
			}
		},
		data() {
			return {
				status: ["已支付", "未支付"],
				value: '',
				type: 'text',
				border: true,
				show: false,
				tuiShow: false,
				content: "确定删除该订单吗？",
				tuiContent: "确定退款该订单吗？",
				id: "",
				tui_id: "",
			}
		},
		created() {

		},
		methods: {
			/* goodsdestion(){
				//console.log("data",this.datas)
				uni.navigateTo({
					url:"/pages/client/order/detail"
				})
			}, */
			open_del(id) {
				this.id = id;
				this.show = true;
			},
			//退款
			open_tui(id) {
				this.id = id;
				this.tuiShow = true;
			},
			tui() {
				this.$http.put(this.$api.order.tui_order + "?id=" + this.id + "&message=请求退款").then(res => {
					if (res.status == 200) {
						this.$refs.uToast.show({
							title: '已申请退款',
							type: 'success',
						})
						this.$emit("updata")
					}
				})
			},
			//删除订单
			del() {
				this.$http.del(this.$api.order.del_order + "?id=" + this.id).then(res => {
					if (res.status == 200) {
						this.$refs.uToast.show({
							title: '删除成功',
							type: 'error',
						})
						this.$emit("updata")
					}
				})
			},

			close() {

			},
			skipinfo(id) {
				uni.navigateTo({
					url: "/pages/client/order/detail?id=" + id
				})
			},
			skip(type, id) {
				if (type == 2) {
					uni.navigateTo({
						url: "/pages/client/tuan/detail?id=" + id
					})
				} else {
					//支付订单
					let data = {
						id: this.datas.id
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

				uni.requestPayment({
					provider: 'wxpay',
					timeStamp: data.timeStamp,
					nonceStr: data.nonceStr,
					package: data.package,
					signType: data.signType,
					paySign: data.paySign,
					success: function(res) {
						console.log('success:' + JSON.stringify(res));
						this.$emit("updata")
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
			upprice() {

			}
		}
	}
</script>

<style>
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
