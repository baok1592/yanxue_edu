<template>
	<view style="padding: 0px 28rpx;background-color: #FFFFFF;">
		
		<!-- <u-form :model="form" >
			
			<u-form-item label="班级:">
				<u-input v-model="form.class"  :disabled="true"/>
			</u-form-item>
			<u-form-item label="类型:">
				<u-input v-model="form.type"   :disabled="true"/>
			</u-form-item>
			<u-form-item label="课程:">
				<u-input v-model="form.course"  :disabled="true"/>
				<u-button slot="right" type="success" size="mini" @click="getCode()" >报名课程</u-button>
			</u-form-item>
			<u-form-item label="老师:">
				<view style="margin-right: 24rpx;" v-for="(item,index) in form.teacher" :key="index">{{item}}</view>
			</u-form-item>
			<u-form-item label="介绍:">
				<u-input v-model="form.contes" type="textarea"  :disabled="true"/>
			</u-form-item>
			<u-form-item label="进度:">
				<u-input v-model="form.plan"  :disabled="true"/>
			</u-form-item>
			
		</u-form> -->
		<!-- <u-row class="mt-3">
			<u-col span="2">
				<view>班级:</view>
			</u-col>
			<u-col span="10">
				
			</u-col>
		</u-row> -->
		<view class="mt-3">
			班级:<span class="ms-3">{{form.class}}</span>
			<u-line color="#f4f4f5" class="mt-1" />
		</view>
		<view class="mt-2">
			类型:<span class="ms-3">{{form.type}}</span>
			<u-line color="#f4f4f5" class="mt-1" />
		</view>
		<view class="mt-2">
			课程:<span class="ms-3">{{form.course}}</span>
			<u-line color="#f4f4f5" class="mt-1" />
		</view>
		<view class="mt-2">
			老师:<span class="ms-3 ms-2" v-for="(item,index) in form.teacher" :key="index">{{item}}</span>
			<u-line color="#f4f4f5" class="mt-1" />
		</view>
		<view class="mt-2" >
			<view style="min-height:300rpx;">
				介绍:<span class="ms-3" >某某那么某某那那么</span>
			</view>
			<u-line color="#f4f4f5" class="mt-1" />
		</view>
		<view class="text-center mt-3">
			<u-button type="success" size="medium">报名课程</u-button>
		</view>
		
	</view>
</template>

<script>
	export default {
		data() {
			return {
				courseid:'',
				form: {
					class: '',
					type: '',
					course:"",
					teacher: '',
					contes: "",
					plan:""
				},
			}
		},
		onLoad(option) {
				this.get_info(option.class_id,option.index)
		},
		onShow() {
			this.show_data();
		},
		methods: {
			//全局mixin便于下拉刷新与分享
			show_data() {
					
			},
			get_info(id,index){
				this.$api.get("class/get_class?id="+id+"&index="+index).then(res=>{
					const that =this;
					if(res.status==200){
						let num = parseInt(index)
						let num1=num+1;
						let data =res.data;
						let  teacher =this.teachernum(data.teacher);
						that.courseid=data.coursed.id;
						let form ={
							class: data.name,
							type: data.coursed.pro.name,
							course:data.coursed.name,
							teacher: teacher,
							contes: "",
							plan:num1+"/"+data.num
						}
						if(data.plans[0].content){
							form.contes=data.plans[0].content.content;
						}
						this.form=form;
					}
				})
			},
			teachernum(data){
				let teacher =[];
				for(let item of data){
					teacher.push(item.tea.name)
				}
				return teacher;
			},
			getCode(){
				uni.reLaunch({
					url:"/pages/client/tuan/detail?id="+this.courseid
				})
				/* uni.redirectTo({
					url:"/pages/client/tuan/detail?id="+this.courseid
				}) */
			}
		}
	}
</script>

<style>

</style>
