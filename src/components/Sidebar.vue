<template>
  <div
    class="toolbar flex flex-col h-48 bg-blue-500 text-white rounded-bl-xl items-center"
  >
    <div class="p-1 text-center">
      <div class="text-xs">Cards</div>
      <div class="my-swiper-pagination"></div>
    </div>
    <div
      class="flex flex-row bg-green-600 items-center"
      style="background-color: #2b8a3e"
    >
      <div
        class="m-0 p-1 border-r border-green-900 cursor-pointer"
        style="border-color: #37b24d"
        @click="goToSlide('prev')"
      >
        <svg
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
          stroke-width="2"
          stroke="currentColor"
          class="w-6 h-6 rotate-180"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M15.75 9V5.25A2.25 2.25 0 0013.5 3h-6a2.25 2.25 0 00-2.25 2.25v13.5A2.25 2.25 0 007.5 21h6a2.25 2.25 0 002.25-2.25V15m3 0l3-3m0 0l-3-3m3 3H9"
          />
        </svg>
      </div>
      <div class="m-0 p-1 cursor-pointer" @click="goToSlide('next')">
        <svg
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
          stroke-width="2"
          stroke="currentColor"
          class="w-6 h-6"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M15.75 9V5.25A2.25 2.25 0 0013.5 3h-6a2.25 2.25 0 00-2.25 2.25v13.5A2.25 2.25 0 007.5 21h6a2.25 2.25 0 002.25-2.25V15m3 0l3-3m0 0l-3-3m3 3H9"
          />
        </svg>
      </div>
    </div>
    <div
      class="m-0 p-2 cursor-pointer shadow-md w-full flex bg-orange-600 justify-center"
      style="background-color: #37b24d"
      @click="rotateHorizontal"
    >
      <!-- <svg
        fill="none"
        viewBox="0 0 24 24"
        stroke-width="0.7"
        stroke="currentColor"
        class="w-6 h-6"
      >
        <path
          d="M18 7C18.5523 7 19 7.44772 19 8V16C19 16.5523 18.5523 17 18 17H15V19H18C19.6569 19 21 17.6569 21 16V8C21 6.34315 19.6569 5 18 5H15V7H18Z"
          fill="currentColor"
          fill-opacity="0.5"
        />
        <path d="M13 3H11V21H13V3Z" fill="currentColor" />
        <path
          d="M5 8C5 7.44772 5.44772 7 6 7H9V5H6C4.34315 5 3 6.34315 3 8V16C3 17.6569 4.34315 19 6 19H9V17H6C5.44772 17 5 16.5523 5 16V8Z"
          fill="currentColor"
        />
      </svg> -->
      <svg
        height="24"
        viewBox="0 0 24 24"
        width="24"
        xmlns="http://www.w3.org/2000/svg"
        class="w-6 h-6 rotate-90"
      >
        <path
          d="m15.6893661 13.7425356.5-2c.1339487-.5357949-.191812-1.0787294-.7276069-1.2126781-.0793206-.0198302-.1607738-.0298575-.2425356-.0298575h-13.43844719c-.55228475 0-1 .4477153-1 1 0 .0817618.01002735.163215.0298575.2425356l.5 2c.11129175.445167.51127485.7574644.9701425.7574644h12.43844719c.4588676 0 .8588507-.3122974.9701425-.7574644zm-.1893661-5.2425356.5606576-1.68197288c.1746478-.52394332-.1085122-1.09026329-.6324555-1.26491107-.1023789-.03412629-.2096068-.05145569-.3175235-.0513167l-13.22209729.01713315c-.55228428.00071562-.99941904.44901061-.99870428 1.0012949 0 .10774719.01769263.21476369.05197848.31691043l.55814449 1.66286217m14-5 .3059335-1.83560101c.0907951-.54477032-.2772246-1.05999786-.8219949-1.15079291-.0543315-.00905524-.1093182-.01360608-.164399-.01360608h-12.63907918c-.55228475 0-1 .44771525-1 1 0 .05508086.00455084.11006756.01360608.16439899l.3059335 1.83560101"
          fill="none"
          stroke="currentColor"
          stroke-linecap="round"
          stroke-linejoin="round"
          stroke-width="1.5"
          transform="translate(2 3)"
        />
      </svg>
    </div>
    <div
      class="m-0 p-2 shadow-md w-full flex text-center justify-center"
      :class="{
        'radiator-rotate-active': rotateRadiatorEnabled,
        'bg-gray-300': !rotateRadiatorEnabled,
      }"
      @click="rotateRadiator"
    >
      <svg
        viewBox="0 0 24 24"
        width="24"
        height="24"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
      >
        <path
          d="M2 12C2 17.5249 6.47508 22 12 22L9.5 19"
          stroke="#fff"
          stroke-width="1.5"
          stroke-linecap="round"
          stroke-linejoin="round"
        />
        <path
          d="M22 12C22 6.47508 17.5249 2 12 2L14.5 5"
          stroke="#fff"
          stroke-width="1.5"
          stroke-linecap="round"
          stroke-linejoin="round"
        />
        <path
          d="M15 20.5L4 9.5L9.5 4L20.5 15L15 20.5Z"
          fill="none"
          stroke="#fff"
          stroke-width="1.5"
          stroke-linecap="round"
          stroke-linejoin="round"
        />
      </svg>
    </div>
    <!-- <div class="bg-gray-300 p-1"></div>
    <div class="bg-gray-300 p-1"></div> -->
    <!-- <div class="grow"></div> -->
  </div>
