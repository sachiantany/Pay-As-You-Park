import React from 'react';
import "bootstrap/dist/css/bootstrap.min.css"
import { BrowserRouter as Router, Route} from "react-router-dom";


import Navbar from "./components/navbar.component"
import Home from "./components/home"
import SignIn from "./components/login"
import AboutApp from "./components/about-app"
import Location from "./components/location"
import AboutUs from "./components/about-us"


function App() {
  return (
    <Router>
      <div className="container">
      <Navbar />
      <br/>
      <Route path="/" exact component={Home} />
      <Route path="/signIn" component={SignIn} />
      <Route path="/aboutApp" component={AboutApp} />
      <Route path="/location" component={Location} />
      <Route path="/aboutUs" component={AboutUs} />
      </div>
    </Router>
  );
}

export default App;
