import React, { useState, useEffect } from 'react';
import { TextField, Button, Typography, Paper } from '@material-ui/core';
import { useDispatch, useSelector } from 'react-redux';
import FileBase from 'react-file-base64';

import axios from 'axios';

import { createPost, updatePost } from '../../actions/posts';
import useStyles from './styles';

import ReactMapGL, { Marker, Popup, GeolocateControl } from "react-map-gl";
import { Room, Star, StarBorder, Garage } from "@material-ui/icons";
import { cyan } from '@material-ui/core/colors';

const Form = ({ currentId, setCurrentId }) => {
  const [postData, setPostData] = useState({ title: '', message: '', tags: '', selectedFile: '', mHeight: '', mWidth: '', mLength: '' });
  const post = useSelector((state) => (currentId ? state.posts.find((message) => message._id === currentId) : null));
  const dispatch = useDispatch();
  const classes = useStyles();
  const user = JSON.parse(localStorage.getItem('profile'));

  //map implementation start 
  const myStorage = window.localStorage;
  const [currentUsername, setCurrentUsername] = useState(myStorage.getItem("user"));
  const [currentPlaceId, setCurrentPlaceId] = useState(null);
  const [viewport, setViewport] = useState({
    width: "500px",
    height: "100vh",
    latitude: 6.867327205086767,
    longitude: 79.89684721698309,
    zoom: 8,
  });

  const geolocateControlStyle= {
    right: 10,
    top: 10
  };
  
  // const handleMarkerClick = (id, lat, long) => {
  //   setCurrentPlaceId(id);
  //   setViewport({ ...viewport, latitude: lat, longitude: long });
  // };

  useEffect(() => {
    if (post) setPostData(post);
  }, [post]);

  const clear = () => {
    setCurrentId(0);
    setPostData({ title: '', message: '', tags: '', selectedFile: '', mHeight: '', mWidth: '', mLength: '' });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    // Working start

    const formData = new FormData();
    formData.append('file', postData.selectedFile);
    formData.append('upload_preset', 'hzppmkoc')

    const res = await axios.post('https://api.cloudinary.com/v1_1/dkp9t1k1g/image/upload',formData)
        .then(response =>{
          setPostData({selectedFile: response.data.url})
          console.log("This 1: ", response.data.url)

          const url1 = response.data.url 

          axios.post('http://127.0.0.1:5002/mode',url1,{ params: {
            url1
          }})
              .then(response1 => {
                
                console.log("This 2: ", response1.data['quality'])
                const quality = response1.data['quality']

                if (currentId === 0) {
                  dispatch(createPost({ ...postData,tags: quality,selectedFile : response.data.url, name: user?.result?.name }));
                  clear();
                } else {
                  dispatch(updatePost(currentId, { ...postData,tags: quality,selectedFile : response.data.url, name: user?.result?.name }));
                  clear();
                }
              }
              );

        }
        );
// Working end

  };

  if (!user?.result?.name) {
    return (
      <Paper className={classes.paper}>
        <Typography variant="h6" align="center">
          Please Sign In to Register for new parking lot.
        </Typography>
      </Paper>
    );
  }

  return (
    <Paper className={classes.paper}>
      <form autoComplete="off" noValidate className={`${classes.root} ${classes.form}`} onSubmit={handleSubmit}>
        <Typography variant="h6">{currentId ? `Editing "${post.title}"` : 'Register a new parking yard'}</Typography>
        <TextField name="title" variant="outlined" label="Place name" fullWidth value={postData.title} onChange={(e) => setPostData({ ...postData, title: e.target.value })} />
        <TextField name="message" variant="outlined" label="Address" fullWidth multiline rows={1} value={postData.message} onChange={(e) => setPostData({ ...postData, message: e.target.value })} />

        <TextField name="title" variant="outlined" label="Max height (ft)" fullWidth value={postData.height} onChange={(e) => setPostData({ ...postData, mHeight: e.target.value })} />
        <TextField name="title" variant="outlined" label="Max Width (ft)" fullWidth value={postData.width} onChange={(e) => setPostData({ ...postData, mWidth: e.target.value })} />
        <TextField name="title" variant="outlined" label="Max Lenght (ft)" fullWidth value={postData.length} onChange={(e) => setPostData({ ...postData, mLength: e.target.value })} />

        <TextField name="tags" variant="outlined" label="Slot count" fullWidth value={postData.tags} onChange={(e) => setPostData({ ...postData, tags: e.target.value.split(',') })} />
        {/* <div className={classes.fileInput}><FileBase type="file" multiple={false} onDone={({ base64 }) => setPostData({ ...postData, selectedFile: base64 })} /></div> */}
        <input className={classes.fileInput} type="file" onChange={(event)=> {setPostData({ ...postData, selectedFile: event.target.files[0] })}} />
        
        <div className={classes.mapBox}>
          <ReactMapGL
          {...viewport}
            // mapboxApiAccessToken="pk.eyJ1Ijoic2FjaGlhbnRhbnkiLCJhIjoiY2t1YjVpc3BkMG5jaDJ3bzg5c2hpZ214YyJ9.wsMpg-9i7e4YlX7RUxliZA"
            transitionDuration="100"
            mapStyle="mapbox://styles/sachiantany/ckusu8qgi3qr017tfr7t95pij"
            onViewportChange={(nextViewport) => setViewport(nextViewport)}
          >
            <GeolocateControl
              style={geolocateControlStyle}
              positionOptions={{enableHighAccuracy: true}}
              trackUserLocation={true}
              auto
            />
            <Marker
              latitude={6.867327205086767}
              longitude={79.89684721698309}
              offsetLeft={-20}
              offsetTop={-10}
            >
              <Room
              style={{
                fontSize: 7 * viewport.zoom,
                color: "#1b7f93"
              }}
              />
            </Marker>

          </ReactMapGL>
        </div>
        
        <Button className={classes.buttonSubmit} variant="contained" color="primary" size="large" type="submit" fullWidth>Submit</Button>
        <Button variant="contained" color="secondary" size="small" onClick={clear} fullWidth>Clear</Button>
      </form>
    </Paper>
  );
};

export default Form;
