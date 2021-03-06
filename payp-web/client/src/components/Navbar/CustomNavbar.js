import React, { useState, useEffect } from 'react';
import AdminHome from '../Admin/AdminHome';
import AdminNavbar from './AdminNavbar';
import GuestNavbar from './GuestNavbar';
import AdminSidebar from './AdminSidebar';
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";
import "./customnavbar.css"
import AvailableYards from '../Availability/AvailableYards';


const CustomNavbar = () => {
    // const [user, setUser] = useState(JSON.parse(localStorage.getItem('profile')));
    const user = JSON.parse(localStorage.getItem('profile'));

    return ( 

         <div>
            {!user?.result ? (
                <GuestNavbar/> 
            ) : (
                <div>
                    <AdminNavbar/> 
                        <div className="container">
                        <AdminSidebar/>
                            <Switch>
                                <Route path="/admin-home" exact component={AdminHome} />
                                <Route path="/available" exact component={AvailableYards} />
                            </Switch>
                        {/* <AdminHome/> */}
                        </div>
                </div>
                
            )}
        </div>





        // <div>
        //     {!user?.result ? (
        //         <GuestNavbar/> 
        //     ) : (
        //         <div>
        //             <AdminNavbar/> 
        //             <AdminSidebar/> 
        //         </div>
                
        //     )}
        // </div>
    );
  
};

export default CustomNavbar;
