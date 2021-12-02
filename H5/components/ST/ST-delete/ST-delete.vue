<template>
	<div id="del" class="sortable-panel sortable_delete" v-show="!isPhone&&isShowDelete" :class="{'': isShowDeleteStyle}">
		<image style="width: 100rpx;height: 100rpx;opacity: 0.7;" src="../../static/icon-img/delete.png" mode=""></image>
	</div>
</template>

<script>
	export default {
		props: {
			isShowDelete: {
				type: Boolean
			},
			isPhone: {
				type: Boolean,
			},
		},
		data () {
			return {
				// 控制删除组件显示
				// isShowDelete: false,
				// 控制组件托到删除框时，删除框的样式
				isShowDeleteStyle: false,
			}
		},
		methods: {
			// 鼠标点击组件获取该组件的 unique
			activeGetSorts(unique) {
				this.$emit('getUnique', unique);
			},
		}
	}
</script>

<style lang="scss" scoped>
.sortable_delete {
	position: fixed !important;
	top: 2rpx;
	left: 2rpx;
	width: 250rpx;
	height: 250rpx;
	display: flex;
	justify-content: center;
	align-items: center;
	border: 2rpx dotted #F56C6C;
	padding: 40rpx;
	border-radius: 20rpx;
	color: #F56C6C;
	z-index: 999;
	background-color: white;
	transition: all 1s;
	overflow: hidden;
	* {
		width: 0;
		height: 0;
		overflow: hidden;
	}
}
</style>
