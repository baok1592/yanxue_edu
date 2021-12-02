<template>
	<view class="st-default html-text" >  
		<!-- <view v-html="content" class="cover"></view> -->
		<view class="cover">
			<u-parse :html="content" :selectable="false"></u-parse>
		</view>
		<u-button type="primary" @click="pay_vip()" v-if="vip_button&&content=='该文章为vip文章，请购买VIP再进行阅读'" >购买会员</u-button>
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
			Qid:{
				type:String,
			},
			is_article:{
				type:Boolean,
			},
			contens:{
				type:String,
				default:"默认数据"
			},
			refresh:{
				type:Boolean,
			},
		},
		data () {
			return {
				stude:"水水水水水水",	
				label:"",
				content: this.contens,
				chan:[],
				vip_button:false,
				is_vip:0
			}
		}, 
		computed:{
			fun_select(){
				if(this.vuex_xz.type=='html' && this.vuex_xz.id == this.dat.unique){
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
			contens(n,o){
				this.content=n
			},
			refresh(){
				this.updata();
			},
		},
		mounted() {
			this.get_one_cover()
			// #ifdef H5
				var ua = navigator.userAgent.toLowerCase();
				var isWeixin = ua.indexOf('micromessenger') != -1;
				if (!isWeixin) { 
					console.log("非公众号")
					
				}else{
					console.log("公众号")
					this.vip_button=true;
				}
			// #endif
			
			// #ifdef MP-WEIXIN
			this.vip_button=true;
			// #endif
		},
		methods: {
			// 鼠标点击组件获取该组件的 unique
			activeGetSorts() {
				this.$emit('getUnique', this.dat);
			},
			get_one_cover(){
				if(!this.isPhone){    //判断是不是文章
					/* this.http.get_article(this.Qid).then(res=>{
						console.log("111")
						this.content=res.data[0].content
					}) */
					this.content="默认文本数据"
				}
				
			},
			//获取封面数据
			getcover(){
				this.chan = uni.getStorageSync("coverInfo")
				let exist =true;
				 exist =this.storage();		
						  console.log("exista",exist)
				if(this.chan=="" || exist){
					publicModel.get_one_conter(this.Qid).then(res=>{							
						if(res.status==200){
							let coverInfo =[];
							for(let i=0;i<this.chan.length;i++){
								coverInfo.push(this.chan[i])
							}
							var time = Date.parse(new Date()) /1000
							let goods={
								data:null,
								pro_time:time+60*20
							}
							this.$emit("changetitle",res.data)
							goods.data=res.data
							coverInfo.push(goods)							
							uni.setStorageSync("coverInfo",coverInfo)
							this.content=res.data.content;
						}
					})
				}else{
					for(let i=0;i<this.chan.length;i++){
						if(this.Qid==this.chan[i].data.category_id){
							this.$emit("changetitle",this.chan[i].data)
							this.content=this.chan[i].data.content;
							break;
						}
					}
				}
			},
			storage(){
				console.log("this.",this.chan)
				let ok=true;
				if(this.chan.length==0){
					ok=false;
					return ok;
				}
				for(let i=0;i<this.chan.length;i++){			//判断是否缓存是否过期
				console.log("xunhuan",this.Qid)
					var nowtime = Date.parse(new Date()) /1000;
					if(nowtime>this.chan[i].pro_time){	
						this.chan.splice(i,1)
						console.log("过期了")
						ok=true;
						break;
					}else if(this.Qid==this.chan[i].data.category_id){	
						console.log("有值")
						ok=false;						
						break;
					}
				}
				
				return ok;
			},
			updata(){
				publicModel.get_one_conter(this.id).then(res=>{
					if(res.status==200){
						let coverInfo =[];
						for(let i=0;i<this.chan.length;i++){
							coverInfo.push(this.chan[i])
						}
						var time = Date.parse(new Date()) /1000
						let goods={
							data:null,
							pro_time:time+60*20
						}
						this.$emit("changetitle",res.data)
						goods.data=res.data
						coverInfo.push(goods)							
						uni.setStorageSync("coverInfo",coverInfo)
						this.content=res.data.content;
						uni.stopPullDownRefresh();
					}
				})
			},
			//购买会员
			pay_vip(){
				uni.navigateTo({
					url:"../vip/vip"
				})
			},
		}
	}
</script>

<style lang="scss" scoped>
.st-default {
	
}
.cover{
	margin: 13px;
	min-height: 60vh;
	padding: 12px;
	background-color: #fff;
}
.html-text>image{
	width: 350rpx;
	height: 200rpx;
}
</style>
