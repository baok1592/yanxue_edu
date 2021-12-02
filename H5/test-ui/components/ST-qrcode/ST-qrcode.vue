<template>
	<view class="st-default article-list" style="display: flex;flex-wrap: wrap;width: 100%;">  
		<dialogQrcode   v-if="companyQrcode" :src="comerweima" type="company" @closed="companyQrcode = false"></dialogQrcode>
		<view class="q-code">
			<!-- <view class="text">
				{{company_name}}<br/>
				{{company_copy}}
			</view> -->
			<image style="width: 40rpx;height: 40rpx;" src="@/static/img/erwei.png" @click="company()"></image>
		</view>
		<move-handle :isSelect="fun_select" :isPhone="isPhone" @choose="activeGetSorts"></move-handle>
	</view>
</template>

<script>
	import dialogQrcode from './components/qrcode.vue'
	export default {
		components:{
			dialogQrcode,
		},
		props: {
			isPhone: {
				type: Boolean,
			},
			dat:{
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
				companyQrcode:false,
				comerweima:'',
			}
		}, 
		computed:{
			fun_select(){
				if(this.vuex_xz.type=='qrcode' && this.vuex_xz.id == this.dat.unique){
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
			//公司二维码
			company(){			
				this.companyQrcode=true;
				//this.comerweima='https://edu.ruhuashop.com/uploads/img/xcx_code.png';
				
				this.$http.get(this.$api.user.get_code).then(res=>{
					if(res.status==200){						
						this.comerweima=res.data.url;
					}
				})
				
			},
		}
	}
</script>

<style lang="scss" scoped>
.st-default {
	
}
.q-code{
		//margin-top: 40px;
		width: 100%;
		display: flex;
		align-items: center;
		justify-content: center;
		.text{
			color: #909399;
			text-align: center;
			margin-right: 14px;
		}
	}
</style>
