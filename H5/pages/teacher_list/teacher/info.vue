<template>
	<view class="content" :style="{'background-color': diydata.page_background_color}"> 
		<!-- 删除 sortable -->
		<!-- <div id="del" class="sortable-panel sortable_delete" v-show="!isPhone&&isShowDelete" :class="{'': isShowDeleteStyle}">
			<image style="width: 100rpx;height: 100rpx;opacity: 0.7;" src="@/static/icon-img/delete.png" mode=""></image>
		</div> -->
		<view class="index">
			<view class="header"></view>
			<view class="body">
				<view class="touxiang">
					<view class="touxiang-img">
						<image style="width: 80px;height: 80px; border-radius: 40px;" :src="info.header"></image>
					</view>
					<view class="touxiang-text">
						<view class="touxiang-title">{{info.name}}</view>					
						<view style="display: flex;">
							<view class="touxiang-label" v-for="item in info.labels">
								<block v-if="item.project">
									{{item.project.name}}
								</block>
							</view>
						</view>
					</view>
				</view>
				<view style="padding: 40rpx 28rpx;" v-if="info.t_json">
					<u-parse :html="info.t_json.count"></u-parse>
				</view>
			</view>
			
			
		</view>
		<view id="sort-1" class="sortable sortable-panel">
			<block v-for="(result,index) in diydata.sorts.child" :key="index">
				
				<st-article-list v-if="result.sorts == 'st-article-list'" :isPhone="diydata.isPhone" :refresh="diydata.shop_list" :pageType="page_type" :tInfo="course" :dat="result" @getUnique="activeGetUnique"></st-article-list>
				
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
				
			
			</block>
		</view>
	</view>
</template>

<script>
	// import draggable from 'vuedraggable'
	import Sortable from "sortablejs";
	

	import {DIYdata} from "@/common/DIYdemo.js"
	const diy=new DIYdata;
	export default {
		components: {
			// draggable,
			
			
		},
		
		data() {
			return {
				diydata:diy.diyData,
				tid:'',
				page_type:"tInfo",
				
				id:1032,
				info:'',
				course:[],
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
		onLoad(option){
			this.tid =option.id;
			this.get_teacher();
		},
		onShow() {
			this.get_info()
			this.getPageTheme();
		},
		methods: {
			//全局下拉
			show_data(){				
				diy.diyData.shop_list=!diy.diyData.shop_list;
			},
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
			//获取教师信息
			get_teacher(){
				const that =this;
				this.$http.get(this.$api.teacher.get_teacher+"?id="+this.tid).then(res=>{
					if(res.status==200){
						that.info=res.data;
						that.course=res.data.courses;
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
	.header{
		height: 200rpx;
		background-color: #FF8D8D;
	
	}
	.touxiang{
		display: flex;
		position: relative;
		.touxiang-img{
			position: absolute;
			top: -18px;
			padding: 5px;
			border-radius: 50px;
			background-color: #FFFFFF;
		}
		.touxiang-text{
			margin-left: 30%;padding-top: 15px;
			.touxiang-title{
				font-size: 34rpx;
				font-weight: bold;
			}
			.touxiang-label{
				font-size: 12px;
				margin: 5px;
				padding: 0px 20px;
				height: 20px;
				line-height: 20px;
				text-align: center;
				border-radius: 10px;
				background-color: #eeeeee;
			}
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
