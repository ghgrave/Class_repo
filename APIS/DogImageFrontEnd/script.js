// alert("got this!")

//consume an API
// THEY decide the endpoint => what is it???
// THEY  decide on the data => anything we can use?
// THEY decide how much data to send => How much do I need? 1 or a million?
// THEY decide the data structure (what it looks like) => string, object, arrays,?

// https://dog.ceo/api/breeds/image/random
const BASEURL = "https://dog.ceo/api/breeds"


let btn = document.querySelector("button")
let img = document.querySelector("img")
img.setAttribute("src", "https://images.dog.ceo/breeds/stbernard/n02109525_1100.jpg")
img.setAttribute("alt", "stbernard")
// console.log(btn)
btn.addEventListener("click", ()=>{
    // console.log("Yeah!!!")
    //     we want to run code that CONSUMES (fetches) an API that sends
    //     us a randomn image
    // fetch scaffolding
    let route ="/image/random"
    let endpoint =`${BASEURL}/${route}`
    fetch(endpoint) // 1) Utilize an endpoint
        .then(function(data){
            console.log("Data: ", data)
            if(!data.ok){
                // 2) Receive data -if good, parse it
//                          - if bad, send error
            //     do something - parse the data
                let result = data.json()
                console.log("Result: ", result)
                return result
            } else {
            //     throw an error
                throw Error("Adam broke this!!!!!!")
            }
        })
        .then(parsedData => {
            // console.log("Parsed: ", parsedData.message);
            img.setAttribute("src", parsedData.message)
        })
        .catch((error)=>{
            console.error("Error message: ", error)
        })
})


// HTTP REQUEST
// let data = data ? !data : data;

// 3)  Do something with the PARSED data
// 4) Error Handling


