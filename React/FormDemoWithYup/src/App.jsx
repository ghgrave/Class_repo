import {useState} from "react"
import {useForm} from "react-hook-form"
import {object, string, number} from "yup"
import {yupResolver} from "@hookform/resolvers/yup";

const App = () =>{
    const userSchema = object(
        {
            fname: string()
                .required("Everyone must have a first name!!!")
                .max(3, "Must be less than 4 characters")
        }
    )


    const {
        register,
        setValue,
        handleSubmit,
        reset,
        formState: {errors}}
        =
        useForm(
            {
                resolver: yupResolver(userSchema),
            }
        )



    const onSubmit = (data) => {
        console.log(data)
        reset()
    }


    const personObj = {
        fname: "",
        lname: "",
        age: 0
    }

    const [data, setData] = useState(personObj)

    const handleChange = (event) =>{
       setValue(event.target.name, event.target.value)

    }

    // const handleSubmit = (event) =>{
    //     event.preventDefault()
    // }

    return (
        <form onSubmit={handleSubmit(onSubmit)} >
            <label >First name:
                <input
                    type="text"
                    {...register("fname")}
                    onChange={handleChange}

                />
            </label>
            { errors.fname && <span>Validation</span>}
            <br/>
            <label >Last name:
                <input
                    type="text"
                    {...register("lname")}
                    onChange={handleChange}
                />
            </label>
            <br/>
            <label >Age:
                <input
                    type="number"
                    {...register("age")}
                    onChange={handleChange}
                    // max={4}
                    // min={2}
                />
            </label>
            <br/>
            <button type={"submit"}>Submit</button>
            <button type={"reset"}>Reset</button>
        </form>
    )

}

export default App;