import Vue from 'vue'
import App from './App'
import uView from "uview-ui"
import MoveHandle from 'components/MoverHandle.vue' 
import publicModel from './model/public.js'
import axios from './common/http/axios.js'
import store from '@/common/store'
import httpApi from './common/httpApi'		//API接口配置文件
import HttpCache from './common/cache'		//缓存
import $mHelper from '@/utils/helper';		//可能需要的函数
import utils from "./utils/index.js";		//简化uniapp函数
import zIndex from "./utils/zIndex";		//规范z-index
import directive from './global_directive/auth.js'		//自定义指令



Vue.config.productionTip = false
Vue.use(uView);
Vue.component('MoveHandle', MoveHandle);
// Vue.use(VueConfig);
App.mpType = 'app'
Vue.prototype.$EventBus = new Vue()			//初始化eventBus
Vue.prototype.$http =axios;
Vue.prototype.http = publicModel;
Vue.prototype.$api = httpApi;
Vue.prototype.$SysCache = HttpCache;
Vue.prototype.$mHelper = $mHelper;


// uView-vuex
let vuexStore = require('./common/store/$u.mixin.js')
Vue.mixin(vuexStore)
 
 //下拉刷新
 import shoproShare from "@/common/mixins/shopro-share.js"
 Vue.mixin(shoproShare)

const app = new Vue({
	store,
	...App
})

import HttpInterceptor from './common/http.interceptor.js';

Vue.use(HttpInterceptor, app);

app.$mount()

export default app