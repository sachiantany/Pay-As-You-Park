import React, { useState, useEffect } from 'react';
import { TextField, Button, Typography, Paper } from '@material-ui/core';
import { useDispatch, useSelector } from 'react-redux';
import FileBase from 'react-file-base64';

import axios from 'axios';

import { createPark, updatePark } from '../../actions/parks';
import useStyles from './styles';

import ReactMapGL, { Marker, Popup, GeolocateControl } from "react-map-gl";
import { Room, Star, StarBorder, Garage } from "@material-ui/icons";
import { cyan } from '@material-ui/core/colors';

const Form = ({ currentId, setCurrentId }) => {
  const [parkData, setParkData] = useState({ Name: '', Address: '', Latitude: '', Longitude: '', Capacity: '', MaxWidth: '', MaxLength: '', MaxHeight: '',QualityArray: '', Image1: '', Image2: '', Image3: '' });
  const park = useSelector((state) => (currentId ? state.parks.find((Address) => Address._id === currentId) : null));
  const dispatch = useDispatch();
  const classes = useStyles();
  const user = JSON.parse(localStorage.getItem('profile'));


//   PID: String,
//   Name: String,
//   Address: String,
//   Latitude: Number,
//   Longitude: Number,
//   Capacity: Number,
//   MaxWidth: Number,
//   MaxLength: Number,
//   MaxHeight: Number,
//   creator: String,
//   Image1: String,
//   Image2: String,
//   Image3: String,

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
    if (park) setParkData(park);
  }, [park]);

  const clear = () => {
    setCurrentId(0);
    setParkData({ Name: '', Address: '', Latitude: '', Longitude: '', Capacity: '', MaxWidth: '', MaxLength: '', MaxHeight: '',QualityArray: '', Image1: '', Image2: '', Image3: ''});
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    const formData = new FormData();
    formData.append('file', parkData.Image1);
    formData.append('upload_preset', 'hzppmkoc')

    const res = await axios.post('https://api.cloudinary.com/v1_1/dkp9t1k1g/image/upload',formData)
        .then(response =>{
          setParkData({Image1: response.data.url})
          console.log("This 1: ", response.data.url)

          const url1 = response.data.url 

          if (currentId === 0) {
            dispatch(createPark({ ...parkData,QualityArray: 'quality',Image1 : url1, name: user?.result?.name }));
            clear();
          } else {
            dispatch(updatePark(currentId, { ...parkData,QualityArray: 'quality',Image1 : url1, name: user?.result?.name }));
            clear();
          }

        }
        );
  };


//   const handleSubmit = async (e) => {
//     e.preventDefault();

//     const formData = new FormData();
//     formData.append('file', parkData.Image1);
//     formData.append('upload_preset', 'hzppmkoc')

//     const res = await axios.post('https://api.cloudinary.com/v1_1/dkp9t1k1g/image/upload',formData)
//         .then(response =>{
//           setParkData({Image1: response.data.url})
//           console.log("This 1: ", response.data.url)

//           const url1 = response.data.url 

//           axios.post('http://127.0.0.1:5002/mode',url1,{ params: {
//             url1
//           }})
//               .then(response1 => {
                
//                 console.log("This 2: ", response1.data['quality'])
//                 const quality = response1.data['quality']

//                 if (currentId === 0) {
//                   dispatch(createPark({ ...parkData,QualityArray: quality,Image1 : response.data.url, name: user?.result?.name }));
//                   clear();
//                 } else {
//                   dispatch(updatePark(currentId, { ...parkData,QualityArray: quality,Image1 : response.data.url, name: user?.result?.name }));
//                   clear();
//                 }
//               }
//               );

//         }
//         );
// // Working end

//   };

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
        <Typography variant="h6">{currentId ? `Editing "${park.Name}"` : 'Register a new parking yard'}</Typography>
        <TextField name="Name" variant="outlined" label="Place name" fullWidth value={parkData.Name} onChange={(e) => setParkData({ ...parkData, Name: e.target.value })} />
        <TextField name="Address" variant="outlined" label="Address" fullWidth multiline rows={1} value={parkData.Address} onChange={(e) => setParkData({ ...parkData, Address: e.target.value })} />

        <TextField name="MaxHeight" variant="outlined" label="Max height (ft)" fullWidth value={parkData.MaxHeight} onChange={(e) => setParkData({ ...parkData, MaxHeight: e.target.value })} />
        <TextField name="MaxWidth" variant="outlined" label="Max Width (ft)" fullWidth value={parkData.MaxWidth} onChange={(e) => setParkData({ ...parkData, MaxWidth: e.target.value })} />
        <TextField name="MaxLength" variant="outlined" label="Max Lenght (ft)" fullWidth value={parkData.MaxLength} onChange={(e) => setParkData({ ...parkData, MaxLength: e.target.value })} />

        <TextField name="Capacity" variant="outlined" label="Capacity" fullWidth value={parkData.Capacity} onChange={(e) => setParkData({ ...parkData, Capacity: e.target.value })} />
        {/* <div className={classes.fileInput}><FileBase type="file" multiple={false} onDone={({ base64 }) => setParkData({ ...parkData, Image1: base64 })} /></div> */}
        <input className={classes.fileInput} type="file" onChange={(event)=> {setParkData({ ...parkData, Image1: event.target.files[0] })}} />
        <input className={classes.fileInput} type="file" onChange={(event)=> {setParkData({ ...parkData, Image2: event.target.files[0] })}} />
        <input className={classes.fileInput} type="file" onChange={(event)=> {setParkData({ ...parkData, Image3: event.target.files[0] })}} />
        
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
