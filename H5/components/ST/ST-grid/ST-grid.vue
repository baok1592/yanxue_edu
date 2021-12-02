<template>
	<view class="st-grid">
		
		<!-- 你的代码放在这里 -->
		
		<u-grid :col="dat.grid_col" :border="dat.grid_border=='true'?true:false">
				<u-grid-item 	@click="skip(url[item.type],'taber')" v-for="(item,index) in list " :key="index">
					<u-image width="80" height="80" :src="item.category_pic"></u-image>
					<view class="grid-text">{{item.category_name}}</view>
				</u-grid-item>
				<!-- <u-grid-item @click="skip(url[1])">
					<u-icon name="lock" :size="46"></u-icon>
					<view class="grid-text">老师</view>
				</u-grid-item>
				<u-grid-item @click="skip(url[2])">
					<u-icon name="hourglass" :size="46"></u-icon>
					<view class="grid-text">新闻</view>
				</u-grid-item> -->
			</u-grid>
		
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
			refresh:{
				type:Boolean
			}
		},
		data () {
			return {
				url:{
					"new":"/pages/article_list/article_list",
					"course":"/pages/pic_list/pic_list",
					"teacher":"/pages/teacher_list/teacher_list"
				},
				list:[],
			}
		},
		computed:{
			//修改下面的xxxx
			fun_select(){
				if(this.vuex_xz.type=='grid' && this.vuex_xz.id == this.dat.unique){
					return true;
				}
				return false;				
			}
		},
		watch:{
			refresh(){
				this.get_category();
			}
		},
		mounted() {
			this.get_category();
		},
		methods: {
			//获取nav
			get_category(){
				this.$http.get(this.$api.home.get_category).then(res=>{
					if(res.status==200){
						this.list=res.data;
					}
				})
			},
			// 鼠标点击组件获取该组件的 unique
			activeGetSorts() {
				this.$emit('getUnique', this.dat);
			},
			skip(url,type){
				if(type=="taber"){
					uni.switchTab({
					    url: url
					});
				}
				uni.navigateTo({
					url:url
				})
			}
		}
	}
</script>

<style lang="scss" scoped>
.st-grid {
		.grid-text {
			font-size: 28rpx;
			margin-top: 4rpx;
			color: #0f0f0f;
		}
}
</style>
