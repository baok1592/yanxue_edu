<template>
	<view class="pro_big"  >
		<template v-if="imgurl==null"><image :src="list.img"></image></template>
		<template v-else><image :src="imgurl+list.img" ></image></template>
		<view class="pro_big_tit">{{list.title}}</view>
		<view class="pro_big_des">{{list.wang}}</view>
		<view class="pro_big_01">
			<view class="pro_big_01_l">
				<span>¥{{list.price}}</span> 已预约：{{list.yuyue}} 剩余：{{list.sheng}}
			</view>
			<view class="button">
				<u-button type="error" size="mini" shape="circle">立即预约</u-button>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
	  name: '', 
	  props: ['list'], 
	  data() {
	    return {
			imgurl:this.$getimg
	    } 
	  },
	   mounted(){      
	  },
	  methods:{
		   
	  }
	}
</script>

<style lang="scss">
.pro_big{margin:0 20px 34px; border-radius: 8px; background-color: #ffffff;position: relative; width: 100%;
	image{width: 100%; height:175px;border-radius: 3px;}
	.pro_big_tit{max-height: 20px;line-height: 20px;overflow: hidden;}
	.pro_big_des{color: #87888A;max-height: 40px;line-height: 20px;overflow: hidden;margin-top: 5px;}
	.pro_big_01{display: flex;justify-content: space-between;margin-top: 7px;}
	.pro_big_01_l{color: #87888A;font-size: 13px;
		span{padding-right: 3px;}
	}
}
</style>
