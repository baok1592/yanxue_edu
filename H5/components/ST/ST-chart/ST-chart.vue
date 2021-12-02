<template>
	<view class="st-default article-list" style="display: flex;flex-wrap: wrap;">
		<view class="charts-box">
			<qiun-data-charts :type="chartStyle" :chartData="chartData" background="none" />
		</view>
		<move-handle :isSelect="fun_select" :isPhone="isPhone" @choose="activeGetSorts"></move-handle>
	</view>
</template>

<script>
	export default {
		components: {

		},
		props: {
			isPhone: {
				type: Boolean,
			},
			dat: {
				type: Object,
			},

		},
		watch:{
			//实时响应cms端选中的图表类型并赋值
			chartStyle(n){
				if(n=='radar'){
					this.chartData=this.chartDatas;
					
				}else if(n=='line'){
					this.chartData=this.line;
				}
				
			}
		},
		data() {
			return {
				listpro: [{
					title: '阿圣诞节啊收到货阿圣诞节',
					wang: '中国手机网',
					ping: '2019评论',
					img: require('@/static/img/11.jpeg'),
					des: '这里是描述这里是描述这里是描述这里是描述这',
					name: '名字',
					price: '22',
					yuyue: '31',
					sheng: '55'
				}, {
					title: '阿圣诞节啊收到货阿圣诞节',
					wang: '中国手机网',
					ping: '2019评论',
					img: require('@/static/img/12.jpeg'),
					des: '这里是描述这里是描述这里是描述这里是描述这',
					name: '名字',
					price: '22',
					yuyue: '31',
					sheng: '55'
				}, {
					title: '阿圣诞节啊收到货阿圣诞节',
					wang: '中国手机网',
					ping: '2019评论',
					img: require('@/static/img/13.jpeg'),
					des: '这里是描述这里是描述这里是描述这里是描述这',
					name: '名字',
					price: '22',
					yuyue: '31',
					sheng: '55'
				}],
				chartDatas: {
					categories: [
						"维度1",
						"维度2",
						"维度3",
						"维度4",
						"维度5",
					],
					series: [{
						"name": "成交量1",
						"data": [
							9,
							6,
							9,
							10,
							8,
							7
						]
					}, ],
				},
				line: {
					"categories": [
						"2016",
						"2017",
						"2018",
						"2019",
						"2020",
						"2021"
					],
					"series": [{
							"name": "成交量A",
							"data": [
								35,
								8,
								25,
								37,
								4,
								20
							]
						}
					]
				},
				chartData:{}
			}
		},
		computed: {
			fun_select() {
				if (this.vuex_xz.type == 'chart' && this.vuex_xz.id == this.dat.unique) {
					return true;
				}
				return false;
			},
			//设置对象中的某个值
			chartStyle:function() {
				return this.dat.chart_style
			}
		},
		mounted() {
			this.chartData=this.chartDatas;
		},
		methods: {
			// 鼠标点击组件获取该组件的 unique
			activeGetSorts() {
				this.$emit('getUnique', this.dat);
			},
		}
	}
</script>

<style lang="scss" scoped>
	.st-default {}

	.charts-box {
		width: 100%;
		height: 300px;
	}
</style>
