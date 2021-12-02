<template>
	<view class="content" :style="{'background-color': diydata.page_info.page_background_color}">
		<!-- <view class="content" :style="{'background-color': '#f4f4f5'}"> -->
		<!-- 删除 sortable -->
		<!-- <div id="del" class="sortable-panel sortable_delete" v-show="!isPhone&&isShowDelete" :class="{'': isShowDeleteStyle}">
			<image style="width: 100rpx;height: 100rpx;opacity: 0.7;" src="@/static/icon-img/delete.png" mode=""></image>
		</div> -->



		<view id="sort-1" class="sortable sortable-panel">
			<block v-for="(result,index) in diydata.sorts.child" :key="index">
				<st-line v-if="result.sorts == 'st-line'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-line>
				<st-search v-if="result.sorts=='st-search'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-search>
				<st-notice v-if="result.sorts == 'st-notice'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-notice>
				<st-tabs v-if="result.sorts == 'st-tabs'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-tabs>
				<st-order v-if="result.sorts == 'st-order'" :isPhone="diydata.isPhone" :refresh="diydata.shop_list"
					:oType="oType" :dat="result" @getUnique="activeGetUnique"></st-order>


			</block>
		</view>
		<view style="height: 50rpx;">

		</view>
	</view>
</template>

<script>
	// import draggable from 'vuedraggable'
	import Sortable from "sortablejs";
	
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
				oType: null,
			}
		},
		onLoad(option) {
			this.oType = option.type;
			console.log("ss", this.oType)
		},
		mounted() {


		},
		computed: {
			// 监听页面布局是否发生改变
			isPageChange() {
				return this.data_sorts == JSON.stringify(this.sorts);
			},

		},
		onShow() {
			this.get_info()
			this.getPageTheme();
		},
		methods: {
			//全局下拉
			show_data() {
				diy.diyData.shop_list = !diy.diyData.shop_list;
			},
			get_info() {
				// #ifdef H5
				diy.change(1040)
				const _this = this;
				window.addEventListener('message', this.response);
				let isPhone = navigator.userAgent.toLowerCase();
				if (isPhone.indexOf('windows') != -1) {
					diy.getEff(_this, false, "false");
					diy.diyData.isPhone = false;
				} else {
					diy.getEff(_this, true, "false");
					diy.diyData.isPhone = true;
				}
				// #endif
				// #ifdef MP-WEIXIN ||MP-TOUTIAO
				diy.change(1040)
				const _this = this;
				const diyRes = diy.getEff(_this, true, 'false');
				diyRes.then(res => {
					console.log("aaaaa", res)
					res.isPhone = true;
					_this.diydata = res
				})
				// #endif

				//#ifdef APP-PLUS
				diy.change(1040)
				const _this = this;
				diy.getEff(_this, true, 'false');
				diy.diyData.isPhone = true;
				//#endif
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
			//响应cms窗口的数据
			response(event) {
				console.log("event", event)
				diy.save(event, this, "index");
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
