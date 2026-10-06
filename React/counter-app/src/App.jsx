import {useState} from "react"

const App = () =>{

    const [counter, setCounter] = useState(10)

    const handleClick = () => {
        // explicitly mutating state
        // return counter + 1;  // YOU CANNOT DO THIS!!
        // useState changes the values
        setCounter(counter + 1)
    }

    return (
        <>
            <h1>App Component</h1>
            <p
                // style={{border: "red, 2px, solid"}}
                onClick={handleClick}
            >{counter}</p>

        </>
    )
}

export default App;