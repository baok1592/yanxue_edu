<template>
	<view :class="{'st-item-fixed': dat.disable&&!isPhone}" class="tags">
		<!-- 你的代码放在这里 -->
		<view class="tag">
			<u-tag  
			 :type="dat.tag_type" :text="dat.tag_text||'标签'" />
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
				tag: '',
			}
		},
		computed:{
			//修改下面的xxxx
			fun_select(){
				if(this.vuex_xz.type=='tag' && this.vuex_xz.id == this.dat.unique){
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
.tags {
	.tag{
		text-align: center;
	}
}
</style>
