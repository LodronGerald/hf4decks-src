<template>
    <div class="flex">
      <label class="flex">Frutta:</label>
      <v-select class="flex-1"
        v-model="selectedFruits"
        :options="fruitOptions"
        label="name"
        multiple
        placeholder="Scegli una o più frutte"
        @input="updateSelectedFruits"
      />
    </div>
    <p>Frutti selezionati: {{ selectedFruits }}</p>
  </template>
  
  <script>
  import vSelect from 'vue-select';
  
  export default {
    components: {
      vSelect,
    },
    data() {
      return {
        selectedFruits: [],
        fruitOptions: [
          { id: 1, name: 'Mela' },
          { id: 2, name: 'Banana' },
          { id: 3, name: 'Arancia' },
          { id: 4, name: 'Kiwi' },
          { id: 5, name: 'Pesca' },
        ],
      };
    },
    methods: {
      updateSelectedFruits(selectedOptions) {
        this.selectedFruits = selectedOptions.map((option) => option.name);
      },
    },
  };
  </script>
  