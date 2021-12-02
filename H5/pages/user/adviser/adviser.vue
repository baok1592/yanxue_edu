<template>
	<view class="pd16_15" style="background-color: #f4f4f5;min-height: 94vh;">
		<u-button :plain="true" type="warning" size="mini" @click="skip()" v-if="type=='vacate'">请假记录</u-button>
		<view class="box-with noshadow pd16_15"  style="margin-top: 28rpx;" v-if="type=='vacate'">
			<u-form :model="form" ref="uForm">
				<!-- <block>{{form.name.trim()==0}}</block> -->
				<u-form-item label="姓名"><u-input v-model="form.name" :disabled="true"/></u-form-item>
				<u-form-item label="日期" >
					<u-input v-model="form.time" type="select"  :select-open="show" @click="show = true"/>
				</u-form-item>
			</u-form>
		</view>
		
		<view class="box-with noshadow pd16_15 mt16">
			<textarea v-model="form.content" placeholder="请输入内容:" placeholder-class="cl-notice" class="ft14" style="height: 300rpx; width: 100%;" :maxlength="300"></textarea>
			<view class="mt12 text-right ft12 cl-notice">
				{{form.content.length}}/300
			</view>
		</view>
		<view class="mt16">
			<u-button type="success" shape="circle" @click="sub" >立 即 提 交</u-button>
		</view>
		<u-toast ref="uToast" />
		<!-- <u-modal v-model="name_show" @confirm="confirm()" :content="job==0?'请先填写名字!':'请先填写小孩名字!'" :show-title="false"  ></u-modal> -->
		<u-calendar v-model="show" :mode="mode" @change="change" max-date="9999-1-1"></u-calendar>	
	</view>
</template>

<script>
	
	
	import {DIYdata} from "@/common/DIYdemo.js"
	const diy=new DIYdata;
	
	export default{
		data(){
			return {
				content:'',
				tel:'',
				weixin:'',
				form: {
					name: '',
					intro: '',
					sex: '',
					time:'',
					content:''
				},
				show:false,
				mode:'date',
				type:'',
				name_show:false,
				job:-1,
				
				diydata:diy.diyData,
			}
		},
		onLoad(o) {
			
			this.type=o.type;
		},
		onShow() {
			/* this.tel= uni.getStorageSync("config").tels
			this.weixin= uni.getStorageSync("config").weixin */
			
			this.set_name();
			this.look_name();
			
			this.get_info()
			this.getPageTheme();
		},
		methods:{
			ontel(tel){
				uni.makePhoneCall({
				    phoneNumber: tel //仅为示例
				});
			},
			set_name(){
				// let data =uni.getStorageSync("my").data;
				// this.job=data.job;
				// if(data.name==null){
				// 	return
				// }
				// if(data.job==0){
				// 	this.form.name=data.name;
				// }else if(data.job==2){
				// 	this.form.name=data.chird;
				// }
				
			},
			//检测名字
			look_name(){
				if(this.form.name.trim()==0){
					this.name_show=true;
					return false;
				}else{
					this.name_show=false;
					return true;
				}
			},
			onddtel(tel){
				uni.setClipboardData({
				 data: tel,  
				 success() {  
				  publicFun.showtip('已经复制')  
				 },  
				 fail(res) {  
				  console.log(res)  
				  publicFun.showtip('复制失败')  
				 }  
				
				})

			},
			change(e){
				console.log(e)
				this.form.time=e.result;
			},
			//提交
			sub(){
				if(this.type=='vacate'){
					let is = this.is_ok();
					if(is){
						this.add_message(0)
					}
				}else{
					if(this.form.content==''){
						this.$refs.uToast.show({
							title: '请填写内容',
							type: 'default',											
						})
						return;
					}
					this.add_message(1)
				}
			},
			//请假/反馈
			add_message(type){
				let form ={
					content:this.form.content,
					time:this.form.time,
					type:type
				}					
				this.$http.post(this.$api.user.add_vacate,form).then(res=>{
					if(res.status==200){
						this.$refs.uToast.show({
							title: '提交成功',
							type: 'default',											
						})
					}
				})				
			},
			//跳转页面
			confirm(){
				uni.navigateTo({
					url:"/pages/details/userset/index"
				})
			},
			//验证
			is_ok(){
				let form ={
					content:this.form.content,
					time:this.form.time,
				}
				if(form.content==''){
					this.$refs.uToast.show({
						title: '请填写内容',
						type: 'default',											
					})
					return false;
				}else if(form.time==''){
					this.$refs.uToast.show({
						title: '请填写时间',
						type: 'default',											
					})
					return false;
				}else{
					return true;
				}
			},
			/* //计算后三填的时间
			commputday(){
				const date = new Date();
				const now = date.getTime() //获取当前日期的时间戳
				let timeStr = 3600 * 24 * 1000 //一天的时间戳
				this.daynum= this.timeStamp(now + timeStr * 5).date
				 console.log("this",this.daynum)
			}, */
			skip(){
				uni.redirectTo({
					url:"/pages/user/adviser/vacate/vacate_list"
				})
			},
			
			get_info(){
					// #ifdef H5
						diy.change(1031) 
						const _this = this; 				
						window.addEventListener('message',this.response);		
						let isPhone = navigator.userAgent.toLowerCase();
						if (isPhone.indexOf('windows') != -1) {
							diy.getEff(_this,false,"usinfoStyle");
							diy.diyData.isPhone = false;
						} else {
							diy.getEff(_this,true,"usinfoStyle");
							diy.diyData.isPhone = true;
						}
					// #endif
					// #ifdef MP-WEIXIN ||MP-TOUTIAO
						diy.change(1031) 
						const _this = this;
						const diyRes= diy.getEff(_this,true,'usinfoStyle');
						diyRes.then(res=>{
							console.log("aaaaa",res)
						  res.isPhone = true;
						  _this.diydata=res
						}) 
					// #endif
								
					//#ifdef APP-PLUS
						diy.change(1031)
						const _this = this;
						diy.getEff(_this,true,'usinfoStyle');
						diy.diyData.isPhone = true;
					//#endif
				},
			
			
			//鼠标点击获取点击id
			activeGetUnique(item){
				const _this = this;
				diy.activeGetUnique(item,_this)
			},
			//获取页面主题
			getPageTheme(){						
				diy.getPageTheme()
			},
			// 更新页面主题
			updatePageTheme() {
				this.getPageTheme();
			},
			//响应cms窗口的数据
			response(event){
				console.log("event",event)
				diy.save(event,this,"");
			},
			
		}
	}
</script>

<style lang="scss">
	.adviser-face-big{
		width: 160rpx;
		height: 160rpx;
		border-radius: 80rpx;
		background: #FFFFFF;
	}
	.copy-tag{
		width: 96rpx;
		height: 40rpx;
		color:#FFFFFF;
		font-size: 24rpx;
		text-align: center;
		line-height: 40rpx;
		border-radius: 20rpx;
	}
	.box-with{
		width:100%;
		background:#FFFFFF;
		box-shadow:0rpx 8rpx 40rpx 0rpx rgba(0,0,0,0.04);
		border-radius:32rpx;
	}
	.box-with.noshadow{
		box-shadow:none;
	}
	.ft14{font-size: 28rpx;}
	
	.cl-notice{color:#AEB2C1;}
	.pd16_15{
		padding: 32rpx 30rpx;
	}
	.mt16{margin-top: 32rpx;}
	.text-right{text-align: right;}
	.mt12{margin-top: 24rpx;}
</style>