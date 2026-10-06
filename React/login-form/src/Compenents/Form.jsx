import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import {faEye} from "@fortawesome/free-solid-svg-icons";
import {useState} from "react";


const Form = () => {

    const [seePassword, setSeePassword] = useState(false)

    const handleClick = () => {
    //     make a decision - what are we doing??????
        setSeePassword(!seePassword)
    }

    return (
        <form action="">
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

