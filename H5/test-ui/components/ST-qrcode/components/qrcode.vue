<template>
	<view class="qrocde-modal">
		<view  class="modal-bg" :style="{zIndex:zindex}" @click="closed()"></view>
		<view class="modal-box animated fast" :style="{zIndex:zindex+1,background:bg}" :class="show   ? 'slideInUp' : 'slideOutDown'">
			<view class="modal-main">
				<view class="closed">
					<text @click="closed()" ><u-icon name="close"></u-icon></text>
				</view>
				<view class="lh20 ft16 cl-main ftw600 text-center" v-if="type=='teacher'">教师分享二维码</view>
				<view class="lh20 ft16 cl-main ftw600 text-center" v-else>我的分享二维码</view>
				<view @click="getp()" class="text-center"  style="height: 400rpx;margin-top:28%;">
					<image :src="src" style="width: 400rpx; height: 400rpx;"></image>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	import  QR   from '@/static/js/wxqrcode.js';
	
	export  default{
		props:{
			zindex:{
				type:Number,
				default:401,
			},
			bg:{
				type:String,
				default:'#ffffff',
			},
			src:{
				type:String
			},
			type:{
				type:String,
				default:'company',
			}
		},
		data(){
			return {
				show:false,
				qrcodeImg:'',
				uid:'',
			}
		},
		created(){
			this.show = true;
			this.uid = uni.getStorageSync("userinfo").id;
			let img = QR.createQrCodeImg('{"uid":'+this.uid+'}', {  
			     size: 300//二维码大小  
			})
			
			this.qrcodeImg = img;
		},
		methods:{
			closed(){
				this.show = false;
				setTimeout(()=>{
					this.$emit('closed');
				},400);
			},
			getp(){
				let thia=this.qrcodeImg
				//#ifdef APP-PLUS  
				uni.saveImageToPhotosAlbum({
				    filePath: thia.qrcodeImg,
				    success: function () {
				        console.log('save success');
				    }
				});
				//#endif
			}
		}
	}
</script>

<style>
	.qrocde-modal{
		position: relative;
		
		z-index: 9999;
	}
	.qrocde-modal .modal-bg{
		position: fixed;
		z-index: 400;
		left: 0;
		top: 0;
		width: 100%;
		height: 100vh;
		background: rgba(0,0,0,.5);
	}
	.qrocde-modal .modal-box{
		position: fixed;
		z-index: 401;
		background:#FFFFFF;
		left: 0;
		bottom: 0;
		width: 100%;
		padding-bottom:0rpx;
		padding-bottom:constant(safe-area-inset-bottom);
		padding-bottom:env(safe-area-inset-bottom);
		border-radius:32rpx 32rpx 0rpx 0rpx;
	}
	.qrocde-modal .modal-main{
		position: relative;
		height: auto;
		overflow: hidden;
		min-height: 1000rpx;
		padding-top: 64rpx;
		padding-bottom: 40rpx;
	}
	.qrocde-modal .modal-main .closed{
		position: absolute;
		right: 40rpx;
		top: 40rpx;
	}
</style>