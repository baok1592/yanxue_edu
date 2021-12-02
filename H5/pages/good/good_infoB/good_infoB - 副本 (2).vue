<template>
	<view class="c">
		<view class="banner">
			<view class="uni-padding-wrap">
			    <view class="page-section swiper">
			        <view class="page-section-spacing" >
			            <swiper class="swiper" :indicator-dots="indicatorDots" :autoplay="autoplay"
						 :interval="interval" :duration="duration" style="height: 180px;">
						  <block v-for="(item, index) of goods">
			                <swiper-item >
			                    <img src="@/static/imgs/c1.jpg" />
			                </swiper-item>
			              </block>  
			            </swiper>
			        </view>
			    </view>
			</view>
		</view>
		<view class='ptcj'>
		    <view class='ptcj_01'>拼团抽奖</view>
		    <view class='ptcj_02'>距活动结束还剩下</view>
		    <view class='ptcj_03'>
		        <uni-countdown :show-day="false" :hour="12" :minute="12" :second="12" border-color="#fff"></uni-countdown>
		    </view>
		</view>
		<view class='g'>
			<view class="g-sss">
		      <view class=' g-name'><span>3人拼团抽奖</span>&emsp;{{goods.goods_name}}123123</view>		 
				<u-icon name="zhuanfa" size="42"></u-icon>
		    </view>
			
		    <view class='g-price'>
		      <view ><span>¥{{goods.price}}</span>￥{{goods.market_price}}</view>
		      <view >共{{goods.sales}}份 </view>		      
		    </view>		    
		</view>
		
		<view class='B10'></view>
		<view class='cjwf'>
		    <view class='cjwf_01'>
		      <view class='cjwf_01_l'>拼团抽奖玩法</view>
		      <view class='cjwf_01_r'>详细说明</view>
		    </view>
		    <view class='cjwf_02'>
		      <view class='cjwf_02_1'>
		        <uni-icon type="checkbox-filled" size="22"></uni-icon>
		        <view>付款开团</view>
		      </view>
		      <view class='cjwf_02_1'>
		        <uni-icon type="person" size="24"></uni-icon>
		        <view>邀请好友</view>
		      </view>
		      <view class='cjwf_02_1'>
		        <uni-icon type="star" size="24"></uni-icon>
		        <view>成团抽奖</view>
		      </view>
		      <view class='cjwf_02_1'>
		        <uni-icon type="email" size="24"></uni-icon>
		        <view>中奖发货</view>
		      </view>
		    </view>
		    <view class='cjwf_03'>开奖说明：活动结束10分钟内开奖</view>
		    <view class='cjwf_03'>退款说明：如未中奖，将全额返还原账户</view>
		</view>
  		<view class='B10'></view>
  		<view>
			<uni-segmented-control :current="current" :values="items" @clickItem="onClickItem" style-type="text" active-color="#FE3B5B"></uni-segmented-control>
			<view class="content">
				<view v-show="current === 0">
					<view class="segm_con">dajsfhdjsa 萨达<br/>去问</view>
				</view>
				<view v-show="current === 1">
					选项卡2的内容
				</view>
				<view v-show="current === 2">
					选项卡3的内容
				</view>
			</view>
		</view>
		<view class="H50"></view>
		<view class="footer">
		  <view class='footer_01' @click="skip()">
			<u-icon name="home-fill" size="42"></u-icon>
			<view>首页</view>
		  </view>
		 
		 <!-- <view class='footer_03'>原价购买<br/>几元</view> -->
		  <view class='footer_04'>
			  几人团<br/>（未中奖，全额退款）
		  </view>
		</view>
	</view>
</template>

<script>
	import uniSegmentedControl from "./uni-segmented-control.vue"
	import uniIcon from "./uni-icon.vue"
	import uniCountdown from "./uni-countdown.vue"
	export default {
		data() {
			return {
				goods:[1,2,3],
				id:"",
				favorite:"",
				active: 2,
				items: ['图文详情'],
				current: 0,
				autoplay:true,
				indicatorDots:true,
				interval:5000,
				duration:500,
			};
		},
		components: {uniCountdown,uniIcon,uniSegmentedControl},
		methods: {
			onClickItem(index) {
				if (this.current !== index) {
					this.current = index;
				}
			},
			skip(){
				uni.reLaunch({
					url:"/pages/index/index"
				})
			}
		}
	}
