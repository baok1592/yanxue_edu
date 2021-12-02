<template>
	<view class="fc" @click="skip()">
		<image :src="list.img"></image>
		
		<view class="fc_tit">{{list.title}}</view>
	</view>
</template>

<script>
	export default {
	  name: 'List-d', 
	  props: ['list'], 
	  data() {
	    return {
	    } 
	  },
	   methods:{      
		   skip(){
			   this.$emit("click")
		   }
	  }
	}
</script>

<style lang="scss">
.fc{position: relative;
	image{width: 100%;height: 130px;padding: 0;margin: 0;}
	.fc_tit{position: absolute;bottom: 3px;left: 0;height: 28px;line-height: 28px;padding-left: 7px;color: #fff;
	background-color: rgba(0,0,0,0.3);width: 100%;box-sizing: border-box;padding-right: 10%;white-space: nowrap;
	overflow: hidden;text-overflow: ellipsis;}
		}
</style>
