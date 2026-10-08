import HomePage from "./Pages/HomePage.jsx";
import MenuPage from "./Pages/MenuPage.jsx";
import ReservationPage from "./Pages/ReservationPage.jsx";
import {BrowserRouter as Router, Route, Link, Routes} from "react-router-dom"

const App = () => {
    return (
        <Router>
            <div className="App">
                <div className="container">
                    <ul>
                        <li><Link to="/">Home</Link></li>
                        <li><Link to="/menu">Menu</Link></li>
                        <li><Link to ="/reservation">Reservations</Link></li>
                    </ul>
                    <hr/>
                    <Routes>
                        <Route path={"/"} element={<HomePage/>}></Route>
                        <Route path={"/menu"} element={<MenuPage/>}></Route>
                        <Route path={"/location1/reservation"} element={<ReservationPage/>}></Route>
                        {/*<Route path={"/errors"} element={<ErrorPage/>}></Route>*/}
                    </Routes>
                </div>
            </div>
        </Router>
    )

}

export default App;