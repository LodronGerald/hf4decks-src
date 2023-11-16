import { createRouter, createWebHistory } from '@ionic/vue-router';
import HomePage from '../views/HomePage.vue';
// import CardsPage from '../views/CardsPage.vue';
// import FiltersPage from '../views/FiltersPage.vue';
// import CardPage from '../views/CardPage.vue';
import DecksPage from '@/views/DecksPage.vue';
// import SliderTest from '@/views/SliderTest.vue';
// import TestSelectPage from '@/views/TestSelectPage.vue';
import TestSelectPage2 from '@/views/TestSelectPage2.vue';

const routes = [
  {
    path: '/',
    redirect: '/decks'
  },
  {
    path: '/home',
    name: 'Home',
    component: HomePage
  },
  {
    path: '/decks',
    name: 'Decks',
    component: DecksPage,
  },
  // {
  //   path: '/test-select',
  //   name: 'Test',
  //   component: TestSelectPage
  // },
  {
    path: '/test-multiselect',
    name: 'Test2',
    component: TestSelectPage2
  }
  // {
  //   path: '/slidertest',
  //   name: 'SliderTest',
  //   component: SliderTest,
  // },
  // {
  //   path: '/slider',
  //   name: 'SliderCards',
  //   component: SliderCards,
  // },
  // {
  //   path: '/cards',
  //   name: 'Cards',
  //   component: CardsPage,
  // },
  // {
  //   path: '/card/:id',
  //   name: 'Card',
  //   component: CardPage,
  // },
  // {
  //   path: '/filters',
  //   name: 'Filters',
  //   component: FiltersPage,
  // }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
