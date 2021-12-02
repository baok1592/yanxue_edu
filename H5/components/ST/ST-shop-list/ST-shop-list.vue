<template>
	<view class="st-shop-list">
		<template v-if="dat.list_type!='list-type-6'">
			<view class="shop-list" :class="[list_type[dat.list_type]]">
				<template v-for="(item,index) in list">
					<view class="shop" >
						<view class="img" v-jumpType="jumpType+'?id=12'"  @click="skip(item.id,item.pt)" v-if="item.img">
							<image class="image"  :class="[shop_shape[dat.shop_shape]]" :src="item.img.url"  ></image>
						</view>
						<image class="vip-img" :class="[vip_img[dat.list_type]]" src="@/static/img/pintuan2.png" v-if="project=='edu'&&item.pt==1"></image>
						
						
						<view class="main">
							<view class="shop-body">
								<view class="title" v-if="dat.is_show_title">{{item.name}}</view>
								<view class="desc" v-if="dat.is_show_description">{{item.desc}}</view>
							</view>
							<view class="shop-foot">
								<view><text v-if="dat.is_show_price">{{item.price}}</text></view>
								<view><u-button v-if="dat.is_show_button" :type="dat.button_type" size="mini" @click="skip(item.id,item.pt)">{{dat.button_text}}</u-button></view>
							</view>
						</view>
					</view>
				</template>
			</view>
		</template>
		<template v-else>
			<view class="water-fall">
				<view class="shop-list shop-list-6">
					<template v-for="(item,index) in list_1">
						<view class="shop">
							<view class="img" @click="skip(item.id,item.pt)">
								<img class="image" :class="[shop_shape[dat.shop_shape]]" :src="item.img_url"></img>
							</view>
							<image class="vip-img" :class="[vip_img[dat.list_type]]" src="@/static/img/pintuan2.png" v-if="project=='edu'&&item.pt==1"></image>
							<view class="main">
								<view class="shop-body">
									<view class="title" v-if="dat.is_show_title">{{item.title}}</view>
									<view class="desc" v-if="dat.is_show_description">{{item.desc}}</view>
								</view>
								<view class="shop-foot">
									<view><text v-if="dat.is_show_price">{{item.price}}</text></view>
									<view @click="skip(item.id,item.pt)"><u-button v-if="dat.is_show_button" :type="dat.button_type" size="mini">{{dat.button_text}}</u-button></view>
								</view>
							</view>
						</view>
					</template>
				</view>
				<view class="shop-list shop-list-6">
					<template v-for="(item,index) in list_2">
						<view class="shop">
							<view class="img" @click="skip(item.id,item.pt)">
								<img class="image" :class="[shop_shape[dat.shop_shape]]" :src="item.img_url"></img>
							</view>
							<image class="vip-img" :class="[vip_img[dat.list_type]]" src="@/static/img/pintuan2.png" v-if="project=='edu'&&item.pt==1"></image>
							<view class="main">
								<view class="shop-body">
									<view class="title" v-if="dat.is_show_title">{{item.title}}</view>
									<view class="desc" v-if="dat.is_show_description">{{item.desc}}</view>
								</view>
								
								<view class="shop-foot">
									<view><text v-if="dat.is_show_price">{{item.price}}</text></view>
									<view @click="skip(item.id,item.pt)"><u-button v-if="dat.is_show_button" :type="dat.button_type" size="mini">{{dat.button_text}}</u-button></view>
								</view>
							</view>
						</view>
					</template>
				</view>
			</view>
		</template>
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
			project:{
				type:String,
			},
			pageType:{
				type:String,
			},
			refresh:{
				type:Boolean,
			}
		},
		data () {
			return {
				//跳转样式
				jumpType:"/pages/cover/cover",
				// 列表样式表
				list_type: {
					'list-type-1': 'shop-list-1',
					'list-type-2': 'shop-list-2',
					'list-type-3': 'shop-list-3',
					'list-type-4': 'shop-list-4',
					'list-type-5': 'shop-list-5',
					'list-type-6': 'shop-list-6',
				},
				// 图片角样式表
				shop_shape: {
					'square': 'shop-shape',
					'circle': 'shop-circle',
					'circles': 'shop-circle2'
				},
				//拼团图标的样式
				vip_img:{
					'list-type-1': 'vip-img-1',
					'list-type-2': 'vip-img-2',
					'list-type-3': 'vip-img-3',
					'list-type-4': 'vip-img-4',
					'list-type-5': 'vip-img-5',
					'list-type-6': 'vip-img-6',
				},
				// 当样式为瀑布流时
				list_1: [],
				list_2: [],
				list:[],
				lists: [
					{
						img_url: require('./img/11.jpeg'),
						title: '这是标题',
						pt:1,
						desc: '这是商品的描述',
						price: 16.5,
					},
					{
						img_url: require('./img/12.jpeg'),
						title: '这是标题这是标题这是标题这是是标题这是标题',
						pt:1,
						desc: '这是商品的描述这是商品的描述这是描述这是商品的描述这是商品的描述',
						price: 16.5,
					},
					{
						img_url: require('./img/13.jpeg'),
						title: '这是标题这题这是标题这是标题这是标题',
						pt:0,
						desc: '这是商品的描述这是描这是商品的描述这是商品的描述',
						price: 16.5,
					},
					{
						img_url: require('./img/14.jpeg'),
						title: '这是标题这是是标题这是标题',
						pt:0,
						desc: '这是商品的描述这是商品的描述这这是商品的描述这是商品的描述',
						price: 16.5,
					} 
				]
			}
		},
		watch:{
			refresh(){
				console.log("CCTV")
				this.is_index();
			}
		},
		computed:{
			is_list_type() {
				if(this.dat.list_type == 'list-type-6') {
					this.waterFallInit();
					return true;
				}
				return false;;
			},
			fun_select(){
				if(this.vuex_xz.type=='shop-list' && this.vuex_xz.id == this.dat.unique){
					return true;
				}
				return false;				
			}
		},
		mounted() {
			this.is_index();
			const  that =this;
			that.$EventBus.$on('tabsChange',(index)=>{
				that.is_show(index);
			})
		},
		beforeDestroy() {
			this.$EventBus.$off('tabsChange');
		},
		methods: {
			is_show(index){
				let data =uni.getStorageSync('tabsList');
				let id =data[index].id;
				if(id){
					this.$http.get(this.$api.course.get_course+"?project="+id).then(res=>{
						if(res.status==200){
							this.list= res.data;
						}
					})
				}
				//console.log(data[index])
			},
			//判断是不是首页
			is_index(){
				console.log("t",this.pageType)
				if(this.pageType=='index'){
					this.$http.get(this.$api.course.get_course+"?is_tui=1").then(res=>{
						if(res.status==200){
							this.list= res.data;
							uni.stopPullDownRefresh()
						}
					})
				}else{
					this.$http.get(this.$api.course.get_course).then(res=>{
						if(res.status==200){
							this.list =res.data;
							uni.stopPullDownRefresh()
						}
					})
				}
			},
			
			//判断跳转的页面类型
			skip(id,type){
				if(type==1){
					uni.navigateTo({
						url:"/pages/good/good_infoB/good_infoB?id="+id
					})
				}else{
					uni.navigateTo({
						url:"/pages/good/good_info?id="+id
					})
				}
			},
			// 鼠标点击组件获取该组件的 unique
			activeGetSorts() { 
				this.$emit('getUnique', this.dat);
			},
			// 当样式为瀑布流时
			waterFallInit() {
				for(let k in this.list)
				{
					if(k % 2 == 0) {
						this.list_1.push(this.list[k]);
					}
					else {
						this.list_2.push(this.list[k]);
					}
				}
			},
			
		}
	}
