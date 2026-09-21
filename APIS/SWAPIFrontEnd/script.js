let STARSHIP_ENDPOINT = "ship";
const BASEURL = "https://swapi.dev/api"
let route = "people"
let container = document.getElementById("display_container")


// let endpoint = BASEURL + "/" + route; // concatenation
let endpoint = `${BASEURL}/${route}`; // template literal or string formatting


fetch(endpoint)
    .then(response => {
        console.log("Response: ", response)
        if(response.ok) {
        //     parsing the data (extracting data)
            return response.json(); // this sends to next part fo the chain
        }
    })
    .then(parsedData => {
        for (let i =0; i < parsedData["results"].length; i ++) {
            console.log(parsedData.results[i].name);
            console.log(parsedData.results[i].hair_color);
            container.innerHTML += `
                <div class="blue">
                    <h1>${parsedData["results"][i]["name"]}</h1>
                    <p>${parsedData["results"][i]["hair_color"]}</p>
                </div>
              
                    `

        }

        // console.log(parsedData["results"][0]["hair_color"]);
        // console.log(parsedData["results"][0]["starships"][1]);
        // STARSHIP_ENDPOINT= parsedData["results"][0]["starships"][0];





    })
    .catch(err => console.error(err))
// console.log(STARSHIP_ENDPOINT)
//
// fetch(STARSHIP_ENDPOINT)
//     .then(newResponse => newResponse.json())
//     .then(data => console.log("Ship name: ", data.name) )
//     .catch(err => console.log(err))