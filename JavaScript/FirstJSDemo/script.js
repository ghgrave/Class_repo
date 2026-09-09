// console.log("My 'name' is JMikel!")
// console.error('My name "is" JMikel!!!')
// alert("MY name is!!")
// var doggy= prompt("How old are you?")
// console.log(doggy, typeof doggy)

// let color = "blue";
//
//                         {
//                             // re-assiging
//                             color = "green"
//                             let color = "tangerine!!"
//                             console.log("Inside the braces ", color)
//                         }
//          // color = "purple"
//
// console.log("Outside the braces ", color)

// // Store several animals in one array
// const animals = [
//     "Lion",
//     "Penguin",
//     "Giraffe",
//     "Elephant"
// ];

// // Display the entire array
// console.log(animals);
// console.log(animals.length)
// console.log(animals[animals.length-1])

// // append - at the end
// animals.push("Zebra")
// console.log(animals)
//
// // prepend
// animals.unshift("Elephant")
// console.log(animals)
//
// let lastAnimal = animals.pop()
// console.log("We loved Gertie the " + lastAnimal + "!")
// console.log(animals.length)
//
// let firstAnimal = animals.shift()
// console.log("We loved Dougie the " + firstAnimal + "!")
// console.log(animals.length)

// Store several animals in one array
const animals = [
    "Lion",
    "Penguin",
    "Giraffe",
    "Elephant"
];

for(let i = 0; i < animals.length; i++){
    console.log(animals[i])
}

// Precedence = who gets priority???
// BEMDAS
// Associativity left to right OR right to left!!!

let dog = "woof!"

let num  = 1;
// num = num + 1
num += 1

// let newString =
//     `5+ 6 = ${5+6} but only if ${animals.pop()} `
// console.log(newString)

let person1 ={
    fname: "JM",
    Lname: "Who knows?",
    age:24,
    _doggy: "woof",
    "I like spaces": true,
    "1234": "I am a number",
    "#1@erd": undefined
}



