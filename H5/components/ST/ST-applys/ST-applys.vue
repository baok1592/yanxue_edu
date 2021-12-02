<template>
	<view class="st-applys">
		<view class="applys" :class="{'applys_horizontal':dat.direction=='horizontal', 'applys_vertical':dat.direction=='vertical'}">
			<view>123</view>
			<view>345</view>
			<view>567</view>
			<view>789</view>
		</view>
		<move-handle :isPhone="isPhone" @choose="activeGetSorts"></move-handle>
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
			return {}
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
.st-applys {
	width: 100%;
	
	.applys {
		width: 100%;
		
		>view {
			text-align: center;
		}
		
		&_horizontal {
			display: flex;
			justify-content: space-between;
			
			>view {
				width: 24%;
				padding: 10rpx;
				&:nth-child(1) {
					background-color: #007AFF;
				}
				&:nth-child(2) {
					background-color: #a7bfff;
				}
				&:nth-child(3) {
					background-color: #e6ff92;
				}
				&:nth-child(4) {
					background-color: #4fffca;
				}
			}
		}
		&_vertical {
			>view {
				width: 100%;
				padding: 10rpx;
				margin-bottom: 10rpx;
				&:nth-child(1) {
					background-color: #007AFF;
				}
				&:nth-child(2) {
					background-color: #a7bfff;
				}
				&:nth-child(3) {
					background-color: #e6ff92;
				}
				&:nth-child(4) {
					background-color: #4fffca;
				}
				&:last-child {
					margin-bottom: 0;
				}
			}
		}
	}
}
</style>
