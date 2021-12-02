<template>
	<view class="r_detail">
		
		<view class='tag-e'>
			<view class="goods " v-if="order_info.course">
				<view v-if="order_info.course.img"><image :src="order_info.course.img.url"></image></view>
				<view class='goods_02'>
				  <view class='goods_title'>{{order_info.course.name}}</view>
				  <!-- <view class="goods_des">{{item.sku_name}}</view> -->
				  <view class='good_p'>
					<view class="good_price">¥{{order_info.course.price}}</view>
					<!-- <view class='i'>x {{item.num}}</view> -->
				  </view>
				</view>
			</view>
		</view>
		<view class="total">{{order_info.pay_statement==0?'待支付':'支付'}}：¥ {{order_info.price}}</view>
		<view class="mess">
			<view class="mess_01">订单信息</view>
			<view class="mess_02">
				<view class="mess_02_1">
					<view class="mess_02_l">订单编号:</view>
					<view class="mess_02_r">{{order_info.order_num}}</view>
				</view>
				<view class="mess_02_1">
					<view class="mess_02_l">{{order_info.pay_statement==0?'创建时间':'支付时间'}}: </view>
					<view class="mess_02_r">{{order_info.update_time}}</view>
				</view>
				<view class="mess_02_1" v-if="order_info.state!=0">
					<view class="mess_02_l">订单状态: </view>
					<view class="mess_02_r">{{state[order_info.state]}}</view>
				</view>
			</view>
			<view class="mt-3">
				<u-row >
					<u-col :span="6" >
						<view style="text-align: center;" v-if="order_info.pay_statement==1&&order_info.state==0">
							<u-button type="error" size="medium" @click="open_tui(order_info.id)" >退 款</u-button>
						</view>
					</u-col>
					<u-col :span="6" style="text-align: center;">
						<view style="text-align: center;">
							<u-button type="primary" size="medium" v-if="data.pay_statement==1&&data.state==1" @click="success(data.id)">确认完成</u-button>
						</view>
						<view style="text-align: center;">
							<u-button type="primary" size="medium" v-if="data.pay_statement==1&&data.state==2&&data.userrate==null" @click="clickpj(data.id)">评 价</u-button>
						</view>
					</u-col>
				</u-row>
			</view>
		</view>
		<view class="KB" style="height: 80px;"></view>
		<u-toast ref="uToast" />
		<u-modal v-model="tuiShow" :show-title="false" :content="tuiContent" :show-cancel-button="true"	@confirm="tui()">
			
		</u-modal>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				getimg:"",//this.$getimg
				order_detail:'',
				order_pro:'',
				oid:'',
				id: "",
				state:["正常状态","退款中","已退款","已驳回"],
				tuiShow: false,
				total_price:'',
				order_state:'',
				tuiContent:'确认退款该订单吗？',
				data:{
					log: [],
					order:{
						receiver_address: "天安门",
						receiver_city: "北京市市辖区东城区",
						receiver_mobile: "13173667368",
						receiver_name: "郭德纲",
					}
				},
				res:{"status":200,"msg":"操作成功","data":{"order":{"order_id":2255,"order_num":"D323906381817708","item_id":0,"is_captain":0,"user_id":6233,"type":0,"state":0,"pt_state":0,"payment_state":1,"shipment_state":0,"rate_id":0,"coupon_id":723,"yz_code":0,"order_from":"0","payment_type":"xcx","shipping_money":"0.00","goods_money":"300.01","coupon_money":"300.00","edit_money":"0.00","order_money":"0.01","user_ip":"0.0.0.0","goods_picture":null,"message":"","invoice":0,"invite_code":0,"activity_type":null,"is_captain_sign":0,"receiver_name":"郭德纲","receiver_mobile":"13173667368","receiver_city":"北京市市辖区东城区","receiver_address":"天安门","courier_num":null,"courier":null,"remark_one":null,"remark_two":null,"is_milk":0,"drive_type":"快递","prepay_id":"wx231710385980976fb2cfe16b2473a10000","pay_time":1616490650,"create_time":"2021-03-23","update_time":"2021-03-23 17:10:38","other":"","xid":0,"mobile":null,"address":null,"count":0,"pay_cate":"wx","ordergoods":[{"id":2326,"order_id":2255,"goods_id":84,"goods_name":"外卖点餐商城","sku_id":1,"sku_name":"PHP  ","price":"300.01","cost_price":"0.00","num":1,"total_price":"300.01","discount_id":0,"state":0,"pic_id":998,"user_id":6233,"remark":null,"create_time":"2021-03-23","update_time":"2021-03-23 17:10:38","imgs":{"id":998,"url":"https:\/\/api.ruhuashop.com\/uploads\/other\/60387841e5902.jpg"}}],"users":{"id":6233,"nickname":"王-软件开发👾","headpic":"https:\/\/wx.qlogo.cn\/mmopen\/vi_32\/pkXYERFqIVzT8LVRib1rJgaImDGMpjzh3pgjNRiah4R6WB8QhvuADwoBsOtbvfVqvwQ8D1vSNCGlwicktYic98So4Q\/132"}},"log":[]}},				order_info:"",
				order_info:""
			};
		},
		onLoad(options) {  
			this.oid = options.id
			this.get_order(options.id)
		},
		onShow() {
			this._load()
		},
		
		methods:{
			send(id){
				uni.navigateTo({
					url:"../send/send?id="+id
				})
			},
			_load(){
				this.order_detail = this.res.data.order;
				this.order_state = this.res.data.log
				let price = 0
				for (var i = 0; i <  this.res.data.order.ordergoods.length; i++) {
					price = price +  this.res.data.order.ordergoods[i].price *  this.res.data.order.ordergoods[i].num
				}
				this.total_price = price.toFixed(2)
				/* this.$api.post('order/mcms/get_order_one',{id:this.oid}).then(res=>{
					this.order_detail = res.data.order
					this.order_state = res.data.log
					let price = 0
					for (var i = 0; i < res.data.order.ordergoods.length; i++) {
						price = price + res.data.order.ordergoods[i].price * res.data.order.ordergoods[i].num
					}
					this.total_price = price.toFixed(2)
				}) */
			},
			//获取订单信息
			get_order(){
				this.$http.get(this.$api.order.get_order+"?id="+this.oid).then(res=>{
				this.order_info=res.data
				})
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
						this.get_order();
						this.$emit("updata")
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
.r_detail{background-color:#F5F5F5;height: 100vh;
	.head{display: flex;justify-content: space-between;background-color: #F85043;padding: 10px 20px 0;
		.head_l{padding: 20px;color: #FDF1F0;
			.head_l_01{font-size: 16px;padding-bottom: 6px;}
			.head_l_02{font-size: 13px;}
		}
		.head_r img{height: 100px;width: 120px;}
	}
	.address{display: flex;padding:20px 15px;;background-color:#fff;margin-bottom: 10px;
		.address_l{padding-right: 20px;display: flex;flex-direction: column;justify-content: center;
			img{width: 20px;height: 20px;}
		}
		.address_r{flex-grow: 1;
			.address_r_01{display: flex;justify-content: space-between;font-size: 15px;font-weight: 600;padding-bottom: 8px;}
			.address_r_02{line-height: 20px;}
		}
	}
	.tag-e{background-color:#fff;margin-bottom: 10px;
		.goods{display: flex;font-size: 14px;width: 100%;background-color: #ffffff;padding: 10px;box-sizing: border-box;
		border-bottom: 1px solid #EEF0EF;
			image{width: 160rpx; height: 160rpx;}
			.goods_02{box-sizing: border-box;display: flex;flex-direction: column;height: 160rpx;flex-grow: 1;
			justify-content: space-between;padding-top: 10rpx;padding-left: 25px;}
			.goods_title{max-height: 40px;overflow: hidden;line-height: 20px;font-weight: 600;font-size: 15px;}
			.goods_des{color: #979797;}
			.good_p{display: flex;justify-content: space-between;
				.good_price{color: #F04E42;font-weight: 600;}
		}
		
		}
	} 
	.total{background-color: #fff;padding: 12px 15px;text-align: right;margin-bottom: 10px;font-size: 15px;}
	.mess{background-color: #fff;padding: 10px;margin-bottom: 10px;
		.mess_01{border-left: 2px solid #FD5153;padding-left: 10px;margin-bottom: 10px;font-size: 15px;font-weight: 600;}
		.mess_02{border-top: 1px solid #F8F8F8;padding: 10px;
			.mess_02_1{display: flex;line-height: 25px;
				.mess_02_l{width: 100px;}
			}
		}
	}
	.foot{position: fixed;bottom: 0px;left: 0px;z-index: 99;border-top: 1px solid #E4E4E4;width: 100%;background-color: #fff;
	justify-content: flex-end;padding: 10px 15px;display: flex;
	}
}
</style>
