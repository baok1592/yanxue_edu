<template>
	<view class="st-tabs">

		<!-- 你的代码放在这里 -->
		<view :class="{'st-item-fixed': dat.disable&&!isPhone}">
			<u-tabs name="name" :list="list" :active-color="dat.tabs_type" :bold="dat.tabs_text_blod=='true'?true:false" count='cate_count'
				:current="current" @change="change"></u-tabs>
			<move-handle :isSelect="fun_select" :isPhone="isPhone" @choose="activeGetSorts"></move-handle>
		</view>
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
		data() {
			return {
				nfc:'cont',
				current: 0,
				tabs: '',
				list: [],
			}
		},
		computed: {
			//修改下面的xxxx
			fun_select() {
				if (this.vuex_xz.type == 'tabs' && this.vuex_xz.id == this.dat.unique) {
					return true;
				}
				return false;
			}
		},
		mounted(){
			this.get_column()
		},
		
		methods: {
			//获取课程分类
			get_column(){
				this.$http.get(this.$api.course.get_project).then(res=>{
					if(res.status==200){
						let data =res.data;
						
						let list =[];
						for(let i=0;i<data.length;i++){
							delete data[i].count;
							list.push(data[i]);
						}
						this.list=list;
					}
				})
			},
			// 鼠标点击组件获取该组件的 unique
			activeGetSorts() {
				this.$emit('getUnique', this.dat);
				console.log(this.dat)
				console.log(this.dat.tabs_type_blod)
				console.log("this.dat.tabs_type_blod=='true'?true:false", this.dat.tabs_type_blod == 'true' ? true : false)
			},
			change(index) {
				this.current = index;
				uni.setStorageSync('tabsList',this.list)
				this.$EventBus.$emit('tabsChange',index)
			}
		}
	}
</script>

<style lang="scss" scoped>
	.st-default {}
</style>
