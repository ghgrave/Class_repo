import {useState} from "react"

const App = () =>{

    const personObj = {
        fname: "",
        lname: "",
        age: 0
    }

    const [data, setData] = useState(personObj)

    const handleChange = (event) =>{
        setData({
            ...data, // otherwise we lose all other data!!!!
            [event.target.name]: event.target.value
        })
        console.log(data)
        // console.log(`${event.target.name}:${ event.target.value}`);
    //     do something AFTER the change!!!
    }

    const handleSubmit = (event) =>{
        event.preventDefault()

        let options = {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(data)
        }

        let endpoint = "/api/sendData"

        fetch(endpoint,options )
            .then((response) => {
                if (!response.ok) {
                    throw new Error(`Request failed: ${response.status}`);
                }

                return response.text();
            })
            .then((result) => {
                console.log("Success:", result);
            })
            .catch((error) => {
                console.error("Error sending data:", error);
            });
    }

    return (
        <form onSubmit={handleSubmit} method={"get"}>
            <label >First name:
                <input
                    type="text"
                    name="fname"
                    onChange={handleChange}
                    value={data.fname}
                    autoComplete="off"
                    required
                    maxLength={3}
                />
            </label>
            <br/>
            <label >Last name:
                <input
                    type="text"
                    name="lname"
                    onChange={handleChange}
                    value={data.lname}
                />
            </label>
            <br/>
            <label >Age:
                <input
                    type="number"
                    name="age"
                    onChange={handleChange}
                    value={data.age}
                    max={4}
                    min={2}
                />
            </label>
            <br/>
            <button>Submit</button>
        </form>
    )

}

export default App;