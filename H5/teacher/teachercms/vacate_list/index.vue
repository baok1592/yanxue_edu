<template>
	<view>
		<!-- <u-tabs :list="list" :is-scroll="false" :current="current" @change="change"></u-tabs> -->
		<view v-if="current==0">
			<u-collapse :item-style="itemStyle"  :head-style="readnew">
					<u-collapse-item :title="item.head" v-for="(item, index) in itemList" :key="item.id" :open="item.open" @change="read(item)" >					
						<view class="ddro">
							{{item.body}}	
							<view style="min-height: 24rpx;"></view>
						</view>
					</u-collapse-item>								
			</u-collapse>
			<view v-if="is_show"  style="margin-top: 80px;">
				<u-empty text="暂无请假信息" ></u-empty>
			</view>
		</view>
	</view>
</template>

<script >
	export default{
		data(){
			return {
				itemList:null,
				is_show:false,
				itemStyle: {
								marginTop: '32rpx',
								//boxShadow:'0px 0px 5px #909399',
								margin: '24rpx',
								borderRadius:' 8px',
								padding: '0rpx 24rpx',
								paddingBottom: '24rpx'
							},
				headStyle:{
					color:'#909399',
					fontWeight: 'bold'
				},
				readnew:{					
					fontWeight: 'bold'
				},
				list: [{
					name: '待收货'
				}, {
					name: '待评价',
					count: 5
				}],
				current: 0
			}
		},
		onLoad(e){
			if(e.type=="teacher"){
				this.teacher_get_message()
			}else{
				this.user_get_message()
			}
		},
		onShow() {
			
		},
		methods:{
			//全局mixin便于下拉刷新与分享
			show_data(){
				//this.user_get_message()
			},
			//获取请假信息
			user_get_message(){
				this.$http.get(this.$api.user.get_vacate).then(res=>{
					console.log(res)
					const data =res.data;
					if(res.data.length==0){
						this.is_show=true;
						console.log("222")
					}
					let list =[];
					for(let i=0;i<data.length;i++){
						let userinfo = {
										head: "",
										body: "",
										open: true,
									}
						userinfo.head =" 时间："+data[i].time;
						userinfo.body =data[i].content;
						
						list.push(userinfo)
					}
					console.log("listqq",list)
					this.itemList=list;
				})
			},
			//教师获取请假记录
			teacher_get_message(){
				this.$http.get(this.$api.teacherCms.get_vacate).then(res=>{
					console.log(res)
					console.log("111")
					const data =res.data;
					if(res.data.length==0){
						this.is_show=true;
					}
					let list =[];
					for(let i=0;i<data.length;i++){
						let userinfo = {
										head: "",
										body: "",
										open: false,
										id:"",
										read:null,
									}
						/* if(data[i].read==0){
							userinfo.head ="姓名："+data[i].user.name+" 时间："+data[i].time;
						}else{
							userinfo.head ="姓名："+data[i].user.name+" 时间："+data[i].time;
						} */
						let name ='未填写'
						if(data[i].user&& data[i].user.name){
							name=data[i].user.name;
						}else if(data[i].student&& data[i].student.name){
							name=data[i].student.name;
						}
						userinfo.head ="姓名："+name+" 时间："+data[i].time;
						userinfo.body =data[i].content;
						userinfo.id=data[i].id;
						userinfo.read=data[i].read;
						list.push(userinfo)
					}
					console.log("listqq",list)
					this.itemList=list;
				})
			},
			//
			updata(id){
				uni.navigateTo({
					url:"/pages/client/vipcard/adviser?type=vacate&id="+id
				})
			},
			deldata(){
				console.log("删除")
			},
			read(data){
				if(data.read==0){
					this.$http.put(this.$api.teacherCms.look_vacate+"?id="+data.id).then(res=>{
						if(res.status==200){
							//this.teacher_get_message()
						}
					})
				}
			},
			change(index) {
				this.current = index;
			}
		}
	}
</script>

<style lang="scss" scoped>
	.tell {
			
				
	}
	.button{
		margin: 0rpx 10%;
		display: flex;
		justify-content: flex-end;
	}
</style>
