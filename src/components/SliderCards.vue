<template>
  <div class="flex">
    <!--
      :slidesPerView="1"
      :spaceBetween="30"
      :loop="true"
      :effect="'fade'"
    -->
    <!--
      Effetto Carte, molto bello
      :effect="'cards'"
      :grabCursor="true"
    -->
    <swiper
      ref="swiper"
      :slidesPerView="1"
      :spaceBetween="30"
      :nextButton="swiper_btn_next"
      :prevButton="swiper_btn_prev"
      :loop="true"
      :pagination="{
        type: 'fraction',
        el: '.my-swiper-pagination',
      }"
      :modules="modules"
      class="swiper"
      @slideChangeTransitionEnd="slideChanged"
      @slideChangeTransitionStart="slideStartChange"
      @swiper="onSwiper"
    >
      <swiper-slide
        class="swiper-slide"
        v-for="card in state.listCards"
        :key="card.id"
      >
        <div class="flex flex-col">
          <FlipCard :cardFront="card" :cardBack="getCardBack(card)" />
        </div>
      </swiper-slide>
    </swiper>
    <Sidebar />
  </div>
</template>

<script>
// import { IonContent, IonPage } from "@ionic/vue";
import { inject, reactive, computed, ref, watch } from "vue";
import { useRouter } from "vue-router";
import useEventBus from "@/utility/event-bus.js";
import FlipCard from "@/components/FlipCard.vue";
import Sidebar from "@/components/Sidebar.vue";

// Import per lo swiper
import { Pagination, Navigation, Scrollbar } from "swiper";
import { Swiper, SwiperSlide } from "swiper/vue";
import "swiper/css";
import "swiper/css/pagination";
import "swiper/css/navigation";
import "swiper/css/scrollbar";
import "@ionic/vue/css/ionic-swiper.css";

import cards from "../data/cards";
const alasql = require("alasql");
// import alasql from "alasql";
// import {cards as Images} from '../../public/assets/images/index.js';

export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: "Cards",
  components: {
    Swiper,
    SwiperSlide,
    FlipCard,
    Sidebar,
  },
  setup() {
    const {
      filters,
      filtersReset,
      filtersSetDeck,
      filtersGetParams,
      getCardBack,
      setCurrentCard,
    } = inject("filters");
    const { bus } = useEventBus();

    const swiperInstance = ref();
    function onSwiper(swiper) {
      swiperInstance.value = swiper;
    }

    watch(
      () => bus.value.get("goToSlide"),
      (dir) => {
        // console.debug("SliderCards->goToSlide!", swiperInstance, dir[0]);
        if (dir[0] == "next") {
          swiperInstance.value.slideNext();
        } else {
          swiperInstance.value.slidePrev();
        }
      }
    );

    // const listCards = ref([]);
    const state = reactive({
      // filters: ref(filters.value),
      listCards: computed(() => updateListCards()),
      // currentCard: 0,
    });
    const sound = new Audio(require("@/assets/sounds/flipcard.mp3"));
    const slideStartChange = () => {
      sound.play();
    };
    const slideChanged = (swiper) => {
      // state.currentCard.value = swiper.activeIndex;
      const ix = swiper.activeIndex;
      const slide = swiper.slides[ix];
      if (!slide) return;
      // const img = slide.querySelector("img");
      const img = slide
        .querySelector("div.card-inner")
        .classList.contains("flipme")
        ? slide.querySelector("img:nth-of-type(2)")
        : slide.querySelector("img:nth-of-type(1)");
      if (!img) return;
      // console.debug(
      //   "slideChanged!",
      //   slide.querySelector("div.card-inner").classList
      // );
      // debugger;
      const cardId = slide.querySelector("div.card cardId");
      console.debug("slideChanged! cardId", cardId);
      const src = img.getAttribute("src");
      const idcard = src.split("/").pop().split(".")[0];
      setCurrentCard(idcard);
      console.debug(
        "slideChanged!",
        swiper.activeIndex,
        img,
        idcard,
        swiper
        // state.currentCard.value
      );
    };
    // watchEffect(() => {
    //   if (swiper.value) {
    //     swiper.value.on("slideChange", () => {
    //       state.currentCard.value = swiper.value.activeIndex;
    //       console.debug("slideChange!", state.currentCard.value);
    //     });
    //   } else {
    //     // not mounted yet, or the element was unmounted (e.g. by v-if)
    //   }
    // });

    const updateListCards = () => {
      let wh = "";
      // let params = ["deck='bernal'"];
      // let params = [];
      let params = filtersGetParams();
      console.debug("listCards", filters.value, params);
      if (params.length > 0) {
        wh = "WHERE (" + params.join(") AND (") + ")";
      }
      // console.debug("listCards!", wh);
      // return cards;
      // wh = "WHERE (mass = 10)";
      let sql = `SELECT * FROM ? ${wh}`;
      // let sql = 'SELECT * FROM ? WHERE NOT spectral_type';
      // console.debug("getCards!", sql);
      const res = alasql(sql, [cards]);
      // console.log('getCards: ', res);
      return res;
    };

    return {
      router: useRouter(),
      modules: [Navigation, Pagination, Scrollbar],
      state,
      cards,
      onSwiper,
      slideChanged,
      slideStartChange,
      updateListCards,
      filters,
      filtersReset,
      filtersSetDeck,
      getCardBack,
    };
  },
};
</script>

<style scoped>
/* .my-swiper-pagination {
  font-size: 10px;
} */
.swiper {
  width: 100%;
  height: 100%;
  /* border: 1px solid red; */
  margin-top: 1rem;
}

.swiper-slide {
  text-align: center;
  font-size: 18px;
  background: #fff;

  /* Center slide text vertically */
  display: -webkit-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
  -webkit-box-pack: center;
  -ms-flex-pack: center;
  -webkit-justify-content: center;
  justify-content: center;
  -webkit-box-align: center;
  -ms-flex-align: center;
  -webkit-align-items: center;
  align-items: center;
}

.swiper-slide img {
  display: block;
  width: 100%;
  height: 100%;
  object-fit: cover;
}

/*
.swiper-slide:nth-child(1n) {
  background-color: rgb(206, 17, 17);
}

.swiper-slide:nth-child(2n) {
  background-color: rgb(0, 140, 255);
}

.swiper-slide:nth-child(3n) {
  background-color: rgb(10, 184, 111);
}

.swiper-slide:nth-child(4n) {
  background-color: rgb(211, 122, 7);
}

.swiper-slide:nth-child(5n) {
  background-color: rgb(118, 163, 12);
}

.swiper-slide:nth-child(6n) {
  background-color: rgb(180, 10, 47);
}

.swiper-slide:nth-child(7n) {
  background-color: rgb(35, 99, 19);
}

.swiper-slide:nth-child(8n) {
  background-color: rgb(0, 68, 255);
}

.swiper-slide:nth-child(9n) {
  background-color: rgb(218, 12, 218);
}

.swiper-slide:nth-child(10n) {
  background-color: rgb(54, 94, 77);
}
*/
</style>
