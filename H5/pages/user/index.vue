<template>
	<view class="content" :style="{'background-color': diydata.page_background_color}"> 
		<!-- 删除 sortable -->
		<!-- <div id="del" class="sortable-panel sortable_delete" v-show="!isPhone&&isShowDelete" :class="{'': isShowDeleteStyle}">
			<image style="width: 100rpx;height: 100rpx;opacity: 0.7;" src="@/static/icon-img/delete.png" mode=""></image>
		</div> -->
		<view class="position-relative">
			<view class="header-top header text-center pt-3">
				<view class="imgs" @click="skip('/pages/user/userset/index')">
					<u-image width="140rpx" height="140rpx" shape="circle" :src="userinfo.avatarUrl!=null?userinfo.avatarUrl:header" ></u-image>
				</view>
				<view >{{userinfo.nickname!=null?userinfo.nickname:'游客~'}}</view>
			</view>
			<view class="header-bottom header">
				
			</view>
			
		</view>
		<view class="mx-4 header-box mb-3" style="margin-top: 120rpx;">
			<u-cell-group>
				<!-- <u-cell-item icon="play-circle" title="课程直播" @click="skip('/pages/video/video')"></u-cell-item> -->
				<u-cell-item icon="file-text"  title="教师端"  @click="skip('/teacher/teachercms/index')" v-if="is_teacher">
				</u-cell-item>
				<block v-else>
					<u-cell-item icon="calendar" title="请假"        @click="skip('/pages/user/adviser/adviser?type=vacate')"></u-cell-item>
				</block>
				<u-cell-item icon="question-circle" title="关于我们" @click="skip('/pages/user/us/us')"></u-cell-item>
				<u-cell-item icon="chat" title="反馈" @click="skip('/pages/user/adviser/adviser')"></u-cell-item>
			</u-cell-group>
		</view>
		
		<view id="sort-1" class="sortable sortable-panel px-4">
				<block v-for="(result,index) in diydata.sorts.child" :key="index">
					
				<st-search v-if="result.sorts=='st-search'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-search>
				
				<st-form v-if="result.sorts=='st-form'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-form>
				
				<st-input v-if="result.sorts == 'st-input'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-input>
				
				<st-button v-if="result.sorts == 'st-button'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-button>
				
				<st-applys v-if="result.sorts == 'st-applys'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-applys>
				
				<st-notice v-if="result.sorts == 'st-notice'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-notice>
				
				<st-line v-if="result.sorts == 'st-line'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-line>
				
				<st-cell v-if="result.sorts == 'st-cell'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-cell>
				
				<st-title v-if="result.sorts == 'st-title'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-title>
				
				<st-presentation v-if="result.sorts == 'st-presentation'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-presentation>
				
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
				
				<st-grid v-if="result.sorts == 'st-grid'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-grid>
				
				<st-qrcode v-if="result.sorts == 'st-qrcode'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-qrcode>
				
				<st-plan v-if="result.sorts == 'st-plan'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-plan>
				
				<st-chart v-if="result.sorts == 'st-chart'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-chart>
				
				<st-video v-if="result.sorts == 'st-video'" :isPhone="diydata.isPhone" :dat="result"
					@getUnique="activeGetUnique"></st-video>
					
				</block>
			</view>
			<!-- #ifdef MP-WEIXIN -->
			<XcxAuth :auth="auth" @userinfo="get_userinfo"></XcxAuth>
			<!-- #endif -->
			<view style="height: 50px;">
				
			</view>
	</view>
		
</template>

