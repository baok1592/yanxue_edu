<template>
	<view class="st-default">  
		<view class="presentation">
			<view class="title"  v-if="dat.presentation_show">{{dat.presentation_title}}</view>
			<view :style="{textAlign:this.dat.presentation_type}">{{dat.presentation_text}}</view>
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
			},
			
		},
		data () {
			return {
				styleObject:{
					textAlign:this.dat.presentation_type,
					
				},
				// 列表样式表
				list_type: {
					'list-type-1': 'shop-list-1',
					'list-type-2': 'shop-list-2',
					'list-type-3': 'shop-list-3',
					'list-type-4': 'shop-list-4',
					'list-type-5': 'shop-list-5',
					'list-type-6': 'shop-list-6',
				},
				text:"为了避免Internet Explorer 中无法调整文本的问题，许多开发者使用 em 单位代替像素。"
			}
		}, 
		computed:{
			fun_select(){
				if(this.vuex_xz.type=='presentation' && this.vuex_xz.id == this.dat.unique){
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
.presentation{
	padding: 24rpx;
}
.title{
	text-align: center;
	font-size: 34rpx;
	font-weight: bold;
	margin-bottom: 24rpx;
}

</style>
