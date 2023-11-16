<template>
  <swiper
    :effect="'cards'"
    :grabCursor="true"
    :modules="modules"
    class="mySwiper"
  >
    <!--
    TROPPE CARTE NON LE GESTISCE: forse può andare bene per le carte in mano
    <swiper-slide v-for="card in listCards" :key="card.id">
      <img
        :src="require(`@/assets/images/cards/${card.id}.jpg`)"
        style="width: 350px; cursor: pointer"
      />
    </swiper-slide>
-->
    <swiper-slide>
      <img
        :src="require(`@/assets/images/cards/CQ038F.jpg`)"
        style="width: 350px; cursor: pointer"
      />
    </swiper-slide>
    <swiper-slide>
      <img
        :src="require(`@/assets/images/cards/CQ039F.jpg`)"
        style="width: 350px; cursor: pointer"
      />
    </swiper-slide>
    <swiper-slide>
      <img
        :src="require(`@/assets/images/cards/CQ040F.jpg`)"
        style="width: 350px; cursor: pointer"
      />
    </swiper-slide>
    <swiper-slide>
      <img
        :src="require(`@/assets/images/cards/CQ041F.jpg`)"
        style="width: 350px; cursor: pointer"
      />
    </swiper-slide>
    <swiper-slide>
      <img
        :src="require(`@/assets/images/cards/CQ042F.jpg`)"
        style="width: 350px; cursor: pointer"
      />
    </swiper-slide>
    <swiper-slide>
      <img
        :src="require(`@/assets/images/cards/CQ043F.jpg`)"
        style="width: 350px; cursor: pointer"
      />
    </swiper-slide>
    <swiper-slide>Slide 7</swiper-slide>
    <swiper-slide>Slide 8</swiper-slide>
    <swiper-slide>Slide 9</swiper-slide>
  </swiper>
</template>
<script>
// Import Swiper Vue.js components
import { Swiper, SwiperSlide } from "swiper/vue";

// Import Swiper styles
import "swiper/css";

import "swiper/css/effect-cards";

// import required modules
import { EffectCards } from "swiper";
import { inject, computed } from "vue";
import { useRouter } from "vue-router";
import cards from "../data/cards";
const alasql = require("alasql");

export default {
  name: "SliderTest",
  components: {
    Swiper,
    SwiperSlide,
  },
  setup() {
    const {
      filters,
      filtersReset,
      filtersSetDeck,
      filtersGetParams,
      getCardBack,
    } = inject("filters");

    const listCards = computed(() => {
      // console.debug("listCards", cards, filters);
      let wh = "";
      // let params = ["deck='bernal'"];
      // let params = [];
      let params = filtersGetParams();
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
    });

    return {
      router: useRouter(),
      modules: [EffectCards],
      cards,
      listCards,
      filters,
      filtersReset,
      filtersSetDeck,
      getCardBack,
    };
  },
};
</script>

<style scoped>
.swiper {
  width: 280px;
  height: 420px;
}

.swiper-slide {
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 18px;
  font-size: 22px;
  font-weight: bold;
  color: #fff;
}

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
</style>