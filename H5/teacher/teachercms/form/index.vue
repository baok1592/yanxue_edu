<template>
	<view style="padding: 28rpx;">
			<u-form :model="form" ref="uForm">
				<u-form-item label="姓名" required ><u-input placeholder="请输入姓名" v-model="form.name" /></u-form-item>
				<u-form-item label="电话" required >							
					<view style="display: flex;">
						<u-input v-model="form.mobile" style="width: 100%;" :disabled="true"/>
						<u-button size="mini" v-if="is_mobile" type="primary" open-type="getPhoneNumber" @getphonenumber="bind"> 绑定手机号</u-button>
					</view>								
				</u-form-item>
				<u-form-item label="住址"><u-input placeholder="请输入住址" v-model="form.address" :select-open="show2" type="select" @click="index(2)"/></u-form-item>
				<!-- <u-form-item label="简介"><u-input placeholder="请输入简介" type="textarea" v-model="form.infor" /></u-form-item> -->
				<u-form-item label="孩子"><u-input placeholder="请输入姓名" v-model="form.child" /></u-form-item>
				<u-form-item label="性别"><u-input placeholder="请选择性别" :select-open="show" type="select" v-model="form.sex" @click="index(1)"/></u-form-item>
				<u-form-item label="年龄"><u-input placeholder="请选择年龄" :select-open="show3" type="select" v-model="form.age" @click="index(3)"/></u-form-item>
				<u-form-item label="老师"><u-input placeholder="" v-model="teacher" /></u-form-item>
			</u-form>
			<u-button type="primary" @click="sub">提交</u-button>
			<u-action-sheet :list="sex" v-model="show" @click="change_sex"></u-action-sheet>
			<u-action-sheet :list="address" v-model="show2" @click="change_address"></u-action-sheet>
			<u-action-sheet :list="age" v-model="show3" @click="change_age"></u-action-sheet>
	</view>
</template>

<script>
	export default{
		data(){
			return {
				form: {
					name: '',
					infor: '',
					mobile:'',
					address:'',
					child:'',
					sex:'',
					age:'',
					tid:'',
				},
				is_mobile:true,
				teacher:"",
				show: false,
				show2:false,
				show3:false,
				border: true,
				sex: [
					{
						text: '男',
						id:2,
					},
					{
						text: '女',
						id:1,
					},
					
				],
				address:[
					{
						text: '老城区',
						id:1,
					},
					{
						text: '下午屯',
						id:2,
					},
					{
						text: '坪东',
						id:3,
					},
					{
						text: '桔山',
						id:4,
					},
					{
						text: '丰都',
						id:5,
					},
					{
						text: '其他',
						id:0,
					},
					
				],
				age:[
					{
						text: '3-6',
						id:0,
					},
					{
						text: '6-9',
						id:1,
					},
					{
						text: '9-15',
						id:2,
					},
					{
						text: '15-18',
						id:3,
					}
				]
				
				
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
				
			},
			
			sub(){
				console.log("提交",this.form)
				this.$api.post("/fx/add_fx",this.form).then(res=>{
					if(res.status==200){
						console.log("")
						uni.switchTab({
							 url:'/pages/index/index'
						});
					}
				})
				
			},
			bind(e) {
				const _self =this;
				let obj = {}
				console.log("sdfs")
				obj.iv = e.detail.iv //encodeURIComponent()
				obj.encryptedData = e.detail.encryptedData 
				console.log(obj)
				//然后在第三方服务端结合 session_key 以及 app_id 进行解密获取手机号							
				_self.$api.post('auth/bindwWxMobile', obj).then(res => {
					if (res.data.mobile){						
						this.form.mobile=res.data.mobile
						uni.showToast({
							title: '绑定成功',
							duration: 2000
						});
						this.is_mobile=false;
					}
				})
				
			},
			//点击下拉
			index(index){
				if(index==1){
					this.show = true
				}else if(index==2){
					this.show2 = true
				}else if(index==3){
					this.show3 = true
				}
			},
			change_sex(index){
				console.log("inde",index)
				const that =this;
				that.form.sex=that.sex[index].text;
			},
			change_address(index){
				console.log("inde",index)
				const that =this;
				that.form.address=that.address[index].text;
			},
			change_age(index){
				console.log("inde",index)
				const that =this;
				that.form.age=that.age[index].text;
			},
			actionSheetCallback(index) {
				console.log("inde",index)
							this.value = this.actionSheetList[index].text;
			},
		}
	}
</script>

<style>
	
</style>