<script>
	
	import {CUser} from '@/common/cache/user.js'
	import {XcxToken} from '@/common/loging/xcx_token.js'
	var xcxtoken = new XcxToken();
	var cache_user = new CUser();
	import XcxAuth from "@/components/wx_auth/xcx_auth.vue"
	// import draggable from 'vuedraggable'
	import Sortable from "sortablejs";
	
	import {DIYdata} from "@/common/DIYdemo.js"
	const diy=new DIYdata;
	var time = Date.parse(new Date()) / 1000
	export default {
		components: {
			XcxAuth,
			
			
		},
		data() {
			return {
				header:require('@/static/img/youke.png'),
				diydata:diy.diyData,
				id:1037,
				userinfo: '', //微信用户信息
				auth: {
					is_name: false,
					is_address: false,
					is_phone: false,
				},
				is_teacher:false,
			}
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
			
			var token = uni.getStorageSync('token'); //获取缓存
			xcxtoken._veirfyFromServer(token)//检查token是否过期,过期重新获取
			
			//查看是否请求授权信息			
			this.get_my()
			
		},
		methods: {
			//全局下拉
			show_data(){				
				diy.diyData.shop_list=!diy.diyData.shop_list;
				this.get_myinfo();
			},
				//跳转页面
				skip(url){
					console.log(url);
					uni.navigateTo({
						url:url
					})
				},
				//拖拽
				get_info(){
					// #ifdef H5
						diy.change(this.id) 
						const _this = this; 				
						window.addEventListener('message',this.response);		
						let isPhone = navigator.userAgent.toLowerCase();
						if (isPhone.indexOf('windows') != -1) {
							diy.getEff(_this,false,"false");
							diy.diyData.isPhone = false;
						} else {
							diy.getEff(_this,true,"false");
							diy.diyData.isPhone = true;
						}
					// #endif
					// #ifdef MP-WEIXIN ||MP-TOUTIAO
						diy.change(this.id) 
						const _this = this;
						const diyRes= diy.getEff(_this,true,'false');
						diyRes.then(res=>{
							console.log("aaaaa",res)
						  res.isPhone = true;
						  _this.diydata=res
						}) 
					// #endif
								
					//#ifdef APP-PLUS
						diy.change(this.id)
						const _this = this;
						diy.getEff(_this,true,'false');
						diy.diyData.isPhone = true;
					//#endif
				},
			
			
			//鼠标点击获取点击id
			activeGetUnique(item){
				const _this = this;
				diy.activeGetUnique(item,_this)
			},
			//获取页面主题
			getPageTheme(){						
				diy.getPageTheme()
			},
			// 更新页面主题
			updatePageTheme() {
				this.getPageTheme();
			},
			//响应cms窗口的数据
			response(event){
				console.log("event",event)
				diy.save(event,this,"index");
			},
			get_userinfo(e) {
				this.userinfo = e
				uni.navigateBack({})
			},
			//更新个人信息
			get_myinfo(){
				this.$http.get(this.$api.user.get_info).then(res => {
					let arr={}
					arr['data'] = res.data
					arr['save_time']=time
					uni.setStorageSync('my', arr);//放入缓存		
					uni.stopPullDownRefresh()
				})
			},
			//授权头像
			get_my() {
				const that = this
				const my = cache_user.info_wait()				
				my.then(res => {
					console.log("res",res)
					if(res.job==1){
						console.log("是老师")
						this.is_teacher=true;
					}else{
						console.log("不是老师")
						this.is_teacher=false;
					}
					this.web_auth=res.web_auth;
					this.erweima=res.qrcode_xcx;
					if (res && res.headpic && res.nickname) {
						that.userinfo = {
							avatarUrl: res.headpic,
							nickname: res.nickname,
							points: res.points,
							name:res.name
						}
					} else {
						that.userinfo = {
							points: res.points
						}
						//auth传到组件，组件监听auth是否有变动
						that.auth.is_name = !that.auth.is_name
					}
					//that.get_user_vip_status();
				})
			}
		}
	}
</script>

<style lang="scss" scoped>
	.imgs{
		margin-left: 40%;
	}
	.header{
	
		background-color: #f4f4f5;
	}
	.header-top{
		height: 100px;
	}
	.header-bottom{
		height: 50px;
		border-radius: 0px 0px 50% 50%;
	}
	.header-box{
		//border: 1rpx solid #c8c9cc;
		border-radius: 5rpx;
		box-shadow: 0 .125rem .25rem rgba(0,0,0,.075)!important;
	}
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
