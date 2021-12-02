<template>
	<view class="st-default st-title">  
		<view class="shop-list">
			<view :class="[list_type[dat.title_type]]" class="st-shop-list">
				<view  class="theme-colors-title-left" :class="[list_type[dat.title_type]=='shop-list-2'?'blue':'',list_type[dat.title_type]=='shop-list-2'&true?'back':'']" ></view>
				<view class="title theme-colors-title-text"> 
					<view class="iconfont theme-colors-title-text" :class="list_type[dat.title_type]=='shop-list-3'?'icon-hengxian1':''"></view>					
					<view>{{dat.title_text}}</view>
					<view class="iconfont theme-colors-title-text" :class="list_type[dat.title_type]=='shop-list-3'?'icon-hengxian1':''"></view>
				</view>
				<view class="iconfont theme-colors-title-text" :class="[list_type[dat.title_type]=='shop-list-4'?'icon-sort-bottom1':'',list_type[dat.title_type]=='shop-list-4'?'down':'']"></view>
			</view>
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
				// 列表样式表
				list_type: {
					'list-type-1': 'shop-list-1',
					'list-type-2': 'shop-list-2',
					'list-type-3': 'shop-list-3',
					'list-type-4': 'shop-list-4',
					'list-type-5': 'shop-list-5',
					'list-type-6': 'shop-list-6',
				},
			}
		}, 
		computed:{
			fun_select(){
				if(this.vuex_xz.type=='title' && this.vuex_xz.id == this.dat.unique){
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
.down{
	margin-top: 10rpx;
}
.theme-colors-title-left{		//样式二的颜色，轻站中在全局定义得有
	background-color: #000;
}
.shop-list {
		padding: 20rpx 0rpx 0rpx 20rpx;
		font-size: 28rpx;
		height: 19%;	
		font-weight: bold;
		&-1{
			
		}
		&-2{
			display: flex;			
			.blue{
				height: 38rpx;
				border-radius: 10rpx;
				margin-right: 20rpx;
				width: 8rpx;
				//background-color:#2979ff ;
			}
		}
		&-3{
			display: flex;
			justify-content: center;			
			.title{
				display: flex;
				align-items: center;
				.iconfont{
					font-size: 18px;
					font-weight: lighter;
					margin: 0px 8px;
				}
			}
		}
		&-4{
			display: flex;
			flex-direction: column;
			align-items: center;						
		}
	}
</style>
