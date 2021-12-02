//import allAPi from '@/model/public.js';
import Sortable from "sortablejs";
import operationCache from '@/common/cache/index.js'
import $http from './http/axios.js'
//import publicModel from '@/model/public.js'
 

class DIYdata {
	 diyData = {
		index: 0,
		// 保存页面信息
		page_info: {},
		// 保存布局的原始数据（不可改变）
		data_sorts: [],
		// 项目的布局数据（可改变）
		sorts: [],
		// 判断项目是在哪个端打开
		isPhone: false,
		// 控制删除组件显示
		isShowDelete: false,
		// 控制组件托到删除框时，删除框的样式
		isShowDeleteStyle: false,
		// 要删除的组件 unique
		delete_unique: -1,
		// 当前页面请求数据排版的id
		id: 0,
		// 用于返回操作
		back_data: [],
		// 用于前进操作
		advance_data: [],
		// 保存最后一次返回上一步操作的数据
		back_last_data: {},
		// 后退和前进最多能保存长度
		back_advance_len: 10,
		themeColors: 'theme-colors-red',
		//子页面函数刷新
		shop_list: false,
		//顶部导航
		background: {
			backgroundColor: '#FFFFFF',
			zIndex: '999',
			marginBottom: "-1px"
		},
		song: {
			color: "default"
		},
		navbar_title: "",
		back_img: 'http://192.168.124.17:8070/uploads/imgs/202102/6034a69aaa476.jpeg',
		num: 0,
		auth: {
			is_name: false,
			is_address: false,
			is_phone: false,
		},
		lists: [{
								image: 'https://cdn.uviewui.com/uview/swiper/1.jpg',
								title: '昨夜星辰昨夜风，画楼西畔桂堂东'
							},
							{
								image: 'https://cdn.uviewui.com/uview/swiper/2.jpg',
								title: '身无彩凤双飞翼，心有灵犀一点通'
							},
							{
								image: 'https://cdn.uviewui.com/uview/swiper/3.jpg',
								title: '谁念西风独自凉，萧萧黄叶闭疏窗，沉思往事立残阳'
							}
						],
		listAA:[]
	};
	
	 _this = null;
	//改变id
	 change(styleid) {
		
		this.diyData.id = styleid;
	}
	
