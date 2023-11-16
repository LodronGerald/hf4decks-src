<template>
  <div
    class="flex flex-row w-full mt-10 p-3 border-b border-gray-300"
    style="box-shadow: 0px 6px 2px rgb(0 0 0 / 25%)"
  >
    <div class="inline-block relative">
      Decks:
      <select
        v-model="state.deck"
        class="appearance-none bg-white border border-gray-500 hover:border-blue-500 px-4 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline"
        @change="applyFilterDecks"
      >
        <option value="any">All</option>
        <option value="bernal">Bernal</option>
        <option value="crew">Crew</option>
        <!-- <option value="colonist">Colonist</option> -->
        <option value="freighter">Freighter</option>
        <option value="generator">Generator</option>
        <option value="radiator">Radiator</option>
        <option value="reactor">Reactor</option>
        <option value="refinery">Refinery</option>
        <option value="robonaut">Robonaut</option>
        <option value="thruster">Thruster</option>
        <option value="gwthruster">GW/TW Thruster</option>
      </select>
      <div
        class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700"
      >
        <svg
          class="fill-current h-4 w-4"
          xmlns="http://www.w3.org/2000/svg"
          viewBox="0 0 20 20"
        >
          <path
            d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"
          />
        </svg>
      </div>
    </div>
    <div class="flex flex-1 justify-end">
      <!-- <div class="cursor-pointer" @click="reset">
        <svg
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
          stroke-width="1.5"
          stroke="currentColor"
          class="w-6 h-6 text-red-700"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M12 3c2.755 0 5.455.232 8.083.678.533.09.917.556.917 1.096v1.044a2.25 2.25 0 01-.659 1.591l-5.432 5.432a2.25 2.25 0 00-.659 1.591v2.927a2.25 2.25 0 01-1.244 2.013L9.75 21v-6.568a2.25 2.25 0 00-.659-1.591L3.659 7.409A2.25 2.25 0 013 5.818V4.774c0-.54.384-1.006.917-1.096A48.32 48.32 0 0112 3z"
          />
        </svg>
      </div> -->
      <div class="cursor-pointer" @click="$emit('activeFilters')">
        <svg
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
          stroke-width="1.5"
          stroke="currentColor"
          class="w-6 h-6 text-blue-700 fill-current"
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
</template>
  
<script>
// import { IonContent, IonPage } from "@ionic/vue";
import { watch, inject, reactive, ref } from "vue";
import { useRouter } from "vue-router";
// import {cards} from '../data/cards.json';
// import alasql from 'alasql';
// import {cards as Images} from '../../public/assets/images/index.js';

export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: "FilterDecks",
  components: {},
  emits: ["activeFilters"],

  setup() {
    const { filters, setFilters, filtersReset } = inject("filters");
    const router = useRouter();

    const state = reactive({
      deck: ref(filters.value.deck),
      // deck: computed(() => {
      //   return filters.value.deck;
      // }),
    });

    /**
     * Resetta lo stato al valore iniziale quando vengono resettati tutti i filtri
     */
    watch(filters, (newFilters) => {
      state.deck = newFilters.deck;
    });

    const sound = new Audio(require("@/assets/sounds/paper-away.mp3"));
    function applyFilterDecks() {
      sound.play();
      console.debug("applyFilterDecks!", state.deck);
      // filtersSetDeck(state.deck);
      // setFiltersDeck(state.deck);
      setFilters({ deck: state.deck });
      // ctx.emit("filtersApplied");
    }
    function reset() {
      filtersReset();
    }

    return {
      state,
      router,
      applyFilterDecks,
      reset,
      // filters,
      // filtersReset,
    };
  },
};
</script>
  
<style scoped>
</style>
  