import {Lantern} from "./models/LanternTypes"

const lanternName: string = "Hal Jordan"
const powerLevel: number = 85
const hasRing: boolean = true;
const corps = "Green" // by default - assumes a string
console.log(lanternName, powerLevel, hasRing, corps)


// const lantern1 = {
//     fname: "Hal",
//     lname:"Jordan",
//     corps: "Green",
//     powerLevel: 85
// }
const lantern1 = {
    fname: "Hal",
    lname:"Jordan",
    corps,
    powerLevel,
}
console.log(lantern1.powerLevel)

const lantern2: Lantern = {
    fname: "John",
    lname: "Stewart",
    corps: "Blood Garnet",
    powerLevel: 90
}

console.log()

//interfaces
// use the interface to test our datatypes for our object
