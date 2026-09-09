// let person = {
// //     keys and values, name/value pairs
//     fname: "JM",
//     last_name: "Pearson",
//     age: 55,
//     isMarried: true,
//     friends: ["Chris", "Dan", "Jennifer"],
//     hobbies: {
//         pating: false,
//         favorite: "Programming"
//     }
// }
//
// // let age = "age"
// let doffy = 88
// person[doffy] = num
// person["age"] = num

// console.log(person.age)
// // dot notation
// console.log(person.age)
// console.log(person.isMarried)
// // person object and the friends array with index 1
// console.log(person.friends[1])
// console.log(person.hobbies.favorite)
//
// // bracket notation
// console.log(person["age"])
// console.log(person["isMarried"])
// console.log(person["friends"][1])
// console.log(person["hobbies"]["favorite"])
// console.log(person.hobbies["favorite"])
//
// let age = 22
// let f_name = "JM"
// let isMarried = true;
//
// let person = {
//     age,
//     f_name,
//     married: isMarried,
//     dateCreated: new Date()
// }

// IIFE - Immeadiately Invoke Function Expression
// (function(){
//     console.log("MY first function")
// })()


// named function
// function doggy (){
//     console.log("MY second function")
// }
// // invoke or call a function by the name
// doggy()

// function expression
// let horse = function () {
//     console.log("Horse function")
// }
// horse()

// parameters - accept values
// arguments pass the values
// let newPerson = function (name, age){
//     console.log("Hello " + name + " you are " + age + " years old!")
// }

// template literals use BACK TICS!!!!!!
// under the ESC key!!!!
// let newPerson = function (name="JM", age = 21){
//     console.log(`Hello ${name}. You are ${age} years old!`)
// }
//
// newPerson("JM", 20)
// newPerson("JM")
// newPerson(undefined, 55)

// basic fat arrow function
// let horse = () => {
//     return "Horse function"
// }

// implied RETURN!!!!
// let horse = (animal, age = 21) => `${animal} is function ${age}!`
//
// let date = info => new Date() + info
// let newResult = date;
//
//
//
//
// let result = horse("doggy")
// console.log(result);
let numbers = [1, 2, 3,4 , 5]

// iterating means we are cycling through something
// predicate is a fancy word for variable used to reference the element in array
// DOES NOT change original array
// numbers.forEach(function(element) {
//     console.log(element * 2)
//     }
// )

numbers.forEach(element => console.log(element * 3))

let names = ["JM", "George", "adam"]

names.forEach(el => console.log(el + "'s"))

// .map()
// iterate through an array and this time
// Create a NEW array

let newArray = names.map(
    element => `${element}'s`
)
console.log(newArray)











































