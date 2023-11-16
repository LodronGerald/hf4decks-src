const filtersBase = {
    name: "",
    deck: "any",
    side: 0,
    type: "all",
    therms: { op: "any", value: 0 },
    spectral: "all",
    mass: { op: "any", value: 0 },
    radhard: { op: "any", value: 0 },
    required: { op: "any", value: "" },
    thrust: { type: "any", op: "any", value: 0 },
    fuel: { type: "any" },
    consumption: { op: "any", value: 0 },
    modifiers: { values: [] },
    robonaut: { type: "any", op: "any", value: 0 },
};

export default {
    filtersBase: filtersBase
};