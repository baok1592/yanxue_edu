<template>
	<view class="st-from">
		<form1 :dat="dat"></form1>
		<move-handle :isSelect="fun_select" :isPhone="isPhone" @choose="activeGetSorts"></move-handle>
	</view>
</template>

<script>
	import publicModel from "@/model/public.js"
	import form1 from"./components/form1.vue"
	export default {
		components:{
			form1
		},
		props: {
			isPhone: {
				type: Boolean,
			},
			dat: {
				type: Object,
			},
			color:{
				type:String,
			}
		},
		data () {
			return {
				
			}
		},
		created() {
			// console.log(this.dat)
		},
		computed:{
			fun_select(){
				if(this.vuex_xz.type=='form' && this.vuex_xz.id == this.dat.unique){
					return true;
				}
				return false;				
			}
		},
		mounted() {
			console.log("from",this.color)
			this.change_color(this.color)
		},
		
		methods: {
			// 鼠标点击组件获取该组件的 unique
			activeGetSorts() { 
				this.$emit('getUnique', this.dat);
			},
			
		},
	}
</script>

<style>
	.st-from{
		padding: 40rpx;
		background-color: #f3F3F3;
	}
</style>