	 text() {
	}
	//全局下拉	
	 show_data() {
		this.shop_list = !this.shop_list;
		console.log(this.shop_list)
	}
	// 获取布局数据
	async  getEff(push_this, flag, style) {
		var _this = push_this;
		let data = operationCache.time_verify(style)
		if (data != false) {
			return this.getEffdex(data.data, flag)
		} else {
			return await $http.get('get_data?id='+this.diyData.id).then(async res => {
				operationCache.set_verify(style, res) //存入缓存
				return this.getEffdex(res, flag)
			})
		}
	}
	//获取布局后
	async  getEffdex(res, flag) {
		const _this = this;
		this.diyData.page_info = res;
		this.diyData.data_sorts = res.sortable;
		this.diyData.sorts = await JSON.parse(res.sortable);
		// console.log(_this.sorts)
		// console.log(JSON.stringify(_this.sorts))
		_this.initSortable('sort-1', flag, 1);
		_this.setPageInfo(res);
		// for (let k in this.diyData.sorts.child) {
		// 	if (this.diyData.sorts.child[k].child_id) {
		// 		_this.initSortable(this.diyData.sorts.child[k].child_id, flag, 2);
		// 	}
		// }
		return this.diyData;
	
	}
	// 初始化 sortable
	async  initSortable(id, flag, level) {
		// level : -1 删除框 1 一级sortable 2 二级sortable
		// flag : true 项目是由移动端打开 false 项目是由PC端打开
		/* console.log("初始化表单",id,flag,level) */
		const _this = this;
		// #ifdef H5
		const el = await document.getElementById(id);
		// #endif
		let options = {};
		options = await {
			group: {
				name: 'sort',
				pull: true,
				put: false,
			},
			animation: 200,
			forceFallback: true,
			dragClass: 'choose-active',
			chosenClass: 'choose-active_1',
			disabled: flag,
			filter: '.st-item-fixed',
			scroll: false,
			handle: '.st-item-handle-1',
			onStart: (evt) => {
				_this.isShowDelete = true;
			},
			// 该方法目前争对删除框
			onAdd: (evt) => {
				// console.log('onAdd:', evt);
				let to_id = evt.to.id;
				let from_id = evt.from.id;
				let old_index = evt.oldIndex;
				let new_index = evt.newIndex;
				if (to_id == 'del') {
					let item = _this.searchByIdAndIndex(from_id, old_index);
					let obj = {
						id: from_id,
						type: 'delete',
						index: old_index,
						item,
					}
					// console.log(obj);
					_this.back_data.push(obj);
					_this.deleteComp(from_id, to_id, old_index, new_index);
					evt.item.style.width = 0;
					evt.item.style.height = 0;
					evt.item.style.overflow = 'hidden';
				}
				_this.$forceUpdate();
			},
			// 只有在盒子内可移动项的排序发生改变时才会触发
			onUpdate: (evt) => {
				_this.index = evt.newIndex
				// console.log('sort end');
				let to_id = evt.to.id;
				let from_id = evt.from.id;
				let old_index = evt.oldIndex;
				let new_index = evt.newIndex;
				_this.saveSort(new_index, old_index, id)
				_this.isShowDelete = false;
				_this.pageIsChange();
				let obj = {
					id: to_id,
					old_index: new_index,
					new_index: old_index,
					type: 'sort',
				};
				this.back_data.push(obj);
				if (this.back_data.length > this.back_advance_len) {
					this.back_data = this.back_data.slice(this.back_data.length - this.back_advance_len);
				}
				// console.log(this.back_data.length);
			}
		};
		if (level == -1) {
			options.group.pull = false;
			options.group.put = true;
		}
		if (level == 2) {
			// delete options.handle;
		}
	
		// #ifdef H5
		Sortable.create(el, options);
		// #endif
	}
	//推动后自动变选中状态
	 xz_index(index) {
		// const item=this.sorts.child[index] 
		// const name =item.sorts.slice(3)
		// this.$u.vuex('vuex_xz',{
		// 	"type":name,
		// 	"id":item.unique
		// })
		// this.delete_unique = item.unique;
	}
	// 保存排序
	async  saveSort(new_index, old_index, id) {
		// evt 对象 id 表示可拖拽组的 id
		const _this = this;
		const sorts = this.diyData.sorts;
		if (sorts.id == id) {
			if (old_index < new_index) {
				sorts.child.splice(new_index + 1, 0, sorts.child[old_index]);
				sorts.child.splice(old_index, 1);
			} else {
				sorts.child.splice(new_index, 0, sorts.child[old_index]);
				sorts.child.splice(old_index + 1, 1);
			}
		} else {
			for (let k in sorts.child) {
				let v = sorts.child[k];
				if (v.child_id == id) {
					if (old_index < new_index) {
						v.child.splice(new_index + 1, 0, v.child[old_index]);
						v.child.splice(old_index, 1);
					} else {
						v.child.splice(new_index, 0, v.child[old_index]);
						v.child.splice(old_index + 1, 1);
					}
				}
			}
		}
		this.diyData.sorts = sorts;
		uni.setStorageSync('sortable', this.diyData.sorts);
	}
	
	// 先筛选页面监听父窗口请求
	 save(event, _this, type) {
		// console.log("sss",event.data);
		// var event = window.event||arguments[0];
		//const _this = this;
		let dat = event.data;
		let data = dat.data;
		
		this.swich(dat, data, _this)
		
		
	}
	
