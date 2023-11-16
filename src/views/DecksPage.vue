<template>
  <ion-content class="container">
    <!-- <ion-page>
    <ion-content> -->
    <MyHeader />
    <!-- <div class="fixed top-0 left-0 right-0 z-50 bg-blue-500 p-2 text-white flex">
    <div class="flex">High Frontier 4 All - Decks Assistant</div>
    <div
      class="flex flex-1 justify-end cursor-pointer"
      @click="setActiveComponent('Filters')"
    >
      <svg
        xmlns="http://www.w3.org/2000/svg"
        fill="none"
        viewBox="0 0 24 24"
        stroke-width="1.5"
        stroke="currentColor"
        class="w-6 h-6 text-red-700 fill-current"
      >
        <path
          stroke-linecap="round"
          stroke-linejoin="round"
          d="M12 3c2.755 0 5.455.232 8.083.678.533.09.917.556.917 1.096v1.044a2.25 2.25 0 01-.659 1.591l-5.432 5.432a2.25 2.25 0 00-.659 1.591v2.927a2.25 2.25 0 01-1.244 2.013L9.75 21v-6.568a2.25 2.25 0 00-.659-1.591L3.659 7.409A2.25 2.25 0 013 5.818V4.774c0-.54.384-1.006.917-1.096A48.32 48.32 0 0112 3z"
        />
      </svg>
    </div>
  </div> -->
    <FilterDecks @activeFilters="setActiveComponent('Filters')" />
    <!-- <transition name="translate" mode="out-in">
    <component
      :is="state.activeComponent"
      @hide="state.activeComponent('SliderCards')"
    />
  </transition> -->
    <!-- <Transition name="slide-fade">
    <component
      :is="showComponent"
      @activeSlider="setActiveComponent('SliderCards')"
    />
  </Transition> -->
    <Transition name="move" class="">
      <Filters
        v-if="showComponent == 'Filters'"
        @activeSlider="setActiveComponent('SliderCards')"
      />
      <SliderCards v-else-if="showComponent == 'SliderCards'" />
    </Transition>
    <MyFooter />
    <!-- </ion-content>
  </ion-page> -->
  </ion-content>
</template>

<script>
// import {
//   IonContent,
//   // IonHeader,
//   IonPage,
//   // IonTitle,
//   // IonToolbar,
// } from "@ionic/vue";
import { useRouter } from "vue-router";
import { reactive, computed, Transition } from "vue";
import MyHeader from "@/components/MyHeader.vue";
import MyFooter from "@/components/MyFooter.vue";
import FilterDecks from "@/components/FilterDecks.vue";
import SliderCards from "@/components/SliderCards.vue";
import Filters from "@/components/Filters.vue";

export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: "Cards",
  components: {
    MyHeader,
    MyFooter,
    // IonContent,
    // IonHeader,
    // IonPage,
    // IonTitle,
    // IonToolbar,
    // SliderCards,
    FilterDecks,
    Filters,
    SliderCards,
    Transition,
  },

  setup() {
    const state = reactive({
      activeComponent: "SliderCards",
      // activeComponent: computed((componentName) => {
      //   console.debug("load!", state.activeComponent, componentName);
      //   if (componentName == undefined) return "SliderCards";
      //   else return componentName;
      // }),
    });

    const showComponent = computed(() => {
      return state.activeComponent;
    });

    function setActiveComponent(componentName) {
      state.activeComponent = componentName;
    }

    function load(componentName) {
      console.debug("load!", state.activeComponent, componentName);
      state.activeComponent = componentName;
    }

    return {
      router: useRouter(),
      state,
      showComponent,
      setActiveComponent,
      load,
    };
  },
};
</script>

<style scoped>
.container {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}
.fade-enter-active {
  transition: opacity 0.5s;
}
.fade-enter,
.fade-leave-to {
  opacity: 50;
}

.move-enter-from,
.move-leave-to {
  opacity: 0;
  transform: translateX(-50px);
}
.move-enter-active,
.move-leave-active {
  transition: all 0.1s ease-out;
}

.translate-enter-active,
.translate-leave-active {
  transition: all 0.5s ease;
}
.translate-enter-from,
.translate-leave-to {
  opacity: 0;
  transform: translateX(30px);
}

.slide-enter-active {
  animation: slide 1s;
}
.slide-leave-active {
  transition: all 1s;
  opacity: 0;
}

.slide-fade-enter-active {
  transition: all 0.3s ease-out;
}
.slide-fade-leave-active {
  transition: all 0.8s cubic-bezier(1, 0.5, 0.8, 1);
}
.slide-fade-enter-from,
.slide-fade-leave-to {
  transform: translateX(20px);
  opacity: 0;
}

.v-enter-active,
.v-leave-active {
  transition: opacity 0.5s ease;
}
.v-enter-from,
.v-leave-to {
  opacity: 0;
}
/*
.header {
  position: fixed;
  top: 0px;
}
.body {
  margin-top: 50px;
}
#container {
  text-align: center;

  position: absolute;
  left: 0;
  right: 0;
  top: 50%;
  transform: translateY(-50%);
}

#container strong {
  font-size: 20px;
  line-height: 26px;
}

#container p {
  font-size: 16px;
  line-height: 22px;

  color: #8c8c8c;

  margin: 0;
}

#container a {
  text-decoration: none;
}
*/
</style>
