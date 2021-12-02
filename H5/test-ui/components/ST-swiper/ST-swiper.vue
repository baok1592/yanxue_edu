<template>
	<view class="st-default">
		<!-- <u-swiper :list="listq"></u-swiper> -->
		<u-swiper :list="swiper_list" :mode="dat.banner_mode" :title="dat.banner_title" border-radius='0' :effect3d="dat.banner_effect3d" img-mode="scaleToFill" height="360"></u-swiper>
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
			// list: {
			// 	type: Array,
			// 	default: () => [
			// 		{
			// 			id: 0,
			// 			type: 'image',
			// 			url: 'https://ossweb-img.qq.com/images/lol/web201310/skin/big84000.jpg'
			// 		},
			// 		{
			// 			id: 2,
			// 			type: 'image',
			// 			url: 'https://ossweb-img.qq.com/images/lol/web201310/skin/big39000.jpg'
			// 		},
			// 		{
			// 			id: 3,
			// 			type: 'image',
			// 			url: 'https://ossweb-img.qq.com/images/lol/web201310/skin/big10001.jpg'
			// 		} 
			// 	]
			// }
		},
		data () {
			return {
				swiper_list:[],
				lists: [{
						image: 'https://cdn.uviewui.com/uview/swiper/1.jpg',
						title: '昨夜星辰昨夜风，画楼西畔桂堂东'
					},
					{
						image: 'https://cdn.uviewui.com/uview/swiper/2.jpg',
						title: '身无彩凤双飞翼，心有灵犀一点通'
					},
					{
						image: 'https://cdn.uviewui.com/uview/swiper/3.jpg',
						title: '谁念西风独自凉，萧萧黄叶闭疏窗，沉思往事立残阳'
					}
				],
			}
		},
		computed:{
			fun_select(){
				if(this.vuex_xz.type=='swiper' && this.vuex_xz.id == this.dat.unique){
					return true;
				}
				return false;				
			}
		},
		mounted() {
			this.get_banner()
		},
		watch:{
			refresh(){
				this.get_banner()
			}
		},
		methods: {
			get_banner(){
				this.$http.get(this.$api.home.get_banner).then(res=>{
					if(res.status==200){
						let data =res.data;
						for(let i =0;i<data.length;i++){
							let swiper={};
							if(data[i].img){
								swiper.image=data[i].img.url;
							}
							swiper.title=data[i].jump_name;
							this.swiper_list.push(swiper)
						}
						uni.stopPullDownRefresh();
						console.log("list",this.swiper_list)
					}
				})
			},
			// 鼠标点击组件获取该组件的 unique
			activeGetSorts() { 
				this.$emit('getUnique', this.dat);
			},
		}
	}
</script>

<style lang="scss" scoped>
//banner
.swiper {
	height: 150px;
	width: 100%;
	text-align: center;

	.img {
		width: 100%;
	}
}
</style>
