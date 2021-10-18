
import React, { useState, useEffect } from 'react';
import { AppBar, Typography, Toolbar, Avatar, Button } from '@material-ui/core';
import { Link, useHistory, useLocation } from 'react-router-dom';
import { useDispatch } from 'react-redux';
import decode from 'jwt-decode';

import * as actionType from '../../constants/actionTypes';
import useStyles from './styles';
import './Header.css';
import Icon from "../../images/icon.svg"


const AdminNavbar = () => {
    const [user, setUser] = useState(JSON.parse(localStorage.getItem('profile')));
    const dispatch = useDispatch();
    const location = useLocation();
    const history = useHistory();
    const classes = useStyles();
  
    const logout = () => {
      dispatch({ type: actionType.LOGOUT });
  
      history.push('/auth');
      window.location.reload(); 
  
      setUser(null);
    };
  
    useEffect(() => {
      const token = user?.token;
  
      if (token) {
        const decodedToken = decode(token);
  
        if (decodedToken.exp * 1000 < new Date().getTime()) logout();
      }
  
      setUser(JSON.parse(localStorage.getItem('profile')));
    }, [location]);

    return ( 
        <AppBar className={classes.appBar} position="static" color="inherit">
            <header>
            <div className="container2">
                <br/>
                <nav>
                    <ul className="nav-list nav-list-mobile">
                        <li className="nav-item">
                            <div className="mobile-menu">
                                <span className="line line-top"></span>
                                <span className="line line-bottom"></span>
                            </div>
                        </li>
                        <li className="nav-item">
                            <a href="index.html" className="nav-link nav-link-apple"></a>
                        </li>
                        <li className="nav-item">
                            <a href="#" className="nav-link nav-link-bag"></a>
                        </li>
                    
                    </ul>
                    {/* <!-- /.nav-list nav-list-mobile -->  */}
                    <ul className="nav-list nav-list-larger">
                        <li className="nav-item search-hiden">
                        
                            <input className="nav-link nav-link-searchbar" type="text" 
                                placeholder="&#xF002; Search apple.com" 
                                style={{fontFamily:"Arial, FontAwesome"}} />
                        
                        </li>
                        <li className="nav-item nav-item-hidden">
                            {/* <a href="/" className="nav-link nav-link-apple"></a> */}

                            <img src={Icon} className="nav-link-apple"></img>
                        </li>
                        <li className="nav-item">
                            <a href="mac" className="nav-link">Pay as you park - Yard Owner</a>
                        </li>
                    
                        <li className="nav-item">
                            <a href="#" className="nav-link">Availability</a>
                        </li>
                        <li className="nav-item">
                            <a href="#" className="nav-link">About</a>
                        </li>
                        <li className="nav-item">
                            <a href="#" className="nav-link">Support</a>
                        </li>
                        <li className="nav-item">
                            <a href="#" className="nav-link nav-link-search"></a>
                        </li>
                        <li className="nav-item">
                                {/* <a href="#" className="nav-link nav-link-bag"></a> */}
                            {user?.result ? (
                                
                                <div className={classes.profile}>
                                    <Avatar className={classes.purple} alt={user?.result.name} src={user?.result.imageUrl}>{user?.result.name.charAt(0)}</Avatar>
                                    <Typography className={classes.userName} variant="h6">{user?.result.name}</Typography>
                                
                                    <Button  variant="contained" className={classes.logout} color="primary" onClick={logout}>Logout</Button>
                                </div>
                            
                                
                            ) : (
                                <Button component={Link} to="/auth" variant="contained" className={classes.login} >Sign In</Button>
                            )}
                        </li>
                    
                    
                    </ul> 
                        
                </nav>

            </div>
        </header>
    </AppBar>
    )
    }

 
export default AdminNavbar;
