"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const lanternName = "Hal Jordan";
const powerLevel = 85;
const hasRing = true;
const corps = "Green"; // by default - assumes a string
console.log(lanternName, powerLevel, hasRing, corps);
// const lantern1 = {
//     fname: "Hal",
//     lname:"Jordan",
//     corps: "Green",
//     powerLevel: 85
// }
const lantern1 = {
    fname: "Hal",
    lname: "Jordan",
    corps,
    powerLevel,
};
console.log(lantern1.powerLevel);
const lantern2 = {
    fname: "John",
    lname: "Stewart",
    corps: "Blood Garnet",
    powerLevel: 90
};
console.log(LanternTypes_1.Lantern.corps);
//interfaces
// use the interface to test our datatypes for our object
