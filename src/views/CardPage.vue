<template>
  <ion-page>
    <ion-content>
      <div class="relative">
        <div
          class="m-0 h-12 bg-blue-500 w-full fixed top-0 left-0 right-0 -z-50"
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
            <div class="flex flex-1 font-bold self-center">
              {{ state.cardTitle }}
            </div>
          </div>
        </div>

        <!-- body -->
        <div class="mt-12">
          <div class="card" v-if="state.cardFront != null">
            <div
              class="card-inner flex items-center w-full"
              @click="
                state.cardOne == 'start'
                  ? (state.cardOne = 'flipped')
                  : (state.cardOne = 'start')
              "
              v-bind:class="{ flipme: state.cardOne == 'flipped' }"
            >
              <div class="card-face card-front">
                <img
                  :src="
                    require(`@/assets/images/cards/${state.cardFront.id}.jpg`)
                  "
                  style="width: 350px; cursor: pointer"
                />
              </div>
              <div class="card-face card-back">
                <img
                  :src="
                    require(`@/assets/images/cards/${state.cardBack.id}.jpg`)
                  "
                  style="width: 350px; cursor: pointer"
                />
              </div>
            </div>
          </div>
        </div>
      </div>
    </ion-content>
  </ion-page>
</template>

<script>
import { IonContent, IonPage } from "@ionic/vue";
import { computed, inject, reactive } from "vue";
import { useRouter } from "vue-router";

export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: "Card",
  components: {
    IonContent,
    IonPage,
  },

  setup() {
    const { getCard } = inject("filters");
    const router = useRouter();
    // const cardInner = ref(null);
    // const idcard = router.currentRoute.value.params?.id;
    // console.debug("CardPage", router);
    const state = reactive({
      cardOne: "start",
      cardTitle: computed(() => {
        if (!state.cardFront) return "";
        return state.cardOne == "start"
          ? state.cardFront.name
          : state.cardBack.name;
      }),
      cardFront: computed(() => getCard(router.currentRoute.value.params?.id)),
      cardBack: computed(() => {
        const idCardFront = router.currentRoute.value.params?.id;
        const idCardBack =
          idCardFront.slice(-1) === "F"
            ? idCardFront.slice(0, -1) + "R"
            : idCardFront.slice(0, -1) + "F";
        return getCard(idCardBack);
      }),
    });

    return {
      state,
      router,
    };
  },
};
</script>

<style scoped>
.card {
  /* margin: 100px auto 0; */
  margin-top: 10px;
  width: 400px;
  height: 600px;
  perspective: 1000px;
  /* align-content: center; */
}

.card-inner {
  width: 100%;
  height: 100%;
  transition: transform 1s;
  transform-style: preserve-3d;
  cursor: pointer;
  position: relative;
  /* align-content: center; */
}

.card-face {
  position: absolute;
  width: 100%;
  height: 100%;
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
  overflow: hidden;
  border-radius: 16px;
  box-shadow: 0px 3px 18px 3px rgba(0, 0, 0, 0.2);
}

.card-front {
  /* background: blue; */
  /* background-image: linear-gradient(
    to bottom right,
    var(--primary),
    var(--secondary)
  );
  display: flex;
  align-items: center;
  justify-content: center; */
}

.card-back {
  /* background-color: var(--light); */
  /* background: red; */
  transform: rotateY(180deg);
}

/* this style is applied when the card is clicked */
.flipme {
  transform: rotateY(180deg);
}
/* .card-inner.is-flipped {
  transform: rotateY(180deg);
} */
</style>
