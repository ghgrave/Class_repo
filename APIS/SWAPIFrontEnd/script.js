
const BASEURL = "https://swapi.dev/api"
let route = "people"

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
        console.log(parsedData.results[0].hair_color);
        console.log(parsedData["results"][0]["hair_color"]);
        console.log(parsedData["results"][0]["starships"][1]);
    })
    .catch(err => console.error(err))