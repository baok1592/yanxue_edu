<template>
	<view class="st-default">
		<!-- 你的代码放在这里 -->
		<view class="notice">
			<u-notice-bar
				:list="list"
				:type="dat.theme_type"
				:mode="dat.notice_scroll"
				:speed="dat.notice_speed"
				:volume-icon="dat.notice_volume_icon=='true'?true:false"
				:is-circular="dat.notice_join=='false'?false:true"
			></u-notice-bar>
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
				list: [
					'公告一',
					'公告二',
				]
			}
		},
		computed:{
			fun_select(){
				if(this.vuex_xz.type=='notice' && this.vuex_xz.id == this.dat.unique){
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
