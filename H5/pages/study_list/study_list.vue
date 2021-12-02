<template>
	<view class="content" :style="{'background-color': diydata.page_info.page_background_color}">
		<!-- 删除 sortable -->
		<!-- <div id="del" class="sortable-panel sortable_delete" v-show="!isPhone&&isShowDelete" :class="{'': isShowDeleteStyle}">
			<image style="width: 100rpx;height: 100rpx;opacity: 0.7;" src="@/static/icon-img/delete.png" mode=""></image>
		</div> -->

		<view id="sort-1" class="sortable sortable-panel">
			<template v-for="(result,index) in diydata.sorts.child">
				<st-article-list v-if="result.sorts == 'st-article-list'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-article-list>

				<st-search v-if="result.sorts=='st-search'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-search>

				<st-input v-if="result.sorts == 'st-input'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-input>

				<st-button v-if="result.sorts == 'st-button'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-button>

				<st-applys v-if="result.sorts == 'st-applys'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-applys>

				<st-notice v-if="result.sorts == 'st-notice'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-notice>

				<st-shop-list v-if="result.sorts == 'st-shop-list'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-shop-list>

				<st-line v-if="result.sorts == 'st-line'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-line>

				<st-title v-if="result.sorts == 'st-title'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-title>

				

				<st-image v-if="result.sorts == 'st-image'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-image>

				<st-tag v-if="result.sorts == 'st-tag'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-tag>

				<st-tabs v-if="result.sorts == 'st-tabs'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-tabs>

			</template>
		</view>
	</view>
</template>

<script>
	// import draggable from 'vuedraggable'
	
	import {
		DIYdata
	} from "@/common/DIYdemo.js"
	const diy = new DIYdata;
	export default {
		components: {
			
		},

		data() {
			return {

				diydata: diy.diyData,
			}
		},
		onShow() {
			this.get_info()
			// _this.initSortable('del', false, -1);
			this.getPageTheme();
		},
		computed: {
			// 监听页面布局是否发生改变
			isPageChange() {
				return this.data_sorts == JSON.stringify(this.sorts);
			},

		},
		methods: {
			get_info() {
				// #ifdef H5
				diy.change(1005)
				window.addEventListener('message', this.response);
				let isPhone = navigator.userAgent.toLowerCase();
				const _this = this;
				if (isPhone.indexOf('windows') != -1) {
					diy.getEff(_this, false, 'coverStyle');
					diy.diyData.isPhone = false;
				} else {
					console.log("sss")
					diy.getEff(_this, true, 'coverStyle');
					diy.diyData.isPhone = true;
				}
				// #endif

				// #ifdef MP-WEIXIN ||MP-TOUTIAO ||APP-PLUS
				diy.change(1005)
				const _this = this;
				diy.getEff(_this, true, 'coverStyle');
				diy.diyData.isPhone = true;
				// #endif

				// _this.initSortable('del', false, -1);
				diy.getPageTheme();
			},
			//鼠标点击获取点击id
			activeGetUnique(item) {
				const _this = this;
				diy.activeGetUnique(item, _this)
			},

			//获取页面主题
			getPageTheme() {
				diy.getPageTheme()
			},
			// 更新页面主题
			updatePageTheme() {
				this.getPageTheme();
			},
			//响应窗口的数据
			response(event) {
				diy.save(event, this, "cover");
			},

		}
	}
</script>

<style lang="scss" scoped>
	.sortable_delete {
		position: fixed;
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

	.content {
		min-height: calc(100vh - 44px);

		.sortable {
			width: 100%;

			>* {
				margin-top: 30rpx;
				margin-bottom: 30rpx;

				&:first-child {
					margin-top: 0;
				}

				&:last-child {
					margin-bottom: 0;
					padding-bottom: 30rpx;
				}
			}
		}
	}
</style>
