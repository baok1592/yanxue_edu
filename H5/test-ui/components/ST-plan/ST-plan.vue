<template>
	<view class="st-default">  
	<view style="margin: 24rpx 50rpx;">
		<template>
		<u-time-line>
			<u-time-line-item nodeTop="2" v-for="(item,index) in plan_list" :key="index">
				<!-- 此处自定义了左边内容，用一个图标替代 -->
				<template v-slot:node>
					<view class="u-node" style="background: #19be6b;">
						<!-- 此处为uView的icon组件 -->
						<u-icon name="bookmark-fill" color="#fff" :size="24"></u-icon>
					</view>
				</template>
				<template v-slot:content>
					<view class="plan">
						<view style="display: flex;justify-content: space-between;">
							<view v-if="item.classes">班级：{{item.classes.name}}</view>
							<view >时间：{{item.plan_time}}</view>
						</view>
						<view>
							<view v-if="item.classes">教室：<block >{{item.classes.classroom}}</block></view>
							<view v-if="item.classes">课程：<block v-if="item.classes.courses">{{item.classes.courses[0].name}}</block></view>
							<view class="u-order-desc" v-if="item.content">
								{{item.content.content}}
							</view>
						</view>
						<view style="display: flex;justify-content: space-between;">
							<view class="u-order-desc" v-if="item.teacher">
								老师：{{item.teacher.name}}
								<u-button size="mini" type="success" style="margin-right: 0px;"
									@click="spick(item.id)">视频介绍</u-button>
							</view>
						</view>
					</view>
				</template>
			</u-time-line-item>
		</u-time-line>
		</template>
	</view>
		<move-handle :isSelect="fun_select" :isPhone="isPhone" @choose="activeGetSorts"></move-handle>
	</view>
</template>

<script>
	import {
		dateData,
		timeData,
		timeStamp
	} from '@/common/time/date.js';
	export default {
		props: {
			isPhone: {
				type: Boolean,
			},
			dat: {
				type: Object,
			},
			cid:{
				type:String
			},
			planNum:{
				type:Number
			},
			refresh:{
				type:Boolean
			}
		},
		data () {
			return {
				stude:"水水水水水水",	
				label:"",
				plan_list:[],
				all_list:[],
			}
		}, 
		computed:{
			fun_select(){
				if(this.vuex_xz.type=='plan' && this.vuex_xz.id == this.dat.unique){
					return true;
				}
				return false;				
			},		
			
		},
		watch:{
			planNum(n){
				this.changeplan(n)
			},
			refresh(){
				this.get_plan()
			}
			/* dat.cell_description(){
				console.log("ss",this.dat.cell_description,this.dat.cell_description==true)
				this.stude=this.dat.cell_description==true?"sscc":''
			} */
		},
		mounted() {
			this.get_plan();
		},
		methods: {
			// 鼠标点击组件获取该组件的 unique
			activeGetSorts() {
				this.$emit('getUnique', this.dat);
			},
			spick(id){
				uni.navigateTo({
					url:"/pages/video/video?id="+id
				})
			},
			//获取学习计划
			get_plan(){
				this.$http.get(this.$api.plan.get_plan+"?cid="+this.cid,).then(res=>{
					if(res.status == 200){
						this.plan_list=res.data;
						this.all_list=res.data;
						uni.stopPullDownRefresh()
					}
				})
			},
			//改变学习计划
			changeplan(index){
				let time = dateData();
				const changeTime = time[index].dateX;
				let  changePlan = [];
				let list = this.all_list;
				for(let i=0;i<list.length;i++){
					if(list[i].plan_time==changeTime){
						changePlan.push(list[i]);
					}
				}
				this.plan_list=changePlan;
			},
			
		}
	}
</script>

<style lang="scss" scoped>
.timetable {
		background: #f5f5f5;
		min-height: 300rpx;
	}

	.timetable-header {
		display: flex;
		margin: 0rpx 30rpx;
		padding-top: 28rpx;
		justify-content: space-between;
		font-size: 34rpx;
		font-weight: bold;
	}

	.timetable-body {
		display: flex;
		margin: 30rpx 30rpx 0rpx;

		.day {
			width: calc(100%/7);
			text-align: center;
		}
	}

	.timetable-fooder {
		display: flex;
		margin: 30rpx;

		.day {
			width: calc(100%/7);
			text-align: center;
			height: 94rpx;
			padding: 6rpx 0rpx 0rpx 0rpx;
			border-radius: 50%;
		}

		.day-color {
			background: #19be6b;
		}
	}

	.plan {
		padding: 24rpx;
		border-radius: 12rpx;
		box-shadow: 0rpx 0rpx 5rpx #82848a;
	}

	.plan-img {
		margin-right: 24rpx;
		width: 40%;
		height: 100rpx;
	}

	.plan-title {
		font-size: 28rpx;
		font-weight: bold;
	}

	.u-node {
		width: 44rpx;
		height: 44rpx;
		border-radius: 100rpx;
		display: flex;
		justify-content: center;
		align-items: center;
		background: #d0d0d0;
	}

	.u-order-title {
		color: #333333;
		font-weight: bold;
		font-size: 32rpx;
	}

	.u-order-desc {
		color: rgb(150, 150, 150);
		font-size: 28rpx;
		margin-bottom: 6rpx;
		display: flex;
		width: 100%;
		align-items: center;
		justify-content: space-between;
	}

	.u-order-time {
		color: rgb(200, 200, 200);
		font-size: 26rpx;
	}
</style>