</script>

<style lang="scss" scoped>
.st-shop-list {
	width: 100vw;
	padding: 10rpx;
	.shop-list {
		display: flex;
		width: calc(750upx - 20rpx);
		.shop {
			background-color: #FFFFFF;
			padding: 12px;
			border-radius: 8px;
			position: relative;
			.img {
				overflow: hidden;
				.image {
					width: 100%;
					height: 100%;
				}
			}
			.vip-img{
				width: 100rpx;
				height: 100rpx;
			}
			.main {
				.shop-body {
					.title {
						white-space: nowrap;
						text-overflow: ellipsis;
						overflow: hidden;
					}
					.desc {
						color: #777;
						display: -webkit-box;
						-webkit-box-orient: vertical;
						-webkit-line-clamp: 2;
						overflow: hidden;
						font-size: 0.8rem;
					}
				}
				.shop-foot {
					display: flex;
					justify-content: space-between;
					align-items: center;
					>view {
						color: red;
						>text {
							&::before {
								content: "￥";
								font-size: 0.7rem;
							}
						}
						>button {
							margin: 0;
						}
					}
				}
			}
		}
		
		&-1 {
			flex-direction: column;
			.shop {
				background-color: #FFFFFF;
				padding: 12px 15px;
				border-radius: 8px;
				//box-shadow: 0px 0px 5px #909399;
				margin-bottom: 20rpx;
				.img {
					width: calc(750upx - 80rpx);
					height: calc(750upx - 320rpx);
				}
				.vip-img-1{
					position: absolute;
					right: 15px;
					top: 12px;
				}
				.main {
					margin-top: 10rpx;
					.shop-body {
						.title {
							padding-right: 70px;
							font-size: 34rpx;
							margin: 20rpx 0rpx;
						}
						.desc {
							margin: 20rpx 0rpx;
						}
					}
				}
			}
		}
		
		&-2  {
				flex-wrap: wrap;
				width: calc(750upx - 20rpx);
				
				.shop {
					background-color: #FFFFFF;
					padding: 0px 12px 12px 12px;
					//box-shadow: 0px 1px 5px #909399;
					 box-shadow: 0 .125rem .25rem rgba(0,0,0,.075) !important;
					border-radius: 8px;
					display: flex;
					flex-direction: column;
					align-items: center;
					// width: 50%;
					// modify
					width:  44%;
					margin: 0px 3%;
					&:nth-child(2n-1) {
						margin-right: 2%;
					}

					// modify end
					margin-bottom: 20rpx;

					>view {
						width: 100%;
					}

					.img {
						width: calc(750upx / 2 - 52rpx - 0rpx);
						height: calc(750upx / 2 - 52rpx - 0rpx);
					}
					.vip-img-2{
						position: absolute;
						left: -1px;
						top: 0px;
					}
					.main {
						display: flex;
						flex-direction: column;
						justify-content: space-between;
						flex-grow: 1;
						margin-top: 10rpx;

						.shop-body {
							.title {}

							.desc {
								margin: 10rpx 0;
							}
						}

						.shop-foot {
							margin-top: 10rpx;
						}
					}
				}
			}
		
		&-3 {
				overflow-x: scroll;
				.shop {
					background-color: #FFFFFF;
					margin: 6px;
					border-radius: 8px;
					padding: 0px;
					display: flex;
					flex-direction: column;
					align-items: center;
					 box-shadow: 0 .125rem .25rem rgba(0,0,0,.075) !important;
					margin-bottom: 20rpx;

					>view {
						width: 100%;
					}

					.img {
						width: calc(750upx / 3);
						height: calc(750upx / 3);
					}
					
					.vip-img-3{
						width: 60rpx;
						height: 60rpx;
						position: absolute;
						right: 0px;
						top: 0px;
					}
					.main {
						display: flex;
						flex-direction: column;
						justify-content: space-between;
						flex-grow: 1;
						margin-top: 10rpx;
						padding: 6px 12px;
						.shop-body {
							.title {
								white-space:normal !important;
								height: 20px;
								line-height: 20px;
								overflow: hidden;
							}

							.desc {
								margin: 10rpx 0;
							}
						}

						.shop-foot {
							margin-top: 10rpx;
						}
					}
				}
			}
		
		&-4 {
				flex-direction: column;

				.shop {
					background-color: #FFFFFF;
					padding: 12px;
					border-radius: 8px;
					//box-shadow: 0px 0px 5px #909399;
					display: flex;
					margin-bottom: 15rpx;

					.img {
						width: 200rpx;
						height: 200rpx;
						margin-right: 15rpx;
						flex-shrink: 0;

						.image {
							height: 100%;
							width: 100%;
						}
					}
					.vip-img-4{
						width: 80rpx;
						height: 80rpx;
						position: absolute;
						left: 12px;
						top: 12px;
					}
					.main {
						display: flex;
						flex-direction: column;
						justify-content: space-between;
						padding-top: 20px;
						width: calc(100% - 150rpx - 15rpx);

						.shop-body {
							width: 100%;

							.title {
								width: 100%;
								font-size: 34rpx;
								line-height: 20px;
								height: 20px;
							}

							.desc {
								font-size: 0.8rem;
								margin-top: 10rpx;
								/* display: -webkit-box;
								-webkit-box-orient: vertical;
								-webkit-line-clamp: 2; */
								overflow: hidden;
								line-height: 20px;
								height: 40px;
							}
						}

						.shop-foot {
							width: 100%;
							margin-top: 10rpx;

						}
					}
				}
			}
		
		&-5 {
				flex-wrap: wrap;
				width: calc(750upx - 20rpx);

				.shop {
					background-color: #FFFFFF;
					padding: 0px;
					margin: 0px 12px;
					border-radius: 8px;
					 box-shadow: 0 .125rem .25rem rgba(0,0,0,.075) !important;
					display: flex;
					flex-direction: column;
					align-items: center;
					// width: calc(750upx / 3 - 10rpx);
					// modify
					width: 29%;
					margin-right: 0.5%;

					&:nth-child(3n) {
						margin-right: 0;
					}

					// modify end
					margin-bottom: 40rpx;

					>view {
						width: 100%;
					}

					.img {
						width: calc(750upx / 3 - 30rpx - 8rpx);
						height: calc(750upx / 3 - 30rpx - 8rpx);
					}
					.vip-img-5{
						width: 80rpx;
						height: 80rpx;
						position: absolute;
						right: -1px;
						top: 0px;
					}
					.main {
						display: flex;
						flex-direction: column;
						justify-content: space-between;
						flex-grow: 1;
						padding: 12rpx;
						margin-top: 10rpx;

						.shop-body {
							.title {}

							.desc {
								margin: 10rpx 0;
							}
						}

						.shop-foot {
							margin-top: 10rpx;
						}
					}
				}
			}
		
		&-6 {
				width: 48%;
				margin: 0px 4px;
				display: block;

				.shop {
					background-color: #FFFFFF;
					padding: 0px;
					border-radius: 8px;
					margin-bottom: 20rpx;
					box-shadow: 0 .125rem .25rem rgba(0,0,0,.075) !important;
					// modify
					width: 98%;
					margin-right: 2%;

					// modify end
					>view {
						width: 100%;
					}

					.img {
						width: 100%;

						.image {
							width: 100%;
						}
					}
					.vip-img-6{
						width: 80rpx;
						height: 80rpx;
						position: absolute;
						right: 0px;
						top: 0px;
					}
					.main {
						padding: 12px;
						display: flex;
						flex-direction: column;
						justify-content: space-between;
						flex-grow: 1;
						margin-top: 10rpx;

						.shop-body {
							.title {}

							.desc {
								margin: 10rpx 0;
							}
						}

						.shop-foot {
							margin-top: 10rpx;
						}
					}
				}
			}
		}
	
	.water-fall {
		width: 100%;
		display: flex;
	}
}

// 图片角形状
.shop-square {
	border-radius: 0;
}
.shop-circle {
	border-radius: 10rpx;
}
.shop-circle2 {
		border-radius: 16rpx 16rpx 0rpx 0rpx;
}
// 图片角形状 end

// 商品样式
.main-1 {
	
}
.main-2 {
	.shop {
		background-color: white;
		padding: 0 !important;
		.img {
			width: 100% !important;
			.image {
				width: 100%;
			}
		}
		.main {
			padding: 10rpx;
		}
	}
}
.main-3 {
	// box-shadow: 0 0 20rpx #eee;
}
// 商品样式 end

</style>