	 swich(dat, data, _this) {
		switch (dat.method) {
			case 'layoutSave':
				this.saveLayout();
				break;
			case 'add-st':
				this.addComponent(data);
				break;
			case 'update':
				this.updateAttr(data, _this);
				break;
			case 'deleteCompUnique':
				this.deleteCompUnique();
				break;
			case 'backData':
				this.backData(_this);
				break;
			case 'advance':
				this.advance(_this);
				break;
			case 'setPageSuccess':
				this.setPageSuccess();
				break;
			case 'updatePageTheme':
				this.updatePageTheme();
				break;
			case 'up_downCompUnique':
				this.up_downCompUnique();
				break;
			case 'up_topCompUnique':
				this.up_topCompUnique();
				break;
		}
	}
	// 保存布局到数据库
	async  saveLayout() {
		let sorts = JSON.stringify(this.diyData.sorts);
		let form ={
			id:this.diyData.id,
			sortable:sorts
		};	
		await $http.post("/update_data",form).then(res => {
			if (res.status == 200) {
				window.parent.postMessage({
					method: 'saveSuccess',
				}, '*');
			} else {
				window.parent.postMessage({
					method: 'saveFail',
				}, '*');
			}
		})
		//移出缓存刷新页面
		uni.removeStorageSync("indexStyle")
		uni.removeStorageSync("picStyle")
		uni.removeStorageSync("articleStyle")
		uni.removeStorageSync("videoStyle")
		uni.removeStorageSync("usStyle")
		uni.removeStorageSync("coverStyle")
		uni.removeStorageSync("articlecont")
		uni.removeStorageSync("teacherStyle")
		uni.removeStorageSync("usinfoStyle")
	}
	// 添加新组件
	 addComponent(params) {
		const _this = this;
		let attr_obj = params.attr_obj;
		
		attr_obj.unique = Math.floor((new Date()).getTime() / 1000);
		// 当组件内部存在 sortable 盒子时，设置该盒子的 id
		if (attr_obj.child_id == -1) {
			attr_obj.child_id = Math.floor((new Date()).getTime());
		}
		// console.log(attr_obj)
		this.diyData.sorts.child.splice(0, 0, attr_obj);
		let obj = {
			id: this.diyData.sorts.id,
			type: 'add',
			index: 0,
			item: attr_obj,
		};
		this.diyData.back_data.push(obj);
		if (this.diyData.back_data.length > this.diyData.back_advance_len) {
			this.diyData.back_data = this.diyData.back_data.slice(this.diyData.back_data.length - this.diyData.back_advance_len);
		}
		// 当组件内部存在 sortable 盒子时，初始化该盒子
		if (attr_obj.child_id) {
			initSortable(attr_obj.child_id, this.isPhone, 2);
	
		}
	}
	// 更新组件属性内容
	 updateAttr(data, oldthis) {
		// console.log('更新组件内容');
	
		let sorts = this.diyData.sorts;
		for (let k in sorts.child) {
			if (sorts.child[k].unique == data.unique) {
				let item = JSON.parse(JSON.stringify(sorts.child[k]));
				let obj = {
					id: sorts.id,
					type: 'update',
					unique: sorts.child[k].unique,
					item,
					new_data: data
				};
				// 当最后一次返回的数据和当前更新的数据一样则不再添加到返回上一步列表中
				if (JSON.stringify(obj.item) != JSON.stringify(this.diyData.back_last_data.item)) {
					this.diyData.back_data.push(obj);
					if (this.diyData.back_data.length > this.diyData.back_advance_len) {
						this.diyData.back_data = this.diyData.back_data.slice(this.diyData.back_data.length - this.diyData.back_advance_len);
					}
				}
				for (let kk in data) {
					this.diyData.sorts.child[k][kk] = data[kk];
				}
				break;
			}
		}
		this.pageIsChange();
		oldthis.$forceUpdate();
		// console.log(this.sorts)
	}
	//点击按钮调整排序---下
	 up_downCompUnique() {
		//this.activeGetUnique()
		let sorts = this.diyData.sorts;
		var new_index;
		var old_index;
		var id;
		for (let k in sorts.child) {
			if (sorts.child[k].unique == this.diyData.delete_unique) {
				new_index = parseInt(k) + 1
				old_index = parseInt(k)
	
				id = sorts.id
				let obj = {
					id: id,
					old_index: old_index,
					new_index: new_index,
					type: 'sort',
				};
				this.diyData.back_data.push(obj);
			}
	
		}
		if (old_index < sorts.child.length) {
			this.saveSort(new_index, old_index, id)
		}
	}
	//点击按钮调整排序---上
	 up_topCompUnique() {
		let sorts = this.diyData.sorts;
		var new_index;
		var old_index;
		var id;
		for (let k in sorts.child) {
			if (sorts.child[k].unique == this.diyData.delete_unique) {
				new_index = parseInt(k) - 1
				old_index = parseInt(k)
				id = sorts.id
				let obj = {
					id: id,
					old_index: new_index,
					new_index: old_index,
					type: 'sort',
				};
				this.diyData.back_data.push(obj);
			}
		}
		if (new_index >= 0) {
			this.saveSort(new_index, old_index, id)
		}
	
	}
	// 使用 拖动 删除组件
	 deleteComp(from_id, to_id, old_index, new_index) {
		let sorts = this.sorts;
		if (sorts.id == from_id) {
			sorts.child.splice(old_index, 1);
		} else {
			for (let k in sorts.child) {
				if (sorts.child[k].child_id == from_id) {
					sorts.child[k].child.splice(old_index, 1)
				}
			}
		}
	
	}
	