</script>

<style lang="less">
.c{
	.segmented-control{width: 100%;}
	.segm_con{padding: 10px;line-height: 20px;}
	.footer{display: flex;height: 50px;position: fixed;bottom: 0px;width: 100%;border-top: 2rpx solid #f0f0f0;background-color: #ffffff;}
	.footer_01{width: 20%;text-align: center;padding-top: 10rpx;padding-top: 5px;line-height: 20px;}
	.footer_03{width: 40%;background-color: #FF976A;color: #ffffff;line-height: 20px;text-align: center;font-size: 16px;padding-top: 5px;}
	.footer_04{width: 80%;background-color: #FF4444;color: #ffffff;line-height: 20px;text-align: center;font-size: 16px;padding-top: 5px;}
	.ptcj{background-color: #FE3B5B;color: #fff;display: flex;padding: 5px 10px;}
	.ptcj_01{font-size: 18px;width: 45px;font-weight: bold;border-right: 1px solid #fff;padding-top: 10px;}
	.ptcj_02{padding:0 15px;line-height: 55px;}
	.ptcj_03{padding-top: 13px;}
	.g-name span{color: #E24A36;border: 1px solid #E24A36;padding: 0 5px;margin-right: 5px;}
	.cjwf{padding: 10px;}
	.cjwf_01{display: flex;justify-content: space-between;}
	.cjwf_01_l{font-size: 16px;font-weight: bold;}
	.cjwf_02{display: flex;text-align: center;padding: 25px 0;margin: 0 15px;justify-content: space-between;background: url('@/static/imgs/ads-line.png') repeat-x 0px 40px;background-size: 100% 3px;}
	.cjwf_02_1{background-color:#fff;}
	.cjwf_03{color: #808080;line-height: 25px;}
	.ico-r{color: red}
	.abc{
		line-height: 20px;
	}
	.mall-infor {
	  padding: 15px 10px;
	  width: 100%;
	  box-sizing: border-box;
	}
	.B10{background-color: #f5f5f5;height: 10px;}
	.banner img {width: 100%;height: 180px;}
	.g { padding: 5px 10px;width: 100%;box-sizing: border-box;}
	.g-price { color: #8e8e8e; height: 40px;line-height: 40px;margin-bottom: 5px;display: flex;justify-content: space-between;}
	.g-price span {color: red;font-size: 18px;}
	.g-desc {
	  color: #8e8e8e;
	  overflow: hidden;
	  padding: 10px 0px 0px;
	  font-size: 14px;
	}
	.g-sss{display: flex;justify-content: space-between;}
	.g-name {
	 padding-top: 10px;
	  height: 45px;
	  overflow: hidden;
	  line-height: 22px;
	}
	.g-share{
	  margin-right:15px;
	}
	.g-share button {
	  background: none;
	  line-height: 18px;
	  font-size: 12px;
	  padding: 2.5px 7.5px;
	  margin: 0px;
	  border: none;
	}
	.fuwu {
	  background-color: #ff7575;
	  color: #fff;
	  height: 40px;
	  padding: 0px 10px;
	}

	.fuwu-l {
	  display: inline-block;
	  font-size: 12px;
	  line-height: 40px;
	  width: 24%;
	}
	.eva_tit{display: flex;justify-content: space-between;color: #AEAEAE;padding: 10px;border-bottom: 1px solid #F4F4F4;}
	.eva_tit_r a{display: flex;color: #AEAEAE;}
	.eva_tit_r span{color: #E57782}
	.eva_tit_l {display: flex;padding-top: 3px;}
	.eva_tit_l_n{padding:1px 0 0 5px;}
	.eva_con{padding: 10px;border-bottom: 1px solid #F5F5F5;}
	.eva_con_01{display: flex;line-height: 25px;}
	.eva_con_01 img{height: 25px;width: 25px;border-radius: 30px;margin-right: 10px;}
	.eva_con_02{color: #6D6D6D;padding: 5px 0;}
	.eva_con_03{color:#A1A1A1;}
	.more a{line-height: 40px;display: flex;justify-content: center;}
	
}
</style>
