import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import {faEye} from "@fortawesome/free-solid-svg-icons";
import {useState} from "react";


const Form = () => {

    const [seePassword, setSeePassword] = useState(false)

    const handleClick = () => {
    //     make a decision - what are we doing??????
        setSeePassword(!seePassword)
    }

    const handleSubmit = (event) =>{
        event.preventDefault()
        console.log(" I clicked!!!!")
    }

    return (
        // html = page focused
        // route focused - api/data/getdata
        // React = event focused
        <form onSubmit={handleSubmit} >
            <label>User Name:
                <input type="text"/>
            </label>
            <br/>
            <label>Password:
                <input type={seePassword ? "text" : "password"}/>
            </label>
            <FontAwesomeIcon
                icon={faEye}
                onClick = {handleClick}
            />
            <br/>
            <button>Submit!!</button>
        </form>

    )
}

export default Form;

