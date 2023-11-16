<template>
  <ion-app>
    <ion-router-outlet />
  </ion-app>
</template>

<script>
import { IonApp, IonRouterOutlet } from "@ionic/vue";
import { provide, ref } from "vue";
// import { cards } from "@/data/cards.json";
import cards from "@/data/cards.js";
import constants from "@/data/constants.js";
const alasql = require("alasql");
// console.debug("App!", alasql);
// const cards = require("@/data/cards.js");
// const location = ref('North Pole');
// function updateLocation(value) {
//   location.value = value == 'North Pole' ? 'South Pole':'North Pole';
// }
// provide('location', {
//   location,
//   updateLocation
// })

export default {
  components: {
    IonApp,
    IonRouterOutlet,
  },

  setup() {
    const filters = ref(constants.filtersBase);
    const currentCard = ref(null);
    console.debug("App!", filters);

    const filtersReset = () => {
      // console.debug("filtersReset!");
      filters.value = constants.filtersBase;
    };

    const setCurrentCard = (card) => {
      currentCard.value = card;
      console.info("setCurrentCard", card);
    };

    const setFilters = (flt) => {
      // console.debug("setFilters!", filters..deck, flt, {
      //   ...filters.,
      //   ...flt,
      // });
      filters.value = {
        ...filters.value,
        ...flt,
      };
      console.debug("setFilters!", filters.value);
    };

    const setFiltersDeck = (deckValue) => {
      // filters. = { ...toRefs(filters), obj };
      // console.debug("setFiltersDeck", obj, filters.);
      // filters. = { ...filters., ...{ obj } };
      filters.value.deck = deckValue;
      // console.debug("setFiltersDeck", obj, filters.);
    };

    // const filtersSetDeck = (deck) => {
    //   console.debug("filtersSetDeck", filters., deck);
    //   filters..deck = deck;
    // };

    const filtersGetParams = () => {
      console.debug("filtersGetParams!", filters.value);
      let params = [];
      if (filters.value.deck !== undefined && filters.value.deck !== "any") {
        params.push(`deck='${filters.value.deck}'`);
      }
      if (filters.value.name) {
        params.push(`name LIKE '%${filters.value.name}%'`);
      }
      if (filters.value.type !== undefined && filters.value.type !== "all") {
        params.push(`type LIKE '%${filters.value.type}%'`);
      }
      if (filters.value.side !== "any") {
        params.push(`side=${filters.value.side}`);
      }
      if (filters.value.spectral !== "all") {
        if (filters.value.spectral === "none") {
          params.push("NOT spectral_type");
        } else if (filters.value.spectral !== undefined) {
          params.push(`spectral_type='${filters.value.spectral}'`);
        }
      }
      if (filters.value.mass.op !== "any") {
        // params.push(
        //   `mass ${filters.value.mass.op} ${filters.value.mass.value}`
        // );
        params.push(
          `(mass->(0) ${filters.value.mass.op} ${filters.value.mass.value} OR mass->(1) ${filters.value.mass.op} ${filters.value.mass.value})`
        );
      }
      if (filters.value.radhard.op !== "any") {
        // params.push(
        //   `radhard ${filters.value.radhard.op} ${filters.value.radhard.value}`
        // );
        params.push(
          `(radhard->(0) ${filters.value.radhard.op} ${filters.value.radhard.value} OR radhard->(1) ${filters.value.radhard.op} ${filters.value.radhard.value})`
        );
      }
      if (
        filters.value.deck === "radiator" &&
        filters.value.therms.op !== "any"
      ) {
        // params.push(`therms = ${parseInt(filters.value.therms)}`);
        // params.push(`therms_h = 3`);
        // therms.indexOf(2) >= 0
        params.push(
          `(therms->(0) ${filters.value.therms.op} ${filters.value.therms.value} OR therms->(1) ${filters.value.therms.op} ${filters.value.therms.value})`
        );
      }
      if (filters.value.thrust.op !== "any") {
        params.push(
          `(thrust ${filters.value.thrust.op} ${filters.value.thrust.value})`
        );
      }
      if (filters.value.fuel.type !== "any") {
        params.push(`(fuel_type = '${filters.value.fuel.type}')`);
      }
      if (filters.value.robonaut.type !== "any") {
        params.push(
          `(robo_type->(0) = '${filters.value.robonaut.type}' OR robo_type->(1) = '${filters.value.robonaut.type}')`
        );
      }
      if (filters.value.robonaut.op !== "any") {
        params.push(
          `(isru ${filters.value.robonaut.op} ${filters.value.robonaut.value})`
        );
      }
      if (filters.value.consumption.op !== "any") {
        params.push(
          `(fuel_consumption ${filters.value.consumption.op} ${filters.value.consumption.value})`
        );
      }
      switch (filters.value.required.op) {
        case "none":
          params.push(
            "NOT required_reactor AND NOT required_generator AND NOT required_therms"
          );
          break;
        case "generator":
          if (filters.value.required.value != "all") {
            params.push(
              `required_generator = '${filters.value.required.value}'`
            );
          } else params.push(`required_generator`);
          break;
        case "reactor":
          if (filters.value.required.value != "all") {
            params.push(`required_reactor = '${filters.value.required.value}'`);
          } else params.push(`required_reactor`);
          break;
        case "therms":
          if (filters.value.required.value) {
            params.push(`required_therms = ${filters.value.required.value}`);
          } else params.push(`required_therms`);
          break;
      }
      if (filters.value.modifiers.values.length > 0) {
        filters.value.modifiers.values.forEach((value) => {
          switch (value) {
            case "afterburn":
            case "ballerina":
            case "pacman":
            case "powersat":
            case "push":
            case "solar":
              params.push(`${value}`);
              break;
            case "+thrust":
              params.push(`thrust_modifier > 0`);
              break;
            case "-consumption":
              params.push(`fuel_consumption_modifier`);
              break;
          }
        });
      }
      console.debug("filtersGetParams!", params);
      return params;
    };

    const getCard = (id) => {
      // console.debug("getCard!", id);
      // return cards[0];
      // console.debug("getCard!", id);
      let sql = `SELECT * FROM ? WHERE id = '${id}'`;
      // console.debug("getCard!", sql);
      const res = alasql(sql, [cards]);
      // console.log('getPatents: ', res);
      return res ? res[0] : null;
    };

    const getCardBack = (card) => {
      // console.debug("getCardBack!", card);
      const idCardBack =
        card.id.slice(-1) === "F"
          ? card.id.slice(0, -1) + "R"
          : card.id.slice(0, -1) + "F";
      let sql = `SELECT * FROM ? WHERE id = '${idCardBack}'`;
      // console.debug("getCardBack!", sql);
      const res = alasql(sql, [cards]);
      // console.log('getPatents: ', res);
      return res ? res[0] : null;
    };

    provide("filters", {
      filters,
      currentCard,
      setCurrentCard,
      getCard,
      getCardBack,
      setFilters,
      setFiltersDeck,
      filtersReset,
      filtersGetParams,
    });
  },
};
</script>
