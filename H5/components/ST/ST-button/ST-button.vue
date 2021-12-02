<template>
	<view class="st-button">
		<view class="button" >
			<u-button
				:type="dat.theme_type" 
				:size="dat.button_size"
				:plain="dat.button_plain=='false'?false:true"
				:shape="dat.button_shape"
				@tap="buttonClick">{{dat.button_text||'按钮'}}</u-button>
		</view>
		
		<move-handle :isSelect="fun_select" :isPhone="isPhone" @choose="activeGetSorts"></move-handle>
	</view>
</template>

<script>
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
				
			}
		},
		computed:{
			fun_select(){
				if(this.vuex_xz.type=='button' && this.vuex_xz.id == this.dat.unique){
					return true;
				}
				return false;				
			}
		},
		methods: {			
			buttonClick() {
				console.log('点击', this.dat.button_text || '按钮');
			},
			// 鼠标点击组件获取该组件的 unique
			activeGetSorts() { 
				this.$emit('getUnique', this.dat);
			},
		}
	}
</script>

<style lang="scss" scoped>
.st-button {
	text-align: center;
}
</style>
