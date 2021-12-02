<template>
	<view class="st-default">
		<u-line class="u-line" :color="dat.line_color" :border-style="dat.line_border"></u-line>

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
		data() {
			return {}
		},
		computed: {
			fun_select() {
				if (this.vuex_xz.type == 'line' && this.vuex_xz.id == this.dat.unique) {
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
	.st-default {}
</style>
