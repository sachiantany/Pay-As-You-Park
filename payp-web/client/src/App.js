import React from 'react';
import { Container } from '@material-ui/core';
import { BrowserRouter, Switch, Route } from 'react-router-dom';

import Home from './components/Home/Home';
import GuestNavbar from './components/Navbar/GuestNavbar';
import Auth from './components/Auth/Auth';
import AdminHome from './components/Admin/AdminHome';
import CustomNavbar from './components/Navbar/CustomNavbar';

const App = () => (
  <BrowserRouter>
    <CustomNavbar />
      <Switch>
        <Route path="/" exact component={Home} />
        <Route path="/auth" exact component={Auth} />
        {/* <Route path="/admin-home" exact component={AdminHome} /> */}
      </Switch>
  </BrowserRouter>
);

export default App;
