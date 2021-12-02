<template>
	<view class="distance" @click="click()">
	
		<view class="zu_l"  v-if="list.img">
			<img :src="list.img.url"></img>
		</view>
		<view class="zu_m">
			<view class="zu_m_2 mb-3">
				<view class="zu_m_2_1">{{list.title}}</view>
				<!-- <view class="zu_m_2_1">{{list.yuyue}}m</view> -->
			</view>
			<view class="zu_m_3">
				{{list.summary}}
				<view class="zu_m_3_r"><text class="lg text-gray cuIcon-right" ></text></view>
			</view>
		</view>
		
	</view>
</template>

<script>
	export default {
	  name: 'List-d', 
	  props: ['list','type'], 
	  data() {
	    return {
	    } 
	  },
	   mounted(){      
	  },
	 methods:{
	 		  click(){
	 		  		 this.$emit("click")
	 		  }
	 }
	}
</script>

<style lang="scss">
.distance{display: flex;justify-content: space-between;background-color: #fff;padding: 10px 2.5px;margin: 10px;width: 100%;
box-shadow: 0 0 7px #F3F3F3;border: 1px solid #F3F3F3;border-radius: 5px;
	.zu_l{width: 20%;height: 70px;margin: 0 7.5px;
		img{width: 70px;height: 70px;}
	}
	.zu_m{flex-grow: 1;padding: 5px 7.5px;width: 80%;
		.zu_m_2{display: flex;justify-content: space-between; height: 30rpx;line-height: 30rpx;overflow: hidden;}
		.zu_m_3{color: #9E9E9E;display: flex;justify-content: space-between;height: 60rpx;line-height: 30rpx;overflow: hidden;
			.zu_m_3_r{width: 30px;flex-shrink: 1;display: flex;flex-direction: column;justify-content: center;}
		}
	}
}
</style>
