// console.log("I am working")
// built in browser methods!!!
// prompt()
// alert()

// let arrays = [element, 3node     ,  null, {nem:"JM"}]

let  monsters = [
    { name: "Mossfang", type: "Goblin" },
    { name: "Nightwhistle", type: "ghost" },
    { name: "Pebblejaw", type: "TROLL" },
    { name: "Emberclaw", type: "Dragon" },
    { name: "Socksnatcher", type: "goblin" },
    { name: "Moonveil", type: "Ghost" },
    { name: "Grumbleback", type: "troll" },
    { name: "Ashwing", type: "DRAGON" },
    { name: "Bogblink", type: "Goblin" },
    { name: "Coldstep", type: "GHOST" },
    { name: "Boulderbelly", type: "Troll" },
    { name: "Sparkspit", type: "dragon" },
    { name: "Mudcap", type: "GOBLIN" },
    { name: "Lanternshade", type: "ghost" },
    { name: "Bridgecrusher", type: "troll" },
    { name: "Cinderwhisk", type: "Dragon" },
    { name: "Picklepaws", type: "goblin" },
    { name: "Hallway Howler", type: "Ghost" },
    { name: "Rocknap", type: "TROLL" },
    { name: "Toastbreath", type: "DRAGON",}
];


//we are going to add 1 third property to EACH element!
//threat level (1-5)
//HOWEVER, you CANNOT hardcode the threat level!!!

// Strategies!!!
//  looping and using type to determine threat level
//  no 1's and based on type gets a level
//  feedback - are all types of the same equal?

//  ask more questions - need more context - who what when where why? Maybe need more questions?
// learned this through decomposition

// Jorge is 1000% correct !!
// he said - boss - specific things he wanted - are there methods?
//  .map() returns a new array!
// wht not .forEach()? just allows us to do something for each element

// can we write a map function that returns something?

 const createNewMonster=() => {
    let newMonsters = monsters.map(el => {
        // doggy =  { name: "Mossfang", type: "Goblin" },
        console.log(el);
        // el.threatLevel = 5;
        // instead of hardcoding - randomize with Math.random.
        // math.random = 0 -1 not including 1 and is a decimal!!!
        // *N means now we are between 0 and N, not including N
        // depending on overall direction we can floor() or ceil()
        // need to include the last number and start with a first # number, then plus it!!!
        el.threatLevel = Math.floor(Math.random()*5) +1
        return el
    })
    console.log(newMonsters);
}

// invoke/call the function
createNewMonster();

