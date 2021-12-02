<template>
	<view class="content" :style="{'background-color': diydata.page_info.page_background_color}">	
		<view id="sort-1" class="sortable sortable-panel">
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
	</view>
</template>

<script>
	// import draggable from 'vuedraggable'
	
	
	
	import {DIYdata} from "@/common/DIYdemo.js"
	const diy=new DIYdata;
	export default {
		components: {
			
		},
		data() {
			return {
				diydata:diy.diyData,
				
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
		},
		methods: {
				get_info(){
					// #ifdef H5
						diy.change(1031) 
						const _this = this; 				
						window.addEventListener('message',this.response);		
						let isPhone = navigator.userAgent.toLowerCase();
						if (isPhone.indexOf('windows') != -1) {
							diy.getEff(_this,false,"usinfoStyle");
							diy.diyData.isPhone = false;
						} else {
							diy.getEff(_this,true,"usinfoStyle");
							diy.diyData.isPhone = true;
						}
					// #endif
					// #ifdef MP-WEIXIN ||MP-TOUTIAO
						diy.change(1031) 
						const _this = this;
						const diyRes= diy.getEff(_this,true,'usinfoStyle');
						diyRes.then(res=>{
							console.log("aaaaa",res)
						  res.isPhone = true;
						  _this.diydata=res
						}) 
					// #endif
								
					//#ifdef APP-PLUS
						diy.change(1031)
						const _this = this;
						diy.getEff(_this,true,'usinfoStyle');
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
				diy.save(event,this,"");
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
