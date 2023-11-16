<template>
  <div class="p-3 pt-2 container">
    <!-- NAME -->
    <div class="inline-block relative mb-2">
      Name:
      <input
        v-model="state.name.param"
        @change="changeName"
        type="text"
        class="border border-gray-500 hover:border-blue-500 rounded shadow w-48 text-md px-1"
      />
    </div>

    <!-- SIDE -->
    <div v-if="state.side.enabled">
      <div class="inline-block relative mb-2">
        Side:
        <select
          v-model="state.side.param"
          @change="changeSide"
          class="appearance-none bg-white border border-gray-500 hover:border-blue-500 px-4 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline"
        >
          <option v-for="item in sides" :key="item.value" :value="item.value">
            {{ item.label }}
          </option>
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

    <!-- REACTOR/GENERATOR TYPE -->
    <div v-if="state.type.enabled">
      <div class="inline-block relative mb-2">
        Type:
        <select
          v-model="state.type.param"
          @change="changeType"
          class="appearance-none bg-white border border-gray-500 hover:border-blue-500 px-4 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline"
        >
          <option v-for="item in types" :key="item.value" :value="item.value">
            {{ item.label }}
          </option>
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

    <!-- SPECTRAL TYPE -->
    <div v-if="state.spectral.enabled">
      <div class="inline-block relative mb-2">
        Spectral type:
        <select
          v-model="state.spectral.param"
          @change="changeSpectral"
          class="appearance-none bg-white border border-gray-500 hover:border-blue-500 px-4 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline"
        >
          <option value="none">None</option>
          <option value="all">All</option>
          <option value="any">Any</option>
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
      <div class="inline-block relative mb-2">
        Mass:
        <select
          v-model="state.mass.param.op"
          @change="changeMassOp"
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
      <select
        v-model="state.mass.param.value"
        v-show="state.mass.param.op != 'any'"
        @change="changeMassValue"
        class="appearance-none bg-white border border-gray-500 hover:border-blue-500 px-4 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline"
      >
        <option
          v-for="item in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]"
          :key="item"
          :value="item"
        >
          {{ item }}
        </option>
      </select>
    </div>

    <!-- RADHARD -->
    <div>
      <div class="inline-block relative mb-2">
        Rad-Hard:
        <select
          v-model="state.radhard.param.op"
          @change="changeRadhardOp"
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
      <select
        v-model="state.radhard.param.value"
        v-show="state.radhard.param.op != 'any'"
        @change="changeRadhardValue"
        class="appearance-none bg-white border border-gray-500 hover:border-blue-500 px-4 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline"
      >
        <option
          v-for="item in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]"
          :key="item"
          :value="item"
        >
          {{ item }}
        </option>
      </select>
    </div>

    <div class="border-t border-b border-gray-500">
      <!-- THRUST -->
      <div v-if="state.thrust.enabled">
        <div class="inline-block relative mb-2">
          Thrust:
          <select
            v-model="state.thrust.param.op"
            @change="changeThrustOp"
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
        <select
          v-model="state.thrust.param.value"
          v-show="state.thrust.param.op != 'any'"
          @change="changeThrustValue"
          class="appearance-none bg-white border border-gray-500 hover:border-blue-500 px-4 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline"
        >
          <option
            v-for="item in [
              0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
            ]"
            :key="item"
            :value="item"
          >
            {{ item }}
          </option>
        </select>
      </div>

      <!-- CONSUMPTION -->
      <div v-if="state.consumption.enabled">
        <div class="inline-block relative mb-2">
          Consumption:
          <select
            v-model="state.fuel.param.type"
            @change="changeFuelType"
            class="appearance-none bg-white border border-gray-500 hover:border-blue-500 px-4 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline"
          >
            <option value="any">any</option>
            <option value="water">Water</option>
            <option value="dirt">Dirt</option>
            <option value="isotope">Isotope</option>
          </select>
          <select
            v-model="state.consumption.param.op"
            @change="changeConsumptionOp"
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
        <select
          v-model="state.consumption.param.value"
          v-show="state.consumption.param.op != 'any'"
          @change="changeConsumptionValue"
          class="appearance-none bg-white border border-gray-500 hover:border-blue-500 px-4 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline"
        >
          <option
            v-for="item in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]"
            :key="item"
            :value="item"
          >
            {{ item }}
          </option>
        </select>
      </div>

      <!-- MODIFIERS -->
      <div v-if="state.modifiers.enabled">
        <div class="relative mb-2 flex">
          <label class="mr-1">Modifiers:</label>
          <Multiselect
            v-model="state.modifiers.param.values"
            mode="tags"
            :close-on-select="false"
            :searchable="true"
            :create-option="true"
            :options="[
              { value: 'afterburn', label: 'afterburn' },
              { value: 'ballerina', label: 'ballerina' },
              { value: 'pacman', label: 'pacman' },
              { value: 'powersat', label: 'powersat' },
              { value: 'push', label: 'push' },
              { value: 'solar', label: 'solar' },
              { value: '+thrust', label: '+thrust' },
              { value: '-consumption', label: '-consumption' },
            ]"
            @change="changeModifiersValues"
          />
        </div>
      </div>
    </div>

    <!-- ROBONAUT -->
    <div v-if="state.robonaut.enabled">
      <div class="inline-block relative mb-2">
        Robonaut:
        <select
          v-model="state.robonaut.param.type"
          @change="changeRobonautType"
          class="appearance-none bg-white border border-gray-500 hover:border-blue-500 px-4 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline"
        >
          <option value="any">any</option>
          <option value="missile">Missile</option>
          <option value="buggy">Buggy</option>
          <option value="raygun">Raygun</option>
        </select>
        <select
          v-model="state.robonaut.param.op"
          @change="changeRobonautOp"
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
      <select
        v-model="state.robonaut.param.value"
        v-show="state.robonaut.param.op != 'any'"
        @change="changeRobonautValue"
        class="appearance-none bg-white border border-gray-500 hover:border-blue-500 px-4 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline"
      >
        <option v-for="item in [0, 1, 2, 3, 4]" :key="item" :value="item">
          {{ item }}
        </option>
      </select>
    </div>

    <!-- RADIATOR THERMS -->
    <div v-if="state.therms.enabled">
      <div class="inline-block relative mb-2">
        Therms:
        <select
          v-model="state.therms.param.op"
          @change="changeThermsOp"
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
        <select
          v-model="state.therms.param.value"
          v-show="state.therms.param.op != 'any'"
          @change="changeThermsValue"
          class="appearance-none bg-white border border-gray-500 hover:border-blue-500 px-4 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline"
        >
          <option v-for="item in [1, 2, 3, 4, 5, 6]" :key="item" :value="item">
            {{ item }}
          </option>
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

    <!-- SUPPORT REQUIRED -->
    <div>
      <div class="inline-block relative mb-2">
        Support Required:
        <select
          v-model="state.required.param.op"
          @change="changeRequiredOp"
          class="appearance-none bg-white border border-gray-500 hover:border-blue-500 px-4 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline"
        >
          <option value="any">any</option>
          <option value="none">none</option>
          <option value="generator">generator</option>
          <option value="therms">radiator</option>
          <option value="reactor">reactor</option>
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
      <select
        v-model="state.required.param.value"
        v-show="!['any', 'none'].includes(state.required.param.op)"
        @change="changeRequiredValue"
        class="appearance-none bg-white border border-gray-500 hover:border-blue-500 px-4 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline"
      >
        <option
          v-for="item in requiredTypes"
          :key="item.value"
          :value="item.value"
        >
          {{ item.label }}
        </option>
      </select>
    </div>

    <!-- BUTTONS -->
    <div class="flex w-full items-center mt-10 border-t border-gray-400 pt-4">
      <button
        class="flex-1 bg-slate-200 hover:bg-gray-100 text-gray-800 font-semibold py-2 px-4 border border-gray-900 rounded shadow mr-2"
        @click="$emit('activeSlider')"
      >
        Cancel
      </button>
      <button
        class="flex-1 bg-yellow-500 hover:bg-yellow-700 text-white font-bold py-2 px-4 border border-yellow-700 rounded shadow mr-2"
        @click="reset()"
      >
        Reset filters
      </button>
      <button
        class="flex-1 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-700 rounded shadow"
        @click="apply()"
      >
        Apply filters
      </button>
    </div>
  </div>
