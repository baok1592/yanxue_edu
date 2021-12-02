<template>
	<view style="background-color: #f4f4f5;height: 100vh;" class="position-relative">
		<view class="pro_big">
			<template v-if="imgurl==null"><img :src="good_info.img.url"></img></template>
			<template v-else><img :src="imgurl+list.img"></img></template>
			<view class="pro_big_tit">{{good_info.name}}</view>
			<view class="pro_big_des">{{list.wang}}</view>
			<view class="pro_big_01">
				<view class="pro_big_01_l">
					<span>¥{{good_info.price | count_price}}</span> 已预约：{{list.yuyue}} 剩余：{{list.sheng}}
				</view>
			<!--<view>
					<u-button type="error" size="mini" shape="circle">立即预约</u-button>
				</view> -->
			</view>
		</view>

		<view class="bg-white px-1" style=" margin-bottom: 10px; min-height: 360px;">
			<view class=" ps-1 py-2 ">
				<view class="d-flex ">
					<view class="gang"></view>
					<view>标题</view>
				</view>
			</view>
			<u-line color="info"></u-line>
			<view class="py-3 ">
				<u-parse :html="good_info.content"></u-parse>
			</view>
		</view>
		
		<view class="bg-white bot-pay ps-2 pt-1 position-sticky bottom-0" style="height: 55px;line-height: 55px;">
			<u-row>
				<u-col  span="2"  @click="home()">
					<u-icon name="home" size="45" label="首页"></u-icon>
				</u-col>
				<u-col  span="2" >
					<u-icon name="phone" size="45" label="电话"></u-icon>
				</u-col>
				<u-col  span="8">
					<u-button type="success" shape="circle" @click="skip()">立即预约</u-button>
				</u-col>
			</u-row>
		</view>
		
	</view>
</template>

<script>
	export default {
		data() {
			return {
				id:null,
				list: {
					title: '阿圣诞节啊收到货阿圣诞节',
					wang: '中国手机网',
					ping: '2019评论',
					img: require('@/static/img/11.jpeg'),
					des: '这里是描述这里是描述这里是描述这里是描述这',
					name: '名字',
					price: '22',
					yuyue: '31',
					sheng: '55'
				},
				imgurl: null,
				good_info:'',
				content: `
									<p>露从今夜白，月是故乡明</p>
									<img src="https://cdn.uviewui.com/uview/swiper/2.jpg" />
									
								`
			}
		},
		onLoad(option) {
			this.id=option.id;
		},
		onShow(){
			this.show_data();
		},
		methods: {
			//全局mixin便于下拉刷新与分享
			show_data() {
				this.get_info();
			},
			//获取信息
			get_info(){
				this.$http.get(this.$api.course.get_course+"?id="+this.id).then(res=>{
					if(res.status==200){
						this.good_info=res.data;
					}
				})
			},
			home(){
				uni.switchTab({
					url:"/pages/index/index"
				})
			},
			skip(){
				uni.navigateTo({
					url:"/pages/pay/pay?id="+this.id+"&price="+this.good_info.price
				})
			},
		}
	}
</script>

<style lang="scss" scoped>
	.bot-pay{
		position: sticky;
		width: 100%;
		top: 200px;
	}
	.gang {
		height: 38rpx;
		border-radius: 10rpx;
		margin-right: 20rpx;
		width: 8rpx;
		background-color: #2979ff;
	}

	.pro_big {
		margin: 0 0px 8px;
		padding: 15px 5px;
		border-bottom: 1px solid #F1F1F1;
		background-color: #FFF;
		width: 100%;

		img {
			width: 100%;
			height: 175px;
			border-radius: 3px;
			margin-bottom: 8px;
		}

		.pro_big_tit {
			max-height: 20px;
			line-height: 20px;
			overflow: hidden;
		}

		.pro_big_des {
			color: #87888A;
			max-height: 40px;
			line-height: 20px;
			overflow: hidden;
			margin-top: 5px;
		}

		.pro_big_01 {
			display: flex;
			justify-content: space-between;
			margin-top: 7px;
		}

		.pro_big_01_l {
			color: #87888A;
			font-size: 13px;

			span {
				color: #E54D42;
				padding-right: 3px;
			}
		}
	}
</style>
