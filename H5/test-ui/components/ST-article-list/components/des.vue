<template>
	<view class="des" @click="click()">
		<view class="des_l">
			<img :src="list.img"></img>
		</view>
		<view class="des_r">
			<view class="des_r_tit">{{list.title}}</view>
			<view class="des_r_des">{{list.wang}}</view>
		</view>
	</view>
</template>

<script>
	export default {
	  name: '', 
	  props: ['list'], 
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
.des{margin: 20px;background-color: #fff;display: flex;justify-content: space-between;
	.des_l{width: 45%;height:180px;
		img{width: 100%;height: 100%;border-radius: 6px;}
	}
	.des_r{width: 48%;
		.des_r_tit{margin: 15px 0 15px;max-height: 40px;line-height: 20px;overflow: hidden;}
		.des_r_des{font-size: 12px;height: 100px;line-height: 20px;overflow: hidden;color: #656565;}
	}
}
	
</style>
