import React, { useState, useEffect } from 'react';
import { Container, Grow, Grid } from '@material-ui/core';
import ReactMapGL, { Marker, Popup, GeolocateControl } from "react-map-gl";
import { Room, Star, StarBorder, Garage } from "@material-ui/icons";
import useStyles from './available';


function AvailableYards() {
    const myStorage = window.localStorage;
    const [currentUsername, setCurrentUsername] = useState(myStorage.getItem("user"));
    const [currentPlaceId, setCurrentPlaceId] = useState(null);
    const [newPlace, setNewPlace] = useState({
      lat:0,
      long:0
    });
    const classes = useStyles();

    const [viewport, setViewport] = useState({
        width: "100%",
        height: "70vh",
        latitude: 6.867327205086767,
        longitude: 79.89684721698309,
        zoom: 1,
      });

      const geolocateControlStyle= {
        right: 10,
        top: 10
      };

      const handleAddClick = (e) => {
        console.log("Tes :", e)
        const [longitude, latitude] = e.lngLat;
        setNewPlace({
          lat: latitude,
          long: longitude,
        });
      };

  return(
    // <Grow in>
    <Container>
        <div>
            <div className={classes.mapBox}>
                <ReactMapGL
                {...viewport}
                    // mapboxApiAccessToken="pk.eyJ1Ijoic2FjaGlhbnRhbnkiLCJhIjoiY2t1YjVpc3BkMG5jaDJ3bzg5c2hpZ214YyJ9.wsMpg-9i7e4YlX7RUxliZA"
                    mapboxApiAccessToken="pk.eyJ1Ijoic2FjaGlhbnRhbnkiLCJhIjoiY2t1YjVpc3BkMG5jaDJ3bzg5c2hpZ214YyJ9.wsMpg-9i7e4YlX7RUxliZA"
                    // transitionDuration="10"
                    mapStyle="mapbox://styles/sachiantany/ckusu8qgi3qr017tfr7t95pij"
                    onViewportChange={(nextViewport) => setViewport(nextViewport)}
                    onDblClick={handleAddClick}
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
        </div>
    </Container>
    // </Grow>
            
    
  )
}

export default AvailableYards;