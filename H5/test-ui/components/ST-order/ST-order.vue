<template>
	<view class="st-default article-list" style="display: flex;flex-wrap: wrap;">  
		<block v-for="(item,index) in order_list" :key="index">
			<order :datas="item" @updata="get_order(order_type)" class="w-100 m-3"></order>
		</block>
		<move-handle :isSelect="fun_select" :isPhone="isPhone" @choose="activeGetSorts"></move-handle>
	</view>
</template>

<script>
	import order from './components/order.vue'
	// import listDistance from './components/list-distance.vue'
	// import Des from './components/des.vue'
	// import listPro from './components/list-pro.vue'
	export default {
		components:{
			order
		},
		props: {
			isPhone: {
				type: Boolean,
			},
			dat:{
				type: Object,
			},
			oType:{
				type:String
			},
			refresh:{
				type:Boolean
			}
		},
		data () {
			return {
				order_type:'',
				 listpro:[{title:'阿圣诞节啊收到货阿圣诞节',wang:'中国手机网',ping:'2019评论',img:require('@/static/img/11.jpeg'),
					des:'这里是描述这里是描述这里是描述这里是描述这',
					name:'名字',price:'22',yuyue:'31',sheng:'55'},{title:'阿圣诞节啊收到货阿圣诞节',wang:'中国手机网',ping:'2019评论',img:require('@/static/img/12.jpeg'),
					des:'这里是描述这里是描述这里是描述这里是描述这',
					name:'名字',price:'22',yuyue:'31',sheng:'55'},{title:'阿圣诞节啊收到货阿圣诞节',wang:'中国手机网',ping:'2019评论',img:require('@/static/img/13.jpeg'),
					des:'这里是描述这里是描述这里是描述这里是描述这',
					name:'名字',price:'22',yuyue:'31',sheng:'55'}],
				items:{
					course:{
						buy: 1,
						content: "<p>基础课程</p>",
						create_time: "2021-05-07 11:00:04",
						delete_time: 0,
						id: 2,
						image: 6,
						img: {url: "https://edu.ruhuashop.com/uploads/img/20210430/88ad24d4616804ea6fd36f6bc3ca2f0c.jpg"},
						is_down: 0,
						is_tui: 1,
						market_price: "0.00",
						name: "java基础课程",
						play: 0,
						price: "200.00",
						project: 7,
						sort: 0,
						teacher: 0,
						update_time: "2021-05-07 11:11:45",
						url: 0,
						url_name: "",
						yj: "50.00"
					},
					course_id: 2,
					create_time: "2021-05-17 11:10:51",
					delete_time: 0,
					fx_teacher: 0,
					id: 1,
					order_num: "C517210519386049",
					pay_statement: 0,
					pay_time: 0,
					prepay_id: null,
					price: "200.00",
					total_price: "200.00",
					uid: 9,
					update_time: "2021-05-17 11:10:51"
					
				},
				order_list:[],
			}
		}, 
		computed:{
			fun_select(){
				if(this.vuex_xz.type=='order' && this.vuex_xz.id == this.dat.unique){
					return true;
				}
				return false;				
			}
		},
		mounted() {
			if(this.oType==1||this.oType==2){
				this.order_type =this.oType;
				this.get_order(this.order_type);
			}else if(this.oType==3){
				//this.get_tui()
			}else{
				this.get_orders();
			}
			
		},
		watch:{
			refresh(){
				if(this.oType==1||this.oType==2){
					this.order_type =this.oType;
					this.get_order(this.order_type);
				}else if(this.oType==3){
					this.get_tui()
				}else{
					this.get_orders();
				}
			}
		},
		methods: {
			// 鼠标点击组件获取该组件的 unique
			activeGetSorts(){
				this.$emit('getUnique', this.dat);
			},
			//获取数据
			get_order(type){
				this.$http.get(this.$api.user.get_order).then(res=>{
					if(res.status==200){
						let data =res.data;
						let list =[];
						for(let item of data){
							switch(parseInt(type)){
								case 1 :
									if(item.pay_statement==0){
										list.push(item)
									}
									break;
								case 2 :
									if(item.pay_statement==1){
										list.push(item)
									}
									break;
							} 
						}
						this.order_list=list;
						uni.stopPullDownRefresh()
					}
				})
			},
			get_orders(){
				this.$http.get(this.$api.user.get_order).then(res=>{
					if(res.status==200){
						this.order_list=res.data;
						uni.stopPullDownRefresh()
					}
				})
			},
			//获取退款
			get_tui(){
				this.$http.get(this.$api.order.get_tui).then(res=>{
					
				})
			}
		}
	}
</script>

<style lang="scss" scoped>
.st-default {
	
}
</style>
