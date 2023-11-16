<template>
  <div class="flex">
    <div class="">Label:</div>
    <Multiselect
      v-model="value"
      mode="tags"
      :close-on-select="false"
      :searchable="true"
      :create-option="true"
      :options="[
        { value: 'batman', label: 'Batman' },
        { value: 'robin', label: 'Robin' },
        { value: 'joker', label: 'Joker' },
      ]"
    />
  </div>
</template>

<script>
import Multiselect from "@vueform/multiselect";

export default {
  components: {
    Multiselect,
  },
  setup() {
    return {
      value: null,
      options: ["Batman", "Robin", "Joker"],
    };
  },
};
</script>

<style>
@import "@vueform/multiselect/themes/default.css";

/* Vedi https://github.com/vueform/multiselect#styling */
:root {
  --ms-font-size: 0.3rem;
  /* --ms-tag-bg: red; */
  /* --ms-tag-color: #d1fae5; */
  /* --ms-tag-radius: 9999px; */
  /* --ms-tag-font-weight: 400; */
}
</style>