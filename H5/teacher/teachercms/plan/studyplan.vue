<template>
	<view>
		<view class="timetable" v-if="dateArr">
			<view class="timetable-header">
				<view >课时：<span style="color: #fa3534;">{{starhour}}</span>/<span
						style="color: #19be6b;">{{endhour}}</span></view>
				<!-- <view v-else></view> -->
				<view>{{dateArr[0].date}} <span style="font-size: 28rpx;font-weight:normal;margin-left:8rpx;">今日</span>
				</view>
			</view>
			<view class="timetable-body">
				<view class="day" v-for="(item,index) in dateArr" :key="index">{{item.week}}</view>
			</view>
			<view class="timetable-fooder">
				<view class="day" :class="changenum==index?'day-color':''" v-for="(item,index) in dateArr" :key="index"
					@click="change(index)">
					<view style="margin-top: 24rpx;">
						{{item.date}}
					</view>
				</view>
			</view>
		</view>
		<!-- 时间轴 -->
		<view style="margin: 24rpx 50rpx;">
			<template>
				<u-time-line v-for="(item,index) in studyplan" :key="index">
					<u-time-line-item nodeTop="2">
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
									<view>班级：{{item.classes.name}}</view>
									<view>时间：{{item.plan_time}}</view>
								</view>
								<view >
									<view>教室：<block v-if="item.classes">{{item.classes.classroom}}</block></view>
									<view>课程：<block v-if="item.classes.courses[0]">{{item.classes.courses[0].name}}</block></view>
									<!-- <view class="plan-title">
									初中数学纯干货!5道例题吃透面积法拿下几何题!
								</view> -->
									<view class="u-order-desc">
										{{item.content.content}}
									</view>
								</view>
								<view style="display: flex;justify-content: space-between;">
									<view class="u-order-desc">
										老师：{{item.teacher.name||item.teacher.nickname}}
										<u-button size="mini" type="success" style="margin-right: 0px;"
											@click="spick(item.class_id,item.id)">视频介绍</u-button>
									</view>
									<!-- <view class="u-order-desc">
									立即进入>>>
								</view> -->
								</view>
							</view>
						</template>
					</u-time-line-item>
					<!-- <u-time-line-item>
					<template v-slot:node>
						<view class="u-node" style="background: #19be6b;">
							此处为uView的icon组件
							<u-icon name="bookmark-fill" color="#fff" :size="24"></u-icon>
						</view>
					</template>
					此处没有自定义左边的内容，会默认显示一个点
					<template v-slot:content>
						<view class="plan" >
							<view >时间：2月32日 08：00</view>
							<view style="display: flex;margin: 24rpx 0rpx;">
								<image mode="aspectFill" class="plan-img" src="@/static/img/teacher2.jpg"></image>
								<view class="plan-title">
									初中数学纯干货!5道例题吃透面积法拿下几何题!
								</view>
							</view>
							<view style="display: flex;justify-content: space-between;">
								<view class="u-order-desc">
									老师：李某某
								</view>
								<view class="u-order-desc">
									立即进入>>>
								</view>
							</view>
						</view>
					</template>
				</u-time-line-item> -->
				</u-time-line>
			</template>
			<view style="margin-top: 60px;">
				<u-empty v-if="show" text="暂无学习计划"></u-empty>
			</view>

		</view>

	</view>
</template>

<script>
	import timeSelector from '@/components/xiujun-time-selector/index.vue';
	import {
		dateData,
		timeData,
		timeStamp
	} from '@/common/time/date.js';
	export default {
		components: {
			timeSelector
		},
		props: {
			fresh: {
				type: Boolean
			}
		},
		data() {
			return {
				day: [
					"周一",
					"周二",
					"周三",
					"周四",
					"周五",
					"周六",
					"周日"
				],
				daynum: [31, 1, 2, 3, 4, 5, 6],
				changenum: 0,
				dateArr: null,
				studyplan: [],
				uid: null,
				show: false,
				planall: [],
				starhour: 0,
				endhour: 0,
			}
		},
		watch: {
			fresh() {
				console.log("shuaxi")
				this.show_data()
			}
		},
		onLoad(e) {
			//获取日期tab数据
			console.log("eid", e.id)
			this.uid = e.id;
		},
		onShow() {
			this.dateArr = dateData();
			this.show_data();

		},
		methods: {
			//全局mixin便于下拉刷新与分享
			show_data() {
				this.$api.get("plan/get_stu_plan?cid=" + this.uid).then(res => {
					uni.stopPullDownRefresh()
					if (res.data.length == 0) {
						this.show = true;
						console.log("空", res.data)
						return ;
					} else {
						this.show = false;
					}
					this.studyplan = res.data
					this.starhour = res.data[0].alrady
					this.endhour = res.data[0].total
					this.planall = res.data
				})
			},
			change(index) {
				this.changenum = index;
				let time = this.dateArr[index].dateX
				let data = this.planall;
				let list = []
				for (let i = 0; i < data.length; i++) {
					if (data[i].plan_time == time) {
						list.push(data[i])
					}
				}
				this.studyplan = list;
			},
			spick(id,vid) {
				uni.navigateTo({
					url: "/pages/details/course/index?id="+id+"&vid="+vid
				})
			}
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
