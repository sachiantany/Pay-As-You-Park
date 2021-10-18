import React, { useState, useEffect } from 'react';
// import "./adminhome.css";

import { Container, Grow, Grid } from '@material-ui/core';
import { useDispatch } from 'react-redux';

import { getPosts } from '../../actions/posts';
import Posts from '../Posts/Posts';
import Form from '../Form/Form';

const AdminHome = () => { 

    const [currentId, setCurrentId] = useState(0);
    const dispatch = useDispatch();
  
    useEffect(() => {
      dispatch(getPosts());
    }, [currentId, dispatch]);


    return (
        // <div className="home">
            <Grow in>
            <Container>
                <Grid container justify="space-between" spacing={3}>
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
  