<template>
  <!-- <div class="relative">
        <div class="m-0 bg-blue-500 w-full fixed top-0 left-0 right-0 z-50">
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
      </div> -->
  <div
    class="fixed top-0 left-0 right-0 z-50 bg-blue-500 w-full p-2 text-white"
  >
    {{ state.title }}
  </div>
  <!-- <div
    class="flex flex-1 justify-end cursor-pointer"
    @click="() => router.push('/filters')"
  >
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
  </div> -->
</template>

<script>
import { reactive } from "vue";
export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: "MyHeader",
  components: {},
  setup() {
    const state = reactive({
      title: "High Frontier 4 All - Decks Assistant",
    });

    return {
      state,
    };
  },
};
</script>

<style scoped>
</style>
