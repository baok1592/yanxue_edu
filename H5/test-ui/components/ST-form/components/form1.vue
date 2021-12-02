<template>
	<view>
		<u-toast ref="uToast" />
		<u-form :model="form" ref="uForm" :rules="rules" class="mb-3">			
			<view  class="sortable-panel" v-for="(item,index) in dat.form_list" :key="index">		
					<u-form-item label="姓名" :required="true"  prop="name"  v-if="item=='name'">
						<u-input v-model="form.name"  :border="true"/>						
					</u-form-item>
					<u-form-item label="电话"  :required="true" v-if="item=='phone'">
						<u-input v-model="form.mobile" :border="true" type="number"/>						
					</u-form-item>
					<u-form-item label="地址"  :required="true" v-if="item=='addres'">
						<u-input v-model="form.address" :border="true"/>					
					</u-form-item>
					<u-form-item label="邮箱" :required="true" v-if="item=='email'">
						<u-input v-model="form.mail" :border="true"/>					
					</u-form-item>
									
			</view>			
		</u-form>
		<u-form :model="form" ref="uForm" :rules="rules" >
			<view  class="sortable-panel" v-for="(item,index) in dat.form_list" :key="index">		
					
					<u-form-item label="留言" :required="true"  v-if="item=='message'">
						<u-input v-model="form.content" type="textarea" height="170" :auto-heigh="true" :border="true"/>						
					</u-form-item>				
			</view>			
		</u-form>
		<u-button @click="submit" :type="bottomtype">提交</u-button>
	</view>
</template>

<script>
	export default{
		props:{
			dat: {
				type: Object,
			}
		},
		data(){
			return {
				form: {
					name: '',
					mobile: '',
					address: '',
					mail:'',
					content:'',
				},
				auto_heigh:false,
				rules: {
					name: [
						{
							required: true,
							message: '请输入姓名',
							// 可以单个或者同时写两个触发验证方式
							trigger: ['change','blur'],
						}
					],
					
				},
				radio: '',
				switchVal: false,
				bottomtype:"primary",
			}
		},
		onLoad(e){
			
		},
		onShow() {
			this.show_data();
		},
		watch:{
			color(n){
				this.change_color(n)
			}
		},
		methods:{
			//全局mixin便于下拉刷新与分享
			show_data(){
				
			},
			//点击提交按钮
			submit(){
				console.log("提交表单")
				publicModel.addAbout(this.form).then(res=>{
					console.log("sddfs",res)
					if(res.status==200){
						console.log("sdfsd")
						this.$refs.uToast.show({
								title: '提交成功',
								type: 'success',
								url: '/pages/index/index'
							})
					}
				})
			},
			//修改按钮颜色
			change_color(color){
				switch(color){
					case "#E9003A":
						this.bottomtype="error";
						break;
					case "#437DD4":
						this.bottomtype="primary";
						break;
					case "#00AC6B":
						this.bottomtype="success";
						break;
					case "#FFB040":
						this.bottomtype="warning";
						break;
				}
			},
		}
	}
</script>

<style>
	
</style>
