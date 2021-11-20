import React, { useState, useEffect } from 'react';
// import "./adminhome.css";

import { Container, Grow, Grid } from '@material-ui/core';
import { useDispatch } from 'react-redux';

import { getParks } from '../../actions/parks';
import Posts from '../Posts/Posts';
// import Form from '../Form/Form';
import Form from '../Form/ParkRegisterForm';

const AdminHome = () => { 

    const [currentId, setCurrentId] = useState(0);
    const dispatch = useDispatch();
  
    useEffect(() => {
      dispatch(getParks());
    }, [currentId, dispatch]);


    return (
        // <div className="home">
            <Grow in>
            <Container>
                <Grid container justifyContent="space-between" spacing={3}>
                <Grid item xs={12} sm={6}>
                    <Posts setCurrentId={setCurrentId} />
                </Grid>
                <Grid item xs={12} sm={5}>
                    <Form currentId={currentId} setCurrentId={setCurrentId} />
                </Grid>
                </Grid>
            </Container>
            </Grow>
    //   </div>
    );
  }
  
  export default AdminHome;
  