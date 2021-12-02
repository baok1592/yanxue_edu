<template>
	<view class="st-default" :style="'text-align:'+dat.server_title_type" >  
		<view >
			<view class="title" >{{data.title}}</view>
			<view class="time" v-if="data.create_time">			
					<span v-if="dat.server_title_soure">来源：{{data.source}}</span>   <span v-if="dat.server_title_time">时间：{{data.create_time}}</span>			
			</view>
		</view>
		<move-handle :isSelect="fun_select" :isPhone="isPhone" @choose="activeGetSorts"></move-handle>
	</view>
</template>

<script>
	import publicModel from "@/model/public.js"
	export default {
		props: {
			isPhone: {
				type: Boolean,
			},
			dat: {
				type: Object,
			},
			id:{
				type:String,
			},
			is_article:{
				type:Boolean,
			},
			data:{
				type:Object,
			}
		},
		data(){
			return {
				stude:"水水水水水水",	
				label:"",
				content:"<h3>接口数据</h3>",
				style_list:{
					'left':'titel-left',
					'conter':'title-conter'
				}
			}
		}, 
		computed:{
			fun_select(){
				if(this.vuex_xz.type=='server-title' && this.vuex_xz.id == this.dat.unique){
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
		mounted() {
			//this.get_one_cover()
		},
		methods: {
			// 鼠标点击组件获取该组件的 unique
			activeGetSorts() {
				this.$emit('getUnique', this.dat);
			},
			get_one_cover(){
				if(this.is_article){
					this.http.get_article(this.id).then(res=>{
						this.content=res.data[0].content
					})
				}else{
					publicModel.get_one_conter(this.id).then(res=>{
						if(res.status==200){
							this.content=res.data.content;
						}
					})
				}
			}
		}
	}
</script>

<style lang="scss" scoped>
.st-default {
	padding: 48rpx 48rpx 0rpx 48rpx; 
}
.title{
		width: 100%;
		font-size: 40rpx;
		font-weight: bold;
	}
.titel-left{
	text-align: left;
}
.titel-conter{
	text-align: center;
}
.cover{
	margin: 13px;
	min-height: 60vh;
	padding: 12px;
	background-color: #fff;
}
.time{
		font-size: 24rpx;
		color: #8f8f94;
		padding: 30rpx 0rpx;
		/* display: flex;

		justify-content: space-between;
		align-items: flex-end; */
	}
</style>
