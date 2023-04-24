import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

/* Layout */
import Layout from '@/layout'

export const constantRoutes = [
  {
    path: '/login',
    component: () => import('@/views/login/index'),
    hidden: true
  },
  {
    path: '/404',
    component: () => import('@/views/404'),
    hidden: true
  },
  {
    path: '/',
    component: Layout,
    redirect: '/dashboard',
    children: [{
      path: 'dashboard',
      name: 'Dashboard',
      component: () => import('@/views/dashboard/index'),
      meta: { title: '首页', icon: 'dashboard' }
    }]
  },
]

const createRouter = () => new Router({
  // mode: 'history', // require service support
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRoutes
})

const router = createRouter()

// Detail see: https://github.com/vuejs/vue-router/issues/1234#issuecomment-357941465
export function resetRouter() {
  const newRouter = createRouter()
  router.matcher = newRouter.matcher // reset router
}

export default router













// {
//   path: '/sys',
//   component: Layout,
//   redirect: '/sys/user',
//   name: 'sysManage',
//   meta: { title: '系统管理', icon: 'el-icon-s-help' },
//   children: [
//     {
//       path: 'user',
//       name: 'user',
//       component: () => import('@/views/sys/user'),
//       meta: { title: '用户管理', icon: 'table' }
//     },
//     {
//       path: 'role',
//       name: 'role',
//       component: () => import('@/views/sys/role'),
//       meta: { title: '角色管理', icon: 'tree' }
//     }
//   ]
// },
// {
//   path: '/test',
//   component: Layout,
//   redirect: '/test/test1',
//   name: 'test',
//   meta: { title: '功能测试', icon: 'form' },
//   children: [
//     {
//       path: 'test1',
//       name: 'test1',
//       component: () => import('@/views/test/test1'),
//       meta: { title: '测试点一', icon: 'form' }
//     },
//     {
//       path: 'test2',
//       name: 'test2',
//       component: () => import('@/views/test/test2'),
//       meta: { title: '测试点二', icon: 'form' }
//     },
//     {
//       path: 'test3',
//       name: 'test3',
//       component: () => import('@/views/test/test3'),
//       meta: { title: '测试点三', icon: 'form' }
//     }
//   ]
// },
//
// // 404 page must be placed at the end !!!
// { path: '*', redirect: '/404', hidden: true }