	// 监听页面布局改变，发送信号到父窗口
	 pageIsChange() {
		this.xz_index(this.diyData.index)
		if (this.diyData.isPageChange) {
			window.parent.postMessage({
				method: 'pageLayoutChange',
				data: {
					flag: false,
				}
			}, '*');
		} else {
			window.parent.postMessage({
				method: 'pageLayoutChange',
				data: {
					flag: true,
				}
			}, '*');
		}
	}
	// 鼠标点击组件获取该组件的 unique
	 activeGetUnique(item, _this) {
		const name = item.sorts.slice(3)
		_this.$u.vuex('vuex_xz', {
			"type": name,
			"id": item.unique
		})
		this.diyData.delete_unique = item.unique;
		window.parent.postMessage({
			method: 'activeGetUnique',
			data: {
				// unique,
				// sorts,
				item
			}
		}, '*')
	}
	// 使用 unique 删除组件
	 deleteCompUnique() {
		let sorts = this.diyData.sorts;
		// false 删除不成功 true 删除成功
		let flag = false;
	
		for (let k in sorts.child) {
			if (sorts.child[k].unique == this.diyData.delete_unique) {
				let obj = {
					id: sorts.id,
					type: 'delete',
					index: k,
					item: sorts.child[k],
				}
				this.diyData.back_data.push(obj);
				if (this.diyData.back_data.length > this.diyData.back_advance_len) {
					this.diyData.back_data = this.diyData.back_data.slice(this.diyData.back_data.length - this.diyData.back_advance_len);
				}
				sorts.child.splice(k, 1);
				flag = true;
				break;
			} else if (sorts.child[k].child && sorts.child[k].child.length) {
				for (let kk in sorts.child[k].child) {
					let v = sorts.child[k].child[kk];
					if (v.unique == this.delete_unique) {
						let obj = {
							id: sorts.child[k].id,
							type: 'delete',
							index: kk,
							item: v,
						}
						this.diyData.back_data.push(obj);
						sorts.child[k].child.splice(kk, 1)
						flag = true;
						break;
					}
				}
			}
			if (flag) {
				break;
			}
		}
		this.pageIsChange();
		// if(flag) {
		// 	window.parent.postMessage({
		// 		method: 'deleteSuccess'
		// 	}, '*');
		// }
		// else {
		// 	window.parent.postMessage({
		// 		method: 'deleteFail'
		// 	}, '*');
		// }
	}
	// 返回上一步
	 backData(oldthis) {
		// sort 排序时 delete 删除时 add 新增组件时 update 更新组件属性时
		if (this.diyData.back_data.length <= 0) return;
		const _this = this;
		let sorts = this.diyData.sorts;
		let obj = this.diyData.back_data.pop();
		// console.log('obj:', JSON.parse(JSON.stringify(obj)))
		// console.log('obj:', this.back_data)
		// 前进操作数据
		this.diyData.advance_data.push(JSON.parse(JSON.stringify(obj)));
		if (this.diyData.advance_data.length > this.diyData.back_advance_len) {
			this.diyData.advance_data = this.diyData.advance_data.slice(this.diyData.advance_data.length - this.diyData.back_advance_len);
		}
		// console.log(this.advance_data)
		switch (obj.type) {
			case 'sort':
				this.saveSort(obj.new_index, obj.old_index, obj.id);
				break;
			case 'delete':
				if (sorts.id == obj.id) {
					this.diyData.sorts.child.splice(obj.index, 0, obj.item);
					if (obj.item.child_id) {
						initSortable(obj.item.child_id, this.diyData.isPhone, 2);
	
					}
				} else {
					let childs = sorts.child;
					for (let k in childs) {
						if (childs[k].id == obj.id) {
							this.diyData.sorts.child[k].child.splice(obj.index, 0, obj.item);
						}
					}
				}
				break;
			case 'add':
				this.diyData.sorts.child.splice(obj.index, 1);
				break;
			case 'update':
				if (sorts.id == obj.id) {
					for (let k in sorts.child) {
						if (sorts.child[k].unique == obj.unique) {
							for (let kk in obj.item) {
								this.diyData.sorts.child[k][kk] = obj.item[kk];
							}
							break;
						}
					}
				}
				// 更新到父窗口
				window.parent.postMessage({
					method: 'activeGetUnique',
					data: {
						item: JSON.parse(JSON.stringify(obj.item))
					}
				}, '*');
				oldthis.$forceUpdate();
				break;
		}
		this.diyData.back_last_data = JSON.parse(JSON.stringify(obj));
		this.pageIsChange();
		// console.log(obj, this.back_data);
	}
	// 根据 id 和 index 查找对应项
	 searchByIdAndIndex(id, index) {
		let sorts = this.diyData.sorts;
		if (sorts.id == id) {
			return sorts.child[index];
		} else {
			let childs = sorts.child;
			for (let k in childs) {
				if (childs[k].id == id) {
					return childs[k][index];
				}
			}
		}
		return -1;
	}
	// 前进一步
	 advance(oldthis) {
		// 操作type: sort 排序 delete 删除 add 新增组件 update 更新组件属性
		if (this.diyData.advance_data.length <= 0) return;
		let sorts = this.diyData.sorts;
		let obj = this.diyData.advance_data.pop();
		// console.log('advance:', JSON.parse(JSON.stringify(obj)));
		switch (obj.type) {
			case 'sort':
				this.saveSort(obj.old_index, obj.new_index, obj.id);
				break;
			case 'delete':
				if (sorts.id == obj.id) {
					this.diyData.sorts.child.splice(obj.index, 1);
					if (obj.item.child_id) {
						initSortable(obj.item.child_id, _this.isPhone, 2);
	
					}
				} else {
					let childs = sorts.child;
					for (let k in childs) {
						if (childs[k].child_id == obj.child_id) {
							this.diyData.sorts.child[k].child.splice(obj.index, 1);
						}
					}
				}
				break;
			case 'add':
				this.diyData.sorts.child.splice(obj.index, 0, obj.item);
				break;
			case 'update':
				if (sorts.id == obj.id) {
					for (let k in sorts.child) {
						if (sorts.child[k].unique == obj.unique) {
							for (let kk in obj.new_data) {
								this.diyData.sorts.child[k][kk] = obj.new_data[kk];
							}
							break;
						}
					}
				}
				// 更新到父窗口
				window.parent.postMessage({
					method: 'activeGetUnique',
					data: {
						item: JSON.parse(JSON.stringify(obj.new_data))
					}
				}, '*');
				oldthis.$forceUpdate();
				break;
		}
		this.pageIsChange();
	}
	// 设置页面信息
	 setPageInfo(page_info) {
		 
		this.diyData.navbar_title = page_info.page_name
	}
	// 页面信息设置成功
	 setPageSuccess(){
		uni.removeStorageSync("indexStyle")
		uni.removeStorageSync("picStyle")
		uni.removeStorageSync("articleStyle")
		uni.removeStorageSync("videoStyle")
		uni.removeStorageSync("usStyle")
		uni.removeStorageSync("coverStyle")
		uni.removeStorageSync("articlecont")
		uni.removeStorageSync("teacherStyle")
		uni.removeStorageSync("usinfoStyle")
	}
	
