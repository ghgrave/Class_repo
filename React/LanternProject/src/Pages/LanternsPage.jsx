import LanternsCard from "../Components/LanternsCard.jsx";
import {lanterns} from "../data.js"



// let lanterns =
//     [
//         {
//             fname: `Carol`,
//             lname:  `Ferris`
//         },
//         {
//             fname: `John`,
//             lname:  `Stewart`
//         }
//     ]


const LanternsPage = () =>{
    // javascript helpers potential logic
   // .map() creates a NEW array
    let newLanternArray = lanterns.map((el, indexing) =>{
            return <LanternsCard key={el.id} lantern={el}/>;
    })

    return (
        <>
            <h1>My Lanterns Page</h1>
            {newLanternArray}
        </>

    )
}

export default LanternsPage;