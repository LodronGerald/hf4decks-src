<template>
  <div class="h-screen flex">
    <div class="card-container flex">
      <div class="card" v-if="cardFront != null" :cardId="state.cardId">
        <div
          class="card-inner flex items-center w-full"
          @click="rotateHorizontal"
          v-bind:class="{
            fronte: state.cardOne == 'fronte',
            flipme: state.cardOne == 'retro',
            dritto: state.cardOne == 'dritto',
            rovescia: state.cardVertical == 'rovescio',
          }"
        >
          <div class="card-face card-front">
            <img :src="require(`@/assets/images/cards/${cardFront.id}.jpg`)" />
          </div>
          <div class="card-face card-back" v-if="cardBack != null">
            <img :src="require(`@/assets/images/cards/${cardBack.id}.jpg`)" />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
  
  <script>
import { reactive, watch, inject } from "vue";
import { useRouter } from "vue-router";
import useEventBus from "@/utility/event-bus.js";

export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: "Card",
  components: {},
  props: { cardFront: null, cardBack: null },

  setup(props) {
    // console.log(props);
    // const { getCard } = inject("filters");
    const router = useRouter();
    const { bus } = useEventBus();
    const { filters, currentCard, setCurrentCard } = inject("filters");
    const state = reactive({
      cardVertical: "dritto",
      cardOne: "fronte",
      cardFront: props.cardFront,
      cardBack: props.cardBack,
      cardId: null,
      // cardId: props.cardFront.id,
      // cardId: filters.value.side == 1 ? props.cardBack.id : props.cardFront.id,
    });
    // const state.cardId = computed(() => {
    //   if (!state.cardFront) return "";
    //   return state.cardOne == "fronte" ? state.cardFront.id : state.cardBack.id;
    // });

    const sound = new Audio(require("@/assets/sounds/carddrop.mp3"));
    const rotateHorizontal = () => {
      // console.debug(
      //   "rotateHorizontal!",
      //   filters.value.side,
      //   state.cardId,
      //   currentCard.value,
      //   state.cardFront.id,
      //   state.cardBack.id
      // );
      if (state.cardFront.id.slice(0, -1) !== currentCard.value.slice(0, -1)) {
        return;
      }
      state.cardOne == "fronte"
        ? (state.cardOne = "retro")
        : (state.cardOne = "fronte");
      state.cardId =
        state.cardOne == "fronte" ? state.cardFront.id : state.cardBack.id;
      console.debug(
        "rotateHorizontal!",
        state.cardId,
        currentCard.value,
        state.cardFront.id,
        state.cardBack.id,
        state.cardOne,
        state.cardVertical
      );
      setCurrentCard(state.cardId);
      // console.debug("rotateHorizontal", sound);
      sound.play();
      // console.debug("rotateHorizontal", sound);
    };

    const rotateRadiator = () => {
      if (state.cardFront.id.slice(0, -1) !== currentCard.value.slice(0, -1)) {
        return;
      }
      state.cardVertical == "dritto"
        ? (state.cardVertical = "rovescio")
        : (state.cardVertical = "dritto");
      sound.play();
      console.debug(
        "rotateRadiator!",
        filters.value.side,
        state.cardId,
        currentCard.value,
        state.cardOne,
        state.cardVertical
      );
    };

    watch(
      () => bus.value.get("rotateRadiator"),
      () => {
        rotateRadiator();
        // console.debug("rotateRadiator", currentCard.value, props.cardFront.id);
        // if (currentCard.value == props.cardFront.id) {
        //   state.cardVertical == "dritto"
        //     ? (state.cardVertical = "rovescio")
        //     : (state.cardVertical = "dritto");
        //   sound.play();
        // }
      }
    );

    watch(
      () => bus.value.get("rotateHorizontal"),
      () => {
        rotateHorizontal();
      }
    );

    return {
      state,
      router,
      // cardId,
      rotateHorizontal,
      rotateRadiator,
      // rotateCard,
    };
  },
};
</script>
  
<style scoped>
.card-container {
  height: 416px;
}
.card {
  /* margin: 100px auto 0; */
  margin-top: 1px;
  width: 270px;
  height: 412px;
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
  cursor: pointer;
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

/* this style is applied when the card is clicked */
.card-back {
  transform: rotateY(180deg);
}
.flipme {
  transform: rotateY(180deg);
}
.rovescia {
  transform: rotateX(180deg) rotateY(180deg);
}
.rovescia.flipme {
  transform: rotateX(180deg) rotateY(360deg);
}
/* .card-inner.is-retro {
    transform: rotateY(180deg);
  } */
</style>
  