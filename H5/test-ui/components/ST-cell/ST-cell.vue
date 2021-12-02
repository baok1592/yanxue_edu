<template>
	<view class="st-default">  
		<u-cell-item class="u-cell" :icon="dat.cell_icon" :title="class_name" 
		:label="this.dat.cell_description==true?this.stude:''" :arrow="dat.cell_right_show" @click="skip(url[0])">
			
		</u-cell-item>
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
				class_name:"莫某班级",
				stude:"2012-4-23 至 2013-2-1",	
				label:"",
				url:['/pages/study/evaluating/evaluating']
			}
		}, 
		computed:{
			fun_select(){
				if(this.vuex_xz.type=='cell' && this.vuex_xz.id == this.dat.unique){
					return true;
				}
				return false;				
			},		
			
		},
		watch:{
			/* dat.cell_description(){
				console.log("ss",this.dat.cell_description,this.dat.cell_description==true)
				this.stude=this.dat.cell_description==true?"sscc":''
			} */
		},
		methods: {
			// 鼠标点击组件获取该组件的 unique
			activeGetSorts() {
				this.$emit('getUnique', this.dat);
			},
			skip(url){
				uni.navigateTo({
					url:url
				})
			}
		}
	}
</script>

<style lang="scss" scoped>
.st-default {
	
}
</style>
