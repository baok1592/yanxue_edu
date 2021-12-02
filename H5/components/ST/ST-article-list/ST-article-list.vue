<template>
	<view class="st-default article-list" style="display: flex;flex-wrap: wrap;">  
		<lucencyList v-if="dat.article_type=='list-type-1'" :list="item" v-for="(item,index) in listpro" :key="index" @click="jump_urls(item)"
		style="width: 46%; margin: 0 2% 15px 2%;"></lucencyList>
		<!-- <lucencyList v-if="dat.article_type=='list-type-1'" :list="item" v-for="(item,index) in listpro" :key="index" @click="jump_url(item.id)"></lucencyList> -->
		<listDistance v-if="dat.article_type=='list-type-2'" :list="item" v-for="(item,index) in listpro" :key="index" @click="skpi_new(item)"></listDistance>
		<Des v-if="dat.article_type=='list-type-3'" :list="item" v-for="(item,index) in listpro" :key="index" ></Des>
		<listPro v-if="dat.article_type=='list-type-4'" :list="item" v-for="(item,index) in listpro" :key="index"></listPro>
		<zhuji v-if="dat.article_type=='list-type-5'" :dio="item" v-for="(item,index) in course" :key="index"></zhuji>
		
		<move-handle :isSelect="fun_select" :isPhone="isPhone" @choose="activeGetSorts"></move-handle>
	</view>
</template>

<script>
	import lucencyList from './components/list-text.vue'
	import listDistance from './components/list-distance.vue'
	import Des from './components/des.vue'
	import listPro from './components/list-pro.vue'
	import zhuji from "./components/zuji.vue"
	export default {
		components:{
			lucencyList,listDistance,Des,listPro,zhuji
		},
		props: {
			isPhone: {
				type: Boolean,
			},
			dat: {
				type: Object,
			},
			pageType:{
				type:String,
			},
			tInfo:{
				type:Array,
			},
			refresh:{
				type:Boolean,
			}
		},
		data () {
			return {
				 listpros:[{title:'阿圣诞节啊收到货阿圣诞节',wang:'中国手机网',ping:'2019评论',img:require('@/static/img/11.jpeg'),
					des:'这里是描述这里是描述这里是描述这里是描述这',
					name:'名字',price:'22',yuyue:'31',sheng:'55'},{title:'阿圣诞节啊收到货阿圣诞节',wang:'中国手机网',ping:'2019评论',img:require('@/static/img/12.jpeg'),
					des:'这里是描述这里是描述这里是描述这里是描述这',
					name:'名字',price:'22',yuyue:'31',sheng:'55'},{title:'阿圣诞节啊收到货阿圣诞节',wang:'中国手机网',ping:'2019评论',img:require('@/static/img/13.jpeg'),
					des:'这里是描述这里是描述这里是描述这里是描述这',
					name:'名字',price:'22',yuyue:'31',sheng:'55'}],
					listpro:[],
					skip_url:{
						'list-type-1':'/pages/teacher_list/teacher/info',
						'list-type-2':'/pages/article_list/article/article',
					},
					t_list:this.tInfo,
					course:[
						{	
							id:12,
							name:'舞蹈',
							img:"https://edu.ruhuashop.com/uploads/img/20210430/9aff5d6e9ef12ab7bc288970ddebb885.jpg",
							teachers:["刘诗诗","李师师"],
							start:"07-03",
							end:'07-24'
						}
					]
			}
		}, 
		computed:{
			fun_select(){
				if(this.vuex_xz.type=='article-list' && this.vuex_xz.id == this.dat.unique){
					return true;
				}
				return false;				
			},
			//暂时废弃
			jump_url(id){
				console.log("id",id)
				if(this.pageType=='tInfo'){
					return "/pages/good/good_info"
				}else{
					let url ="/pages/teacher_list/teacher/info?id="+id
					return url
				}
			},
		},
		watch:{
			tInfo(n){
				this.t_course()
			},
			refresh(){
				console.log("refresh")
				this.t_course()
				this.is_index()
			}
		},
		mounted() {
			this.t_course()
			this.is_index()
		},
		methods: {
			jump_urls(item){
				if(this.pageType=='tInfo'){
					uni.navigateTo({
						url:"/pages/good/good_info?id="+item.id
					}) 
				}else{
					uni.navigateTo({
						url:"/pages/teacher_list/teacher/info?id="+item.id
					})
				}
			},
			is_index(){
				if(this.pageType=='index'){
					this.$http.get(this.$api.article.get_article+"?tui=1").then(res=>{
						 if(res.status==200){
							 this.listpro=res.data;
							 uni.stopPullDownRefresh()
						 }
					})
				}else if(this.pageType=='teacher'){
					this.$http.get(this.$api.teacher.get_teacher).then(res=>{
						 if(res.status==200){
							 let data =res.data;
							 let list =[];
							 for(let item of data){
								 let obj ={
									 id:item.id,
									 img:item.header,
									 title:item.name
								 }
								 list.push(obj)
							 }
							 this.listpro=list;
							 uni.stopPullDownRefresh()
						 }
					})
				}else if(this.pageType=='newList'){
					this.$http.get(this.$api.article.get_article+"?type=0").then(res=>{
						 if(res.status==200){
							 this.listpro=res.data;
							 uni.stopPullDownRefresh()
						 }
					})
				}
			},
			skpi_new(item){
				uni.navigateTo({
					url:'/pages/article_list/article/article?id='+item.id
				})
			},
			//教师课程
			t_course(){
				if(this.pageType=='tInfo'){
					console.log("course",this.tInfo)
					let data =this.tInfo;
					if(data=='undefined'||data.length==0){
						return;
					}
					let list =[];
					for(let item of data){
						 if(item.course){
							 let obj ={
								 id:item.course.id,
								 img:'',
								 title:item.course.name
							 }
							 if(item.course.img){
								 obj.img=item.course.img.url
							 }
							 console.log("course",list)
							 list.push(obj)
						 }
					}
					uni.stopPullDownRefresh()
					this.listpro=list;
				}
			},
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
</style>
