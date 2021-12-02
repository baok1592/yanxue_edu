<template>
	<view class="st-default">  
		<video :src="url" controls style="width: 100%;"></video>
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
			},
			url:{
				type:Object
			}
		},
		data () {
				
			return {
				styleObject:{
					textAlign:this.dat.presentation_type,
					
				},
				live_url:"https://img.cdn.aliyun.dcloud.net.cn/guide/uniapp/%E7%AC%AC1%E8%AE%B2%EF%BC%88uni-app%E4%BA%A7%E5%93%81%E4%BB%8B%E7%BB%8D%EF%BC%89-%20DCloud%E5%AE%98%E6%96%B9%E8%A7%86%E9%A2%91%E6%95%99%E7%A8%8B@20200317.mp4",
				contact_icons:["address","phone","time","name"],
				// 列表样式表
				list_type: {
					'address': 'map',
					'phone': 'phone',
					'time': 'clock',
					'name': 'home',					
				},
				text_list: {
					'address': '联系我们：',
					'phone': '联系电话：',
					'time': '在线时间：',
					'name': '公司名称：',					
				},
				text:"为了避免Internet Explorer 中无法调整文本的问题，许多开发者使用 em 单位代替像素。"
			}
		}, 
		computed:{
			fun_select(){
				if(this.vuex_xz.type=='video' && this.vuex_xz.id == this.dat.unique){
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
.st-default {
	
}
.contact{
	padding: 24rpx;
	display: flex;
}
.title{
	text-align: center;
	font-size: 34rpx;
	font-weight: bold;
	margin-bottom: 24rpx;
}
.sticon{
	    font-size: 40rpx;
	    color: #909399;
	    margin-right: 24rpx;	
		&-1{
			font-size: 40rpx;
			color: #909399;
		}
}
.conicon{
	display: flex;
	justify-content: space-between;
}
</style>
