<template>
	<view class="st-default">  
			<map class="shop-list" :style="'height: '+dat.map_height+'px;'"  scale="16" ></map>
			
			<view class="map-addres" v-if="dat.map_address">
				<view style="display: flex;">
					<u-icon name="map" class="icon-left"></u-icon>
					<view>XXX省XXX市XXX路</view>
				</view>
				<u-icon name="arrow-right" class="icon-right"></u-icon>
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
				height:300,
				longitude:"", //中心经度
				latitude:"", //中心纬度	
				
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
				if(this.vuex_xz.type=='map' && this.vuex_xz.id == this.dat.unique){
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
.shop-list {
		width: 100%;
		
	}
.map-addres{
	display: flex;
	justify-content: space-between;
	padding: 24rpx  24rpx;
		.icon-left{
			font-size: 40rpx;
			color: #909399;
			margin-right: 24rpx;
		}
		.icon-right{
			font-size: 30rpx;
			color: #909399;
		}
}
</style>
