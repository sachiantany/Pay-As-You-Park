import React from 'react';
import { Container } from '@material-ui/core';
import { BrowserRouter, Switch, Route } from 'react-router-dom';

import Home from './components/Home/Home';
import GuestNavbar from './components/Navbar/GuestNavbar';
import Auth from './components/Auth/Auth';

const App = () => (
  <BrowserRouter>
    <GuestNavbar />
      <Switch>
        <Route path="/" exact component={Home} />
        <Route path="/auth" exact component={Auth} />
      </Switch>
  </BrowserRouter>
);

export default App;
