<template>
	<view class="st-default">  			
			<view :style="dat.img_padding_show==true?'padding: '+dat.img_padding+'px;':'padding:0px;'">				
				
				<view :style="'width: 100%; height: '+dat.img_height+'px;'">
					<image :src="dat.img_serve_url==''?url:img+dat.img_serve_url" style="width: 100%; height: 100%;"></image>
				</view>
			</view>			
		<move-handle :isSelect="fun_select" :isPhone="isPhone" @choose="activeGetSorts"></move-handle>
	</view>
</template>

<script>
	//import {Api_url} from './config.js'
	export default {
		props: {
			isPhone: {
				type: Boolean,
			},
			dat: {
				type: Object,
			}
		},
		data () {
				
			return {
				url:"https://ossweb-img.qq.com/images/lol/web201310/skin/big84000.jpg",
				des:"dat.img_height+'px'",
				img:"http://192.168.124.14:8090/",
			}
		}, 
		computed:{
			fun_select(){
				if(this.vuex_xz.type=='image' && this.vuex_xz.id == this.dat.unique){
					return true;
				}
				return false;				
			}
		},
		methods: {
			// 鼠标点击组件获取该组件的 unique
			activeGetSorts() {
				this.$emit('getUnique', this.dat);
			},
		}
	}
</script>

<style lang="scss" scoped>
.st-default {
	
}

</style>
