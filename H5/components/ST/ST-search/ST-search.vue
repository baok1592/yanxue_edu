<template>
	<view :class="{'st-item-fixed': dat.disable&&!isPhone}" class="search">
		
		<view class="search">
			<u-search
			  :show-action="dat.search_show_action=='false'?false:true"
			  :input-align="dat.search_input_align"
			  :action-text="dat.search_action_text"
			  :placeholder="dat.placeholder"
			  v-model="dat.default_value"
			  :shape="dat.search_shape"
			  :clearabled="dat.search_clearabled=='false'?false:true"
			  ></u-search>
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
				search: '',
			}
		},
		computed:{
			fun_select(){
				if(this.vuex_xz.type=='search' && this.vuex_xz.id == this.dat.unique){
					return true;
				}
				return false;				
			}
		},
		methods: {
			searchSubmit() {
				console.log(this.search);
			},
			// 鼠标点击组件获取该组件的 unique
			activeGetSorts() { 
				this.$emit('getUnique', this.dat);
			},
		}
	}
</script>

<style lang="scss" scoped>
.search {
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 0 0 20rpx 0;
	// border-bottom: 2rpx solid #eee;
	padding: 10rpx 10rpx;

	.img {
		width: 50rpx;
		height: 50rpx;
		flex-shrink: 0;
	}

	.search-input {
		width: 100%;
		padding: 0 30rpx;
	}

	.search-btn {
		flex-shrink: 0;
	}
}
</style>
