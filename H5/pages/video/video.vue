<template>

	<view class="content "
		:style="{'background-color': diydata.page_info.page_background_color,'background-image':'url('+img+diydata.page_info.bg_img+')', 'background-size':'100%','background-repeat':diydata.page_info.json}">
		<!-- 删除 sortable -->
		<!-- <u-navbar :background="diydata.background" back-icon-color="#FFF" :title="diydata.navbar_title" style="margin: 0px; padding: 0px;" title-color="#FFF" :is-back="tabbar_show ==false?true:false"></u-navbar>		 -->
		<view id="sort-1" class="sortable sortable-panel" :class="diydata.themeColors">
			<block v-for="(result,index) in diydata.sorts.child" :key="index">

				<st-qrcode v-if="result.sorts == 'st-qrcode'" :isPhone="diydata.isPhone" :dat="result" @getUnique="activeGetUnique"></st-qrcode>
				
				<st-search v-if="result.sorts=='st-search'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-search>

				<st-form v-if="result.sorts=='st-form'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique" :color="diydata.background.backgroundColor"></st-form>

				<st-button v-if="result.sorts == 'st-button'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-button>

				

				<st-notice v-if="result.sorts == 'st-notice'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-notice>

				<st-line v-if="result.sorts == 'st-line'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-line>

				<st-cell v-if="result.sorts == 'st-cell'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-cell>

				<st-title v-if="result.sorts == 'st-title'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-title>

				<st-presentation v-if="result.sorts == 'st-presentation'" :isPhone="diydata.isPhone" :dat="result"
					:content="videoInfo.content" @getUnique="activeGetUnique"></st-presentation>

				<st-contact v-if="result.sorts == 'st-contact'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-contact>

				<st-map v-if="result.sorts == 'st-map'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-map>

				<st-image v-if="result.sorts == 'st-image'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-image>

				<st-tag v-if="result.sorts == 'st-tag'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-tag>

				<st-tabs v-if="result.sorts == 'st-tabs'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-tabs>

				<st-video v-if="result.sorts == 'st-video'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique" :url="videoInfo.video"></st-video>

				<st-html v-if="result.sorts == 'st-html'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique" :contens="videoInfo.content" :is_article="true"></st-html>

			</block>
			<view style="height: 50rpx;">

			</view>

		</view>

		<!-- <XcxAuth :auth="auth" @userinfo="get_userinfo"></XcxAuth> -->
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
			// draggable,
			

		},

		data() {
			return {
				diydata: diy.diyData,
				img: this.$getimg,
				id: 1029,
				//数据列表id
				plan_id: "",
				//tabbar显示
				tabbar_show: true,
				videoInfo: {
					content: "",
					time: "",
					video: "",
				}
			}
		},
		onLoad(option) {
			this.plan_id = option.id
			if (option.type != 'tabbar') {
				//console.log("对对对",option.type,"ss")
				this.tabbar_show = false
			}
			this.get_index();
			this.get_vodeo();
		},
		onShow() {
			/*  */
			// _this.initSortable('del', false, -1);

		},
		computed: {
			// 监听页面布局是否发生改变
			isPageChange() {
				return diy.data_sorts == JSON.stringify(this.sorts);
			},

		},
		methods: {
			//加载布局
			get_index() {
				// #ifdef H5
				console.log("id", this.id)
				diy.change(this.id)
				const _this = this;
				window.addEventListener('message', this.response);
				let isPhone = navigator.userAgent.toLowerCase();
				if (isPhone.indexOf('windows') != -1) {
					const diyRes = diy.getEff(_this, false, "videoStyle"); //第三个数据为缓存名称
					diyRes.then(res => {
						res.isPhone = false;
						_this.diydata = res
					})
				} else {
					const diyRes = diy.getEff(_this, true, "videoStyle");
					diyRes.then(res => {
						res.isPhone = true;
						_this.diydata = res
					})
				}
				// #endif

				// #ifdef MP-WEIXIN ||MP-TOUTIAO
				diy.change(this.id)
				const _this = this;
				const diyRes = diy.getEff(_this, true, 'videoStyle');
				diyRes.then(res => {
					res.isPhone = true;

					this.diydata = res
				})
				// #endif

				//#ifdef APP-PLUS
				diy.change(this.id)
				const _this = this;
				const diyRes = diy.getEff(_this, true, 'videoStyle');
				diyRes.then(res => {
					res.isPhone = true;
					_this.diydata = res
				})
				//#endif
				diy.getPageTheme();
			},
			//响应窗口的数据
			response(event) {
				diy.save(event, this, "articlelist");
			},
			//全局下拉
			show_data() {
				diy.diyData.shop_list = !diy.diyData.shop_list;
				console.log("index页面", this.shop_list)
			},
			activeGetUnique(item) {
				const _this = this;
				console.log("item", this)
				diy.activeGetUnique(item, this)
			},
			//获取视频信息
			get_vodeo() {
				this.$http.get(this.$api.plan.get_plan_id + '?id=' + this.plan_id).then(res => {
					if (res.status == 200) {
						this.videoInfo = res.data.content
					}
				})
			}
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

			>view {
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
