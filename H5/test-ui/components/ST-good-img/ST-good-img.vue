<template>
	<view class="st-default article-list" style="display: flex;flex-wrap: wrap;">  
		<lucencyList></lucencyList>
	</view>
</template>

<script>
	import lucencyList from './components/good_img1.vue'
	// import listDistance from './components/list-distance.vue'
	// import Des from './components/des.vue'
	// import listPro from './components/list-pro.vue'
	export default {
		components:{
			lucencyList
		},
		props: {
			isPhone: {
				type: Boolean,
			},
			dat: {
				type: Object,
			},
			
		},
		data () {
			return {
				 listpro:[{title:'阿圣诞节啊收到货阿圣诞节',wang:'中国手机网',ping:'2019评论',img:require('@/static/img/11.jpeg'),
					des:'这里是描述这里是描述这里是描述这里是描述这',
					name:'名字',price:'22',yuyue:'31',sheng:'55'},{title:'阿圣诞节啊收到货阿圣诞节',wang:'中国手机网',ping:'2019评论',img:require('@/static/img/12.jpeg'),
					des:'这里是描述这里是描述这里是描述这里是描述这',
					name:'名字',price:'22',yuyue:'31',sheng:'55'},{title:'阿圣诞节啊收到货阿圣诞节',wang:'中国手机网',ping:'2019评论',img:require('@/static/img/13.jpeg'),
					des:'这里是描述这里是描述这里是描述这里是描述这',
					name:'名字',price:'22',yuyue:'31',sheng:'55'}],
			}
		}, 
		computed:{
			fun_select(){
				if(this.vuex_xz.type=='article-list' && this.vuex_xz.id == this.dat.unique){
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
</style>
