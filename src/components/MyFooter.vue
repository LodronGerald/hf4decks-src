<template>
  <div
    class="fixed bottom-0 left-0 right-0 bg-blue-500 w-full p-1 text-white h-6 z-50"
  >
    <div class="version text-right">v.{{ version }} by {{ author }}</div>
  </div>
</template>
  
  <script>
// import { reactive } from "vue";
// import fs from "fs";
// let version;
// let author;
export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: "MyFooter",
  components: {},
  setup() {
    const version = "0.3 beta";
    const author = "Maurizio Amizzoni";
    // const state = reactive({
    //   title: "High Frontier 4 All - Decks Assistant",
    // });

    return { author, version };
  },
};
</script>
  
<style scoped>
.version {
  font-size: 10px;
  font-style: italic;
}
</style>
  