import React, { Component } from 'react';
import { Link } from 'react-router-dom';

export default class Navbar extends Component {

  render() {
    return (
      <nav className="navbar navbar-dark bg-dark navbar-expand-lg">
        <Link to="/" className="navbar-brand">Pay as you Park</Link>
        <div className="collpase navbar-collapse">
        <ul className="navbar-nav mr-auto">
            <li className="navbar-item">
                <Link to="/admin" className="nav-link">Admin</Link>
            </li>
          <li className="navbar-item">
          <Link to="/signIn" className="nav-link">Sign in</Link>
          </li>
          <li className="navbar-item">
          <Link to="/aboutApp" className="nav-link">How it works?</Link>
          </li>
          <li className="navbar-item">
          <Link to="/location" className="nav-link">Available Locations</Link>
          </li>
          <li className="navbar-item">
          <Link to="/aboutUs" className="nav-link">About Us</Link>
          </li>
        </ul>
        </div>
      </nav>
    );
  }
}