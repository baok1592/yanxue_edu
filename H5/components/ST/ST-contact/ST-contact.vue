<template>
	<view class="st-default">  
		<view  :class="dat.contact_icon?'conicon':''"  class="contact"  v-for="(item,index) in dat.contact_icons" :key="index">
			
				<view style="display: flex;">				
				<u-icon :name="list_type[item]"v-if="dat.contact_icon" class="sticon"></u-icon>
				<view v-else>{{text_list[item]}}</view>	
				<view>
					XXX省XXX市XXX路
				</view>
				</view>				
				<u-icon name="arrow-right"v-if="dat.contact_icon" class="sticon-1"></u-icon>
		</view>		
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
		data () {
				
			return {
				styleObject:{
					textAlign:this.dat.presentation_type,
					
				},
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
				if(this.vuex_xz.type=='contact' && this.vuex_xz.id == this.dat.unique){
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