	// 获取页面主题并设置
	 getPageTheme(that) {
		let data = operationCache.time_verify("themeColor")
		if (data != false) {
			this.setcolor(data.data)
		} else {
			$http.get("/get_theme").then(res => {
				operationCache.set_verify("themeColor", res)
				//console.log("子页面",res[0].value)
				this.setcolor(res)
			})
		}
		return "12345;"
	}
	
	 setcolor(res) {
		let n = res[0].value;
		//console.log("this.background.backgroundColor",this.background)
		switch (n) {
			case "#f00":
				this.diyData.background.backgroundColor = "#E9003A";
				this.diyData.themeColors = 'theme-colors-red';
				break;
			case "#00f":
				this.diyData.background.backgroundColor = "#437DD4";
				this.diyData.themeColors = 'theme-colors-blue';
				break;
			case "#0f0":
				this.diyData.background.backgroundColor = "#00AC6B";
				this.diyData.themeColors = 'theme-colors-green';
				break;
			case "#f50":
				this.diyData.background.backgroundColor = "#FFB040";
				this.diyData.themeColors = 'theme-colors-yellow';
				break;
		}
	}
	// 更新页面主题
	 updatePageTheme() {
		//this.getPageTheme();
		$http.get("/get_theme").then(res => {
			operationCache.set_verify("themeColor", res)
			//console.log("子页面",res[0].value)
			setcolor(res)
		})
	}
	 testAAB() {
		//this.getPageTheme();
		this.diyData.listAA=this.diyData.lists;
	}
	
}
export{
	DIYdata
}