</template>

<script>
// import { IonContent, IonPage } from "@ionic/vue";
import { inject, reactive, watch, computed } from "vue";
import Multiselect from "@vueform/multiselect";
// import vSelect from 'vue-select';
import { useRouter } from "vue-router";
import constants from "@/data/constants.js";
// import {cards} from '../data/cards.json';
// import alasql from 'alasql';
// import {cards as Images} from '../../public/assets/images/index.js';
// import 'vue-select/dist/vue-select.css';

// const controlsAll = ["spectral", "mass", "radhard"];

export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: "Filters",
  // components: {vSelect},
  components: { Multiselect },
  emits: ["activeSlider"],

  classesSelect:
    "block appearance-none w-full bg-white border border-blue-800 hover:border-gray-500 px-4 py-2 pr-8 rounded shadow leading-tight focus:outline-none focus:shadow-outline",

  setup(props, ctx) {
    const { filters, setFilters, filtersReset } = inject("filters");
    const router = useRouter();

    const sides = [
      { value: "any", label: "Any" },
      { value: 0, label: "Front" },
      { value: 1, label: "Back" },
    ];

    const reactorTypes = [
      { value: "all", label: "All" },
      { value: "B", label: "Burst plasma" },
      { value: "O", label: "Stationary" },
      { value: "X", label: "eXotic" },
    ];

    const generatorTypes = [
      { value: "all", label: "All" },
      { value: "E", label: "Electric" },
      { value: "P", label: "Pulsed" },
    ];

    // const robonautTypes = [
    //   { value: "all", label: "All" },
    //   { value: "missile", label: "Missile" },
    //   { value: "buggy", label: "Buggy" },
    //   { value: "raygun", label: "Raygun" },
    // ];

    // const types = computed(() => {
    //   const deck = ref(filters.value.deck);
    //   if (deck == "reactor") return reactorTypes;
    //   else if (deck == "generator") return generatorTypes;
    //   else return [];
    // });
    const types = computed(() => {
      if (filters.value.deck === "reactor") {
        return reactorTypes;
      } else if (filters.value.deck === "generator") {
        return generatorTypes;
        // } else if (filters.value.deck === "robonaut") {
        //   return robonautTypes;
      }
      return [];
    });

    const requiredTypes = computed(() => {
      switch (filters.value.required.op) {
        case "generator":
          return generatorTypes;
        case "reactor":
          return reactorTypes;
        case "therms":
          return [
            { value: 1, label: 1 },
            { value: 2, label: 2 },
            { value: 3, label: 3 },
            { value: 4, label: 4 },
            { value: 5, label: 5 },
          ];
        default:
          return [];
      }
    });

    // const filtersLocale = ref(filters.value);
    const state = reactive({
      // deck: { param: filters.value.deck },
      name: { param: constants.filtersBase.name, enabled: true },
      side: { param: constants.filtersBase.side, enabled: true },
      type: { param: constants.filtersBase.type, enabled: true },
      spectral: { param: constants.filtersBase.spectral, enabled: true },
      mass: { param: constants.filtersBase.mass, enabled: true },
      radhard: { param: constants.filtersBase.radhard, enabled: true },
      therms: { param: constants.filtersBase.therms, enabled: true },
      thrust: { param: constants.filtersBase.thrust, enabled: true },
      fuel: { param: constants.filtersBase.fuel, enabled: true },
      // consumption: { param: filters.value.consumption, enabled: true },
      // consumption: { param: { op: "any", value: 0 }, enabled: true },
      consumption: { param: constants.filtersBase.consumption, enabled: true },
      modifiers: { param: constants.filtersBase.modifiers, enabled: true },
      robonaut: { param: constants.filtersBase.robonaut, enabled: true },
      required: { param: constants.filtersBase.required, enabled: true },
    });

    function resetName(enable) {
      state.name.param = "";
      if (enable != undefined) state.name.enabled = enable;
    }

    function resetSide(enable) {
      state.side.param = 0;
      if (enable != undefined) state.side.enabled = enable;
    }

    function resetType(enable) {
      state.type.param = "all";
      if (enable != undefined) state.type.enabled = enable;
    }

    function resetTherms(enable) {
      // state.therms.param.op = constants.filtersBase.therms.op;
      // state.therms.param.value = constants.filtersBase.therms.value;
      state.therms.param.op = "any";
      state.therms.param.value = 0;
      if (enable != undefined) state.therms.enabled = enable;
    }

    function resetSpectral(enable) {
      state.spectral.param = "all";
      if (enable != undefined) state.spectral.enabled = enable;
    }

    function resetMass(enable) {
      // state.mass.param.op = constants.filtersBase.mass.op;
      // state.mass.param.value = constants.filtersBase.mass.value;
      state.mass.param.op = "any";
      state.mass.param.value = 0;
      if (enable != undefined) state.mass.enabled = enable;
    }

    function resetRadhard(enable) {
      // state.radhard.param.op = constants.filtersBase.radhard.op;
      // state.radhard.param.value = constants.filtersBase.radhard.value;
      state.radhard.param.op = "any"; // funziona
      state.radhard.param.value = 0; // funziona
      if (enable != undefined) state.radhard.enabled = enable;
    }

    function resetRequired(enable) {
      // state.required.param.op = constants.filtersBase.required.op;
      // state.required.param.value = constants.filtersBase.required.value;
      state.required.param.op = "any";
      state.required.param.value = 0;
      if (enable != undefined) state.required.enabled = enable;
    }

    function resetThrust(enable) {
      // state.thrust.param.op = constants.filtersBase.thrust.op;
      // state.thrust.param.value = constants.filtersBase.thrust.value;
      state.thrust.param.op = "any";
      state.thrust.param.value = 0;
      if (enable != undefined) state.thrust.enabled = enable;
    }

    function resetFuel(enable) {
      // state.fuel.param.type = constants.filtersBase.fuel.type;
      state.fuel.param.type = "any";
      if (enable != undefined) state.thrust.enabled = enable;
    }

    function resetConsumption(enable) {
      // state.consumption.param.op = constants.filtersBase.consumption.op;
      // state.consumption.param.value = constants.filtersBase.consumption.value;
      state.consumption.param.op = "any";
      state.consumption.param.value = 0;
      if (enable != undefined) state.consumption.enabled = enable;
    }

    function resetModifiers(enable) {
      // state.modifiers.param.values = constants.filtersBase.modifiers.values;
      state.modifiers.param.values = [];
      if (enable != undefined) state.modifiers.enabled = enable;
    }

    function resetRobonaut(enable) {
      // state.robonaut.param.type = constants.filtersBase.robonaut.type;
      // state.robonaut.param.op = constants.filtersBase.robonaut.op;
      // state.robonaut.param.value = constants.filtersBase.robonaut.value;
      state.robonaut.param.type = "any";
      state.robonaut.param.op = "any";
      state.robonaut.param.value = 0;
      if (enable != undefined) state.robonaut.enabled = enable;
    }

    function reset() {
      // console.debug("filtersBase!", constants.filtersBase);
      console.debug("reset!", state);
      resetName();
      resetSide();
      resetType();
      resetTherms();
      resetSpectral();
      resetMass();
      resetRadhard();
      resetRequired();
      resetThrust();
      resetFuel();
      resetConsumption();
      resetModifiers();
      resetRobonaut();
      console.debug("reset filters!", state);
      filtersReset();
      // ctx.emit("activeSlider");
    }

    function changeName(event) {
      state.name.param = event.target.value;
      // console.debug("changeType!", state);
    }

    function changeSide(event) {
      state.side.param = event.target.value;
      // console.debug("changeType!", state);
    }

    function changeType(event) {
      state.type.param = event.target.value;
      // console.debug("changeType!", state);
    }

    function changeSpectral(event) {
      state.spectral.param = event.target.value;
      console.debug("changeSpectral!", state);
    }

    function changeMassOp(event) {
      state.mass.param.op = event.target.value;
      // console.debug("changeSpectral!", state);
    }

    function changeMassValue(event) {
      state.mass.param.value = event.target.value;
    }

    function changeRadhardOp(event) {
      state.radhard.param.op = event.target.value;
      // console.debug("changeSpectral!", state);
    }
    function changeRadhardValue(event) {
      state.radhard.param.value = event.target.value;
    }

    function changeThermsOp(event) {
      state.therms.param.op = event.target.value;
      // console.debug("changeType!", state);
    }
    function changeThermsValue(event) {
      state.therms.param.value = event.target.value;
      // console.debug("changeType!", state);
    }

    function changeRequiredOp(event) {
      state.required.param.op = event.target.value;
      // console.debug("changeType!", state);
    }
    function changeRequiredValue(event) {
      state.required.param.value = event.target.value;
      // console.debug("changeType!", state);
    }

    function changeThrustOp(event) {
      state.thrust.param.op = event.target.value;
    }
    function changeThrustValue(event) {
      state.thrust.param.value = event.target.value;
    }
    function changeFuelType(event) {
      state.fuel.param.type = event.target.value;
    }
    function changeConsumptionOp(event) {
      state.consumption.param.op = event.target.value;
    }
    function changeConsumptionValue(event) {
      state.consumption.param.value = event.target.value;
    }
    function changeRobonautType(event) {
      state.robonaut.param.type = event.target.value;
    }
    function changeRobonautOp(event) {
      state.robonaut.param.op = event.target.value;
    }
    function changeRobonautValue(event) {
      state.robonaut.param.value = event.target.value;
    }
    function changeModifiersValues(values) {
      state.modifiers.param.value = values;
      console.debug(
        "changeModifiersValues!",
        values,
        state.modifiers.param.value
      );
    }

    watch(
      () => filters.value.deck,
      (deck) => {
        // Imposta i controlli da abilitare/disabilitare
        console.debug("watch!", deck, constants.filtersBase);
        // Prima disattiva tutti i controlli
        for (let key in state) {
          // if (["name", "side", "type", "spectral"].includes(key)) continue;
          // state[key].enabled = true;
          let command = `reset${
            key.charAt(0).toUpperCase() + key.slice(1)
          }(false)`;
          console.debug("disattiva ", key, command);
          eval(command);
        }
        // Poi riattiva i filtri compatibili con il deck selezionato
        resetName(true);
        resetSide(true);
        if (["any"].includes(deck)) {
          resetMass(true);
          resetRadhard(true);
          resetRequired(true);
        }
        if (["generator", "reactor"].includes(deck)) {
          resetType(true);
        }
        if (["radiator"].includes(deck)) {
          resetTherms(true);
        }
        if (
          [
            "freighter",
            "generator",
            "radiator",
            "reactor",
            "refinery",
            "robonaut",
            "thruster",
            "gwthruster",
          ].includes(deck)
        ) {
          resetSpectral(true);
        }
        if (
          [
            "bernal",
            "crew",
            "freighter",
            "generator",
            "radiator",
            "reactor",
            "refinery",
            "robonaut",
            "thruster",
            "gwthruster",
          ].includes(deck)
        ) {
          resetMass(true);
        }
        if (
          [
            "bernal",
            "crew",
            "freighter",
            "generator",
            "radiator",
            "reactor",
            "refinery",
            "robonaut",
            "thruster",
            "gwthruster",
          ].includes(deck)
        ) {
          resetRadhard(true);
        }
        if (
          [
            "bernal",
            "freighter",
            "generator",
            "radiator",
            "reactor",
            "refinery",
            "robonaut",
            "thruster",
            "gwthruster",
          ].includes(deck)
        ) {
          resetRequired(true);
        }
        if (
          ["bernal", "crew", "robonaut", "thruster", "gwthruster"].includes(
            deck
          )
        ) {
          resetThrust(true);
        }
        if (
          ["bernal", "crew", "robonaut", "thruster", "gwthruster"].includes(
            deck
          )
        ) {
          resetFuel(true);
        }
        if (
          ["bernal", "crew", "robonaut", "thruster", "gwthruster"].includes(
            deck
          )
        ) {
          resetConsumption(true);
        }
        if (
          [
            "bernal",
            "crew",
            "freighter",
            "generator",
            "reactor",
            "robonaut",
            "thruster",
            "gwthruster",
          ].includes(deck)
        ) {
          resetModifiers(true);
        }
        if (["crew", "robonaut"].includes(deck)) {
          resetRobonaut(true);
        }
        /*
        // Prima riattiva tutti i controlli
        for (let key in state) {
          // console.debug("for!", state);
          state[key].enabled = true;
        }
        // Poi resetta e disattiva quelli non compatibili con il deck selezionato
        switch (deck) {
          case "bernal":
            // state.therms = {
            //   param: constants.filtersBase.therms,
            //   enabled: false,
            // };
            resetTherms(false);
            state.type = { param: constants.filtersBase.type, enabled: false };
            state.spectral = {
              param: constants.filtersBase.spectral,
              enabled: false,
            };
            state.robonaut = {
              param: constants.filtersBase.robonaut,
              enabled: false,
            };
            break;
          case "crew":
            state.therms = {
              param: constants.filtersBase.therms,
              enabled: false,
            };
            state.type = { param: constants.filtersBase.type, enabled: false };
            state.spectral = {
              param: constants.filtersBase.spectral,
              enabled: false,
            };
            state.required = {
              param: constants.filtersBase.required,
              enabled: false,
            };
            break;
          case "freighter":
            state.thrust = {
              param: constants.filtersBase.thrust,
              enabled: false,
            };
            state.fuel = { param: constants.filtersBase.fuel, enabled: false };
            state.consumption = {
              param: constants.filtersBase.consumption,
              enabled: false,
            };
            state.therms = {
              param: constants.filtersBase.therms,
              enabled: false,
            };
            state.type = { param: constants.filtersBase.type, enabled: false };
            state.required = {
              param: constants.filtersBase.required,
              enabled: false,
            };
            state.robonaut = {
              param: constants.filtersBase.robonaut,
              enabled: false,
            };
            break;
          case "generator":
            state.thrust = {
              param: constants.filtersBase.thrust,
              enabled: false,
            };
            state.fuel = { param: constants.filtersBase.fuel, enabled: false };
            state.consumption = {
              param: constants.filtersBase.consumption,
              enabled: false,
            };
            state.therms = {
              param: constants.filtersBase.therms,
              enabled: false,
            };
            state.robonaut = {
              param: constants.filtersBase.robonaut,
              enabled: false,
            };
            break;
          case "radiator":
            state.thrust = {
              param: constants.filtersBase.thrust,
              enabled: false,
            };
            state.fuel = { param: constants.filtersBase.fuel, enabled: false };
            state.consumption = {
              param: constants.filtersBase.consumption,
              enabled: false,
            };
            state.type = { param: constants.filtersBase.type, enabled: false };
            state.robonaut = {
              param: constants.filtersBase.robonaut,
              enabled: false,
            };
            break;
          case "reactor":
            state.therms = {
              param: constants.filtersBase.therms,
              enabled: false,
            };
            state.robonaut = {
              param: constants.filtersBase.robonaut,
              enabled: false,
            };
            break;
          case "refinery":
            state.thrust = {
              param: constants.filtersBase.thrust,
              enabled: false,
            };
            state.fuel = { param: constants.filtersBase.fuel, enabled: false };
            state.consumption = {
              param: constants.filtersBase.consumption,
              enabled: false,
            };
            state.therms = {
              param: constants.filtersBase.therms,
              enabled: false,
            };
            state.type = { param: constants.filtersBase.type, enabled: false };
            state.robonaut = {
              param: constants.filtersBase.robonaut,
              enabled: false,
            };
            break;
          case "robonaut":
            state.therms = {
              param: constants.filtersBase.therms,
              enabled: false,
            };
            state.type = { param: constants.filtersBase.type, enabled: false };
            break;
          case "thruster":
            state.therms = {
              param: constants.filtersBase.therms,
              enabled: false,
            };
            state.type = { param: constants.filtersBase.type, enabled: false };
            state.robonaut = {
              param: constants.filtersBase.robonaut,
              enabled: false,
            };
            break;
          case "gwthruster":
            state.therms = {
              param: constants.filtersBase.therms,
              enabled: false,
            };
            state.type = { param: constants.filtersBase.type, enabled: false };
            state.robonaut = {
              param: constants.filtersBase.robonaut,
              enabled: false,
            };
            break;
          default:
            state.therms = {
              param: constants.filtersBase.therms,
              enabled: false,
            };
            state.type = { param: constants.filtersBase.type, enabled: false };
            break;
        }
        // console.debug("watch 2!", state);
*/
      }
    );

    const sound = new Audio(require("@/assets/sounds/paper-away.mp3"));
    function apply() {
      sound.play();
      let filtersValues = {};
      for (let key of Object.keys(state)) {
        filtersValues[key] = state[key].param;
      }
      console.debug("apply!", filtersValues);
      setFilters(filtersValues);
      ctx.emit("activeSlider");
      // ctx.emit("filtersApplied");
    }

    return {
      state,
      router,
      apply,
      reset,
      resetTherms,
      resetMass,
      resetRadhard,
      reactorTypes,
      generatorTypes,
      types,
      requiredTypes,
      sides,
      changeName,
      changeSide,
      changeType,
      changeThermsOp,
      changeThermsValue,
      changeSpectral,
      changeMassOp,
      changeMassValue,
      changeRadhardOp,
      changeRadhardValue,
      changeRequiredOp,
      changeRequiredValue,
      changeThrustOp,
      changeThrustValue,
      changeFuelType,
      changeConsumptionOp,
      changeConsumptionValue,
      changeModifiersValues,
      changeRobonautType,
      changeRobonautOp,
      changeRobonautValue,
    };
  },
};
</script>

<style scoped>
@import "@vueform/multiselect/themes/default.css";
/* Vedi https://github.com/vueform/multiselect#styling */
:root {
  --ms-font-size: 0.3rem;
  /* --ms-tag-bg: red; */
  /* --ms-tag-color: #d1fae5; */
  /* --ms-tag-radius: 9999px; */
  /* --ms-tag-font-weight: 400; */
}

.container {
  overflow-y: auto;
  margin-bottom: 0.7rem;
}

.vs__selected {
  font-size: 10px;
}

.style-chooser .vs__search::placeholder,
.style-chooser .vs__dropdown-toggle,
.style-chooser .vs__dropdown-menu {
  background: #dfe5fb;
  border: none;
  color: #394066;
  text-transform: lowercase;
  font-variant: small-caps;
}

.style-chooser .vs__clear,
.style-chooser .vs__open-indicator {
  fill: #394066;
}
</style>
