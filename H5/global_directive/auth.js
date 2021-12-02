//  common/directive.js
import Vue from 'vue' // 引入vue

function checkZhiwu(num) {   
  const my=JSON.parse(localStorage.getItem('my'));  
  if (my.zhiwu >= num) {
    return true
  }  
  return false   
} 


function checkAuth(key) {   
  const my=localStorage.getItem('auth').split(","); 
  /* let Ids = [1,2]   如果
  let index = Ids.indexOf(my.id)
  if (index > -1) {
    return true
  } */
  const rules=my 
  const name=key
  for (const k in rules) {
      const v=rules[k] 
      if(name==v){
        return true
        break
      }      
  }
  return false   
} 

// // 优雅操作 - VUE自定义指令
Vue.directive('auth',{
  inserted(el, binding){    
    // inserted → 元素插入的时候     
    let value = binding.value // 获取到 v-permission的值 
    if(value){
      let hasPermission = checkAuth(value) 
      if(!hasPermission){
        // 没有权限 移除Dom元素
        el.parentNode && el.parentNode.removeChild(el)
      }
    }else{
      console.log('需要传key')
    }
  }
})


// 优雅操作 - VUE自定义指令
Vue.directive('zw',{
  inserted(el, binding){    
    // inserted → 元素插入的时候     
    let value = binding.value // 获取到 v-permission的值 
    if(value){
      let hasPermission = checkZhiwu(value) 
      if(!hasPermission){
        // 没有权限 移除Dom元素
        el.parentNode && el.parentNode.removeChild(el)
      }
    }else{
      console.log('需要传key')
    }
  }
})

// // 优雅操作 - VUE自定义指令
Vue.directive('jumpType',{
  inserted(el, binding){    
		// inserted → 元素插入的时候  
		let value = binding.value // 获取到 v-permission的值 
		if(value){
		  el.addEventListener("click",function(){
			  uni.navigateTo({
			  	url:value
			  })
		  })
		}else{
		  console.log('需要传key')
		}
  }
})
 