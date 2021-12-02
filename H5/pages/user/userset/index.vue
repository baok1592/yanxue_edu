<template>
	<view >
		<view style="padding: 24rpx;">
			<u-form :model="form" ref="uForm">
					<u-form-item label="姓名"><u-input v-model="form.name" /></u-form-item>
					<u-form-item label="电话">
								
						<view style="display: flex;">
							<u-input v-model="form.mobile" style="width: 80%;" :disabled="true"/>
							<u-button size="mini" v-if="is_mobile" type="primary" open-type="getPhoneNumber" @getphonenumber="bind"> 绑定手机号</u-button>
						</view>
									
					</u-form-item>
					<u-form-item label="角色" v-if="job_show">
						<u-radio-group v-model="form.role">
									<u-radio 
										@change="radioChange" 
										v-for="(item, index) in list" :key="index" 
										:name="item.value"
										:disabled="jingyong"
									>
										{{item.name}}
									</u-radio>
						</u-radio-group>
					</u-form-item>
					<u-form-item label="孩子" v-if="form.role==2"><u-input v-model="form.chird" :disabled="jingyong" /></u-form-item>
					<view style="margin: 24rpx 0rpx;" v-if="!jingyong">注:绑定孩子后不可修改身份</view>
			</u-form>
			<u-button type="primary" @click="submint">修改信息</u-button>
			<u-toast ref="uToast" />
		</view>
	</view>
</template>

<script>
	import {
		CUser
	} from '@/common/cache/user.js'
	var cache_user = new CUser();
	export default{
		data(){
			return {
				form: {
								name: '',
								mobile: '',
								role: '',
								chird:'',
							},
				list: [
								{
									name: '学生',
									value:0,
								},
								{
									name: '家长',
									value:2,
								}
								
							],
							// u-radio-group的v-model绑定的值如果设置为某个radio的name，就会被默认选中
							value: '学生',
				is_num: false,
				is_mobile: true,
				job_show:false,
				jingyong:false,
			}
		},
		onLoad(e){
			
		},
		onShow() {
			this.show_data();
		},
		methods:{
			//全局mixin便于下拉刷新与分享
			show_data(){
				//this.getSync()
				this.get_infor()
			},
			//单选
			radioChange(e) {
				this.form.role=e;
			},
			//绑定手机
			bind(e) {
				// #ifdef MP-WEIXIN
				const _self =this;
				let obj = {}
				console.log("sdfs",e)
				obj.iv = e.detail.iv //encodeURIComponent()
				obj.encryptedData = e.detail.encryptedData 
				console.log(obj)
				//然后在第三方服务端结合 session_key 以及 app_id 进行解密获取手机号
			
				_self.$api.post('auth/bindwWxMobile', obj).then(res => {
					console.log(res)
					if (res.data.mobile) {
						console.log("",res.data.mobile)
						_self.form.mobile=res.data.mobile;
						//_self.getSync();
						_self.is_num = true
						_self.is_mobile = false		
						//_self.get_infor();
						uni.showToast({
							title: '绑定成功',
							duration: 2000
						});
					}
				})
				// #endif
				// #ifdef H5
				console.log('跳转手机绑定')
				uni.navigateTo({
					url: './bind_phone/bind_phone'
				})
				// #endif
			},
			//修改个人信息
			submint(){
				this.$http.put(this.$api.user.up_info+"?job="+this.form.role+"&name="+this.form.name+"&chird="+this.form.chird).then(res=>{
					console.log(res)
					if(res.status==200){
						this.get_infor();
						this.$refs.uToast.show({
							title: '提交成功',
							type: 'success',
						})
						
					}
				})				
			},
			//获取个人信息
			get_infor(){
				this.$http.get(this.$api.user.get_info).then(res=>{
					console.log("res",res)
					if(res.status==200){
						if(res.data.mobile){
							this.is_mobile=false;
						}
						if(res.data.job==1){
							this.job_show=false;
						}else{
							this.job_show=true;
						}
						if(res.data.kids.length>0){
							this.jingyong=true;
						}else{
							this.jingyong=false;
						}
						var time = Date.parse(new Date()) / 1000
						let arr={}
						arr['data'] = res.data
						arr['save_time']=time
						uni.setStorageSync('my', arr);//放入缓存
						this.getSync();
					}
				})
			},
			//获取缓存中的个人信息
			getSync(){
			let form={
								name: '',
								mobile: '',
								role: '学生',
								chird:'',
							}
			let my=	uni.getStorageSync('my');
			form.name=my.data.name;
			form.mobile=my.data.mobile;
			form.role=my.data.job;
			/* if(my.data.job==0){
				form.role="学生";
			}else if(my.data.job==1){
				form.role="老师";
			}else if(my.data.job==2){
				form.role="家长";
			} */
			if(my.data.chird){
				form.chird=my.data.chird;
			}
			this.form=form;
			
			}
		}
	}
</script>

<style>
	
</style>
