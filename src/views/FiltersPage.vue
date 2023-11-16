<template>
  <ion-page>
    <ion-content>
      <div class="relative">
        <div
          class="m-0 h-12 bg-blue-500 w-full fixed top-0 left-0 right-0 z-50"
        >
          <div class="p-3 flex flex-row items-center text-white w-full">
            <div
              class="flex justify-start mr-1"
              @click="() => router.push('/cards')"
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
                  d="M15.75 19.5L8.25 12l7.5-7.5"
                />
              </svg>
            </div>
            <div class="flex flex-1 font-bold self-center">Filters</div>
          </div>
        </div>

        <!-- body -->
        <div class="mt-12 p-3">
          <!-- DECKS -->
          <div>
            <div class="inline-block relative">
              Deck:
              <select
                v-model="state.deck"
                class="appearance-none bg-white border border-gray-500 hover:border-blue-500 px-4 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline"
              >
                <option value="any">Any</option>
                <option value="crew">Crew</option>
                <!-- <option value="colonist">Colonist</option> -->
                <option value="bernal">Bernal</option>
                <option value="freighter">Freighter</option>
                <option value="generator">Generator</option>
                <option value="radiator">Radiator</option>
                <option value="reactor">Reactor</option>
                <option value="refinery">Refinery</option>
                <option value="robonaut">Robonaut</option>
                <option value="thruster">Thruster</option>
                <!-- <option value="gwthruster">GW Thruster</option> -->
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
            {{ deck }}
          </div>

          <!-- SPECTRAL TYPE -->
          <div>
            <div class="inline-block relative">
              Spectral type:
              <select
                v-model="state.spectral"
                class="appearance-none bg-white border border-gray-500 hover:border-blue-500 px-4 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline"
              >
                <option value="none">None</option>
                <option value="Any">Any</option>
                <option value="C">C</option>
                <option value="D">D</option>
                <option value="H">H</option>
                <option value="M">M</option>
                <option value="S">S</option>
                <option value="V">V</option>
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
          </div>

          <!-- MASS -->
          <div>
            <div class="inline-block relative">
              Mass:
              <select
                v-model="state.mass.op"
                class="appearance-none bg-white border border-gray-500 hover:border-blue-500 px-4 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline"
              >
                <option value="any">any</option>
                <option value=">">greater than</option>
                <option value="=">equal to</option>
                <option value="<">lesser than</option>
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
            <input
              v-model="state.mass.value"
              v-show="state.mass.op != 'any'"
              type="number"
              min="0"
              max="14"
              class="border border-gray-500 hover:border-blue-500 rounded shadow w-12 text-sm px-1"
            />
          </div>

          <div
            class="flex w-full items-center mt-10 border-t border-gray-400 pt-4"
          >
            <button
              class="flex-1 bg-slate-200 hover:bg-gray-100 text-gray-800 font-semibold py-2 px-4 border border-gray-900 rounded shadow mr-2"
              @click="() => router.push('/cards')"
            >
              Cancel
            </button>
            <button
              class="flex-1 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-700 rounded shadow"
              @click="apply()"
            >
              Apply filter
            </button>
          </div>
        </div>
      </div>
    </ion-content>
  </ion-page>
</template>

<script>
import { IonContent, IonPage } from "@ionic/vue";
import { inject, reactive } from "vue";
import { useRouter } from "vue-router";
// import {cards} from '../data/cards.json';
// import alasql from 'alasql';
// import {cards as Images} from '../../public/assets/images/index.js';

export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: "Filters",
  components: {
    IonContent,
    IonPage,
  },

  classesSelect:
    "block appearance-none w-full bg-white border border-blue-800 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline",

  setup() {
    const { filters, setFilters, filtersReset } = inject("filters");
    const router = useRouter();

    const state = reactive({
      deck: filters.deck,
      spectral: filters.spectral,
      mass: { op: "any", value: 0 },

      // double: computed(() => state.count * 2)
    });

    function apply() {
      // console.debug("applyFilters!", state);
      // filtersSetDeck(state.deck);
      setFilters(state);
      router.push("/cards");
    }

    return {
      state,
      router,
      apply,
      filters,
      filtersReset,
    };
  },

  methods: {},
};
</script>

<style scoped>
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
</style>
