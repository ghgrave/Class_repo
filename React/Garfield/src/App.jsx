import "./App.css"


import FeelingsList from "./FeelingsList.jsx";

const App = () =>{
    return (
        <div className="theimage">
            <h1 className="name">Life</h1>
            <img src="https://i.imgur.com/F67Eq7J.jpeg" alt="garfied comic"/>
            <h3>How does he feel?</h3>
            <FeelingsList />
        </div>
    );


}

export default App