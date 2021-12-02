<template>
	<view class="content "
		:style="{'background-color': diydata.page_info.page_background_color,'background-image':'url('+img+diydata.page_info.bg_img+')', 'background-size':'100%','background-repeat':diydata.page_info.json}">
		<!-- 删除 sortable -->
		<!-- <div id="del" class="sortable-panel sortable_delete" v-show="!isPhone&&isShowDelete" :class="{'': isShowDeleteStyle}">
			<image style="width: 100rpx;height: 100rpx;opacity: 0.7;" src="@/static/icon-img/delete.png" mode=""></image>
		</div> -->

		<view id="sort-1" class="sortable sortable-panel" :class="diydata.themeColors" v-if="look_show">
			<block v-for="(result,index) in diydata.sorts.child" :key="index">

				<st-input v-if="result.sorts == 'st-input'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-input>

				<st-applys v-if="result.sorts == 'st-applys'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-applys>

				<st-notice v-if="result.sorts == 'st-notice'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-notice>

				<st-line v-if="result.sorts == 'st-line'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-line>

				<st-title v-if="result.sorts == 'st-title'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-title>
				<st-image v-if="result.sorts == 'st-image'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-image>
				<st-html v-if="result.sorts == 'st-html'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique" :contens="article_data.content" :is_article="is_article"></st-html>
				<st-server-title v-if="result.sorts == 'st-server-title'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique" :data="article_data"></st-server-title>
			</block>

			<view style="height: 50rpx;">

			</view>
		</view>
		<view style="padding-top: 40%;" v-else>
			<u-empty text="无权限" mode="permission">
				<view slot="bottom">
					<u-button type="primary" size="medium" @click="pay_vip()">购买会员</u-button>
				</view>
			</u-empty>
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
				id: 1039,
				//数据列表id
				nav_id: "",
				//tabbar显示
				tabbar_show: false,
				is_article: true,
				article_data: {
					content: '默认内容',
					title: "默认标题",
				},
				back_show: false,
				look_show: true,
			}
		},
		onShow() {

			// #ifdef H5
			diy.change(1039)
			window.addEventListener('message', this.response);
			let isPhone = navigator.userAgent.toLowerCase();
			const _this = this;
			if (isPhone.indexOf('windows') != -1) {
				diy.getEff(_this, false, 'false');
				diy.diyData.isPhone = false;
			} else {
				diy.getEff(_this, true, 'false');
				diy.diyData.isPhone = true;
			}
			this.moren();
			// #endif

			// #ifdef MP-WEIXIN||MP-TOUTIAO
			diy.change(1039)
			const _this = this;
			const diyRes = diy.getEff(_this, true, 'false');
			diyRes.then(res => {
				console.log("aaaaa", res)
				res.isPhone = true;
				this.diydata = res
			})
			// #endif

			// #ifdef APP-PLUS
			diy.change(1039)
			const _this = this;
			diy.getEff(_this, true, 'false');
			diy.diyData.isPhone = true;
			// #endif
			// _this.initSortable('del', false, -1);


			diy.getPageTheme();
		},
		computed: {
			// 监听页面布局是否发生改变
			isPageChange() {
				return diy.data_sorts == JSON.stringify(this.sorts);
			},

		},
		watch: {
			/* abc(){
				console.log("!!!!!!!!!!!!!!")
				this.abc= "asd"
			} */
			article_data(n) {
				console.log("改变", n)
			}
		},
		onLoad(option) {
			console.log("onLoad", option)
			this.getArticle(option.id)
			let luyou = getCurrentPages();
			console.log("luyou", luyou)
			if (luyou.length > 1) {
				this.back_show = false;
			} else {
				this.back_show = true;
			}
		},
		methods: {
			//判断是否需要默认数据
			moren() {
				let obj = {
					content: '接口数据',
					title: "接口数据",

				};
				if (this.diydata.isPhone == false) {
					this.article_data = obj;
				}
			},
			//全局下拉
			show_data() {
				diy.diyData.shop_list = !diy.diyData.shop_list;
				console.log("index页面", this.shop_list)
			},
			//鼠标点击获取uniid
			activeGetUnique(item) {
				const _this = this;
				console.log("item", this)
				diy.activeGetUnique(item, this)
			},
			//获取内容信息
			getArticle(id) {
				this.$http.get(this.$api.article.get_article + '?id=' + id).then(res => {
					console.log("ss", res)
					if (res.status == 200) {
						this.article_data = res.data
						console.log("!!22222222")
						this.abc = "kkkk"
						let art = "该文章为vip文章，请购买VIP再进行阅读"
						if (res.data[0].content == art) {
							this.look_show = false;
						} else {
							this.look_show = true;
						}
					}
				})
			},
			//响应窗口的数据
			response(event) {
				diy.save(event, this, "");
			},

			//返回首页
			back() {
				uni.reLaunch({
					url: '/pages/index/index'
				});
			},
			//购买会员
			pay_vip() {
				uni.navigateTo({
					url: "../vip/vip"
				})
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
