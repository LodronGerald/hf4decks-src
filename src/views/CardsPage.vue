<template>
  <ion-page>
    <ion-content>
      <div class="relative">
        <div
          class="m-0 h-12 bg-blue-500 w-full fixed top-0 left-0 right-0 z-50"
        >
          <div class="p-3 flex flex-row items-center text-white w-full">
            <div class="flex flex-1 font-bold self-center">Cards</div>
            <div
              class="flex flex-1 justify-end"
              @click="() => router.push('/filters')"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="w-6 h-6"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M12 3c2.755 0 5.455.232 8.083.678.533.09.917.556.917 1.096v1.044a2.25 2.25 0 01-.659 1.591l-5.432 5.432a2.25 2.25 0 00-.659 1.591v2.927a2.25 2.25 0 01-1.244 2.013L9.75 21v-6.568a2.25 2.25 0 00-.659-1.591L3.659 7.409A2.25 2.25 0 013 5.818V4.774c0-.54.384-1.006.917-1.096A48.32 48.32 0 0112 3z"
                />
              </svg>
            </div>
          </div>
        </div>

        <!-- body -->
        <div class="mt-12">
          <!-- component -->
          <!-- <section class="text-gray-600 body-font bg-[#F4F3FA] h-screen"> -->
          <div class="px-5 py-2 mx-auto">
            <div class="flex flex-wrap -m-4 text-center">
              <div
                class="p-4 sm:w-1/2 lg:w-1/3 w-full"
                v-for="card in listCards"
                :key="card.id"
              >
                <div
                  class="flex items-center justify-between p-1 border border-rose-400 rounded-lg bg-white shadow-indigo-50 shadow-md"
                >
                  <img
                    :src="require(`@/assets/images/cards/${card.id}.jpg`)"
                    style="width: 126px; cursor: pointer"
                    @click="() => router.push(`/card/${card.id}`)"
                  />
                  <div class="text-left flex-auto h-48 p-2 rounded-md">
                    <div class="flex">
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        fill="none"
                        viewBox="0 0 24 24"
                        stroke-width="1.5"
                        stroke="currentColor"
                        class="w-4 h-4 flex"
                      >
                        <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          d="M6.429 9.75L2.25 12l4.179 2.25m0-4.5l5.571 3 5.571-3m-11.142 0L2.25 7.5 12 2.25l9.75 5.25-4.179 2.25m0 0L21.75 12l-4.179 2.25m0 0l4.179 2.25L12 21.75 2.25 16.5l4.179-2.25m11.142 0l-5.571 3-5.571-3"
                        />
                      </svg>
                      <span class="flex ml-2 text-md font-bold text-green-500">
                        {{ card.deck }}
                      </span>
                    </div>
                    <div class="text-blue-700 font-bold pt-0 text-base">
                      {{ card.name }}
                    </div>
                    <div class="text-xs">
                      {{ card.mass }}M {{ card.spectral_type }}Sp
                      {{ card.rad_hard }}RH
                    </div>
                    <div class="text-sm font-semibold text-gray-400">
                      {{ card.type }}
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- </section> -->
        </div>
        <!-- ./body -->
      </div>
    </ion-content>
  </ion-page>
</template>

<script>
import {
  IonContent,
  // IonHeader,
  IonPage,
  // IonTitle,
  // IonToolbar,
} from "@ionic/vue";
import { inject, computed } from "vue";
import { useRouter } from "vue-router";
// import { cards } from "@/data/cards.json";
import cards from "../data/cards";
const alasql = require("alasql");
// import alasql from "alasql";
// import {cards as Images} from '../../public/assets/images/index.js';

export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: "Cards",
  components: {
    IonContent,
    // IonHeader,
    IonPage,
    // IonTitle,
    // IonToolbar,
  },
  data() {
    return {
      filterDeck: "",
    };
  },
  cards,

  setup() {
    const { filters, filtersReset, filtersSetDeck, filtersGetParams } =
      inject("filters");

    const getImgUrl = (id) => {
      // var images = require.context('../assets/images/crews', false, /\.jpg$/)
      // return images('./' + id + ".jpg")
      // return require('../assets/images/crews/'+id+'.jpg');
      // return Images[id];
      // return require(`@/assets/images/cards/${id}.jpg`);
      return require("@/assets/images/cards/" + id + ".jpg");
    };

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
      cards,
      listCards,
      getImgUrl,
      filters,
      filtersReset,
      filtersSetDeck,
    };
  },
};
</script>

<style scoped>
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