</template>
  
<script>
import { inject, computed } from "vue";
// import { useRouter } from "vue-router";
import useEventsBus from "@/utility/event-bus";

export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: "Sidebar",
  components: {},
  props: {
    // goToNextSlide: {
    //   type: Function,
    //   required: true,
    // },
  },

  setup(props) {
    console.debug("Sidebar setup", props.goToNextSlide);
    const { emit } = useEventsBus();
    const { currentCard } = inject("filters");
    const rotateRadiatorEnabled = computed(() => {
      if (!currentCard.value) return false;
      return currentCard.value.substring(0, 2) == "CD";
    });

    function goToSlide(dir) {
      console.debug("nextSlide!", dir);
      // if (props.goToNextSlide) {
      // props.goToNextSlide();
      // }
      emit("goToSlide", dir);
    }

    function rotateRadiator() {
      console.debug("rotateRadiator");
      if (rotateRadiatorEnabled.value) {
        emit("rotateRadiator");
      }
    }

    function rotateHorizontal() {
      console.debug("rotateHorizontal");
      emit("rotateHorizontal");
    }

    // const { goToPrevSlide, goToNextSlide } = inject(
    //   "goToPrevSlide",
    //   "goToNextSlide"
    // );
    // function goToNextSlide() {
    //   this.$emit("goToNextSlide");
    // }
    // const swiper = refs.swiper;

    // const prevSlide = () => {
    //   swiper.value.slidePrev();
    // };

    // const nextSlide = () => {
    //   swiper.value.slideNext();
    // };

    // watchEffect(() => {
    //   if (swiper.value) {
    //     swiper.value.update();
    //   }
    // });
    return {
      rotateRadiator,
      rotateRadiatorEnabled,
      rotateHorizontal,
      // goToPrevSlide,
      goToSlide,
    };
  },
};
</script>
  
<style scoped>
.toolbar {
  width: 4rem;
  box-shadow: 10px 10px 4px rgba(0, 0, 0, 0.25);
}
.my-swiper-pagination {
  font-size: 10px;
  color: white;
}
.radiator-rotate-active {
  background-color: #51cf66;
  cursor: pointer;
}
.radiator-rotate-inactive {
  background-color: #d3f9d8;
}
</style>
  