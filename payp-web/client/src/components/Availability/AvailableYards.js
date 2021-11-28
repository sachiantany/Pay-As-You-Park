import React, { useState, useEffect } from 'react';
import { Container, Grow, Grid } from '@material-ui/core';
import ReactMapGL, { Marker, Popup, GeolocateControl } from "react-map-gl";
import { Room, Star, StarBorder, Garage } from "@material-ui/icons";
import useStyles from './available';
import axios from 'axios';
import { Card, CardActions, CardContent, CardMedia, Button, Typography } from '@material-ui/core/';
import moment from 'moment';
import { useDispatch } from 'react-redux';
import { useHistory } from 'react-router-dom';
import ThumbUpAltOutlined from '@material-ui/icons/ThumbUpAltOutlined';
import ThumbUpAltIcon from '@material-ui/icons/ThumbUpAlt';


import { likePark, deletePost } from '../../actions/parks';


function AvailableYards() {
    const myStorage = window.localStorage;
    const [currentUsername, setCurrentUsername] = useState(myStorage.getItem("user"));
    const [currentPlaceId, setCurrentPlaceId] = useState(null);
    const [newPlace, setNewPlace] = useState({
      lat:0,
      long:0
    });
    const classes = useStyles();
    const [pins, setPins] = useState([]);
    const user = JSON.parse(localStorage.getItem('profile'));


    const [viewport, setViewport] = useState({
        width: "100%",
        height: "70vh",
        latitude: 6.867327205086767,
        longitude: 79.89684721698309,
        zoom: 4,
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

      useEffect(() => {
        const getPins = async () => {
          try {
            const allPins = await axios.get("/parks");
            console.log("pin : ", allPins.data[0].likes)
            setPins(allPins.data);
          } catch (err) {
            console.log(err);
          }
        };
        getPins();
      }, []);

      const handleMarkerClick = (id, lat, long) => {
        setCurrentPlaceId(id);
        setViewport({ ...viewport, latitude: lat, longitude: long });
      };


      //like

      const [likes, setLikes] = useState(pins?.likes);
      const dispatch = useDispatch();
      const history = useHistory();
    
      const userId = user?.result.googleId || user?.result?._id;
      const hasLikedPost = pins?.likes?.find((like) => like === userId);
    
      const handleLike = async () => {
        dispatch(likePark(pins._id));
    
        if (hasLikedPost) {
          setLikes(pins.likes.filter((id) => id !== userId));
        } else {
          setLikes([...pins.likes, userId]);
        }
      };
    
      const Likes = () => {
        if (likes?.length > 0) {
          return likes.find((like) => like === userId)
            ? (
              <><ThumbUpAltIcon fontSize="small" />&nbsp;{likes.length > 2 ? `You and ${likes.length - 1} others` : `${likes.length} like${likes.length > 1 ? 's' : ''}` }</>
            ) : (
              <><ThumbUpAltOutlined fontSize="small" />&nbsp;{likes.length} {likes.length === 1 ? 'Like' : 'Likes'}</>
            );
        }
    
        return <><ThumbUpAltOutlined fontSize="small" />&nbsp;Like</>;
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
                    {pins.map((p) => (
                            <>
                                <Marker
                                latitude={p.Latitude}
                                longitude={p.Longitude}
                                offsetLeft={-3.5 * viewport.zoom}
                                offsetTop={-7 * viewport.zoom}
                                >
                                <Room
                                    style={{
                                    fontSize: 4 * viewport.zoom,
                                    color:
                                        currentUsername === p.creator ? "#070963" : "#460357",
                                    cursor: "pointer",
                                    }}
                                    onClick={() => handleMarkerClick(p._id, p.Latitude, p.Longitude)}
                                />
                                </Marker>
                                {p._id === currentPlaceId && (
                                <Popup
                                    key={p._id}
                                    latitude={p.Latitude}
                                    longitude={p.Longitude}
                                    closeButton={true}
                                    closeOnClick={false}
                                    onClose={() => setCurrentPlaceId(null)}
                                    anchor="left"
                                >

                                    <Card className={classes.card}>
                                        <CardMedia className={classes.media} image={p.Image1 || 'https://user-images.githubusercontent.com/194400/49531010-48dad180-f8b1-11e8-8d89-1e61320e1d82.png'} title={p.Name} />
                                        <div className={classes.overlay}>
                                            <Typography variant="h6">{p.Name}</Typography>
                                            <Typography variant="body2">{moment(p.createdAt).fromNow()}</Typography>
                                        </div>
                                        {(user?.result?.googleId === p?.creator || user?.result?._id === p?.creator) && (
                                        <div className={classes.overlay2}>
                                            
                                        </div>
                                        )}
                                        
                                        <Typography className={classes.title} gutterBottom variant="h5" component="h2">{p.Name}</Typography>
                                        <Typography className={classes.title} variant="body2" component="h4">Address : {p.Address}</Typography>
                                        <div className={classes.details1}>
                                            <Typography variant="body2" component="h3">Hight*Width*Lenght : {p.MaxHeight+'*'+p.MaxWidth+'*'+p.MaxLength}</Typography>
                                        </div>
                                        <div className={classes.details1}>
                                            <Typography variant="body2" component="h3">Created by <b>Sachi Antany</b></Typography>
                                        </div>
                                        <div className={classes.details1}>
                                            <Typography variant="body2" component="h3">{Array(p.likes).fill(<Star className="star" />)}</Typography>
                                        </div>

                                            <CardActions className={classes.cardActions}>
                                                <Button size="small" color="primary" disabled={!user?.result} onClick={handleLike}>
                                                <Likes />
                                                </Button>
                                            </CardActions>
                                     </Card>



                                    {/* <div className="card">
                                    {(user?.result?.googleId === p?.creator || user?.result?._id === p?.creator) && (
                                    <div className={classes.overlay2}>
                                        <Typography variant="h6">{p.Name}</Typography>
                                    </div>
                                    )}
                                    <CardMedia className={classes.media} image={p.Image1 || 'https://user-images.githubusercontent.com/194400/49531010-48dad180-f8b1-11e8-8d89-1e61320e1d82.png'} title={p.Name} />

                                    <label>Place</label>
                                    <h4 className="place">{p.Name}</h4>
                                    <label>Review</label>
                                    <p className="desc">{p.Address}</p>
                                    <label>Rating</label>
                                    <div className="stars">
                                        {Array(p.likes).fill(<Star className="star" />)}
                                    </div>
                                    <span className="username">
                                        Created by <b>Sachi Antany</b>
                                    </span>
                                    <span className="date"> {moment(p.createdAt).fromNow()}</span>
                                    </div> */}
                                </Popup>
                                )}
                            </>
                            ))}

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
                        fontSize: 4 * viewport.zoom,
                        color: "#0C090A"
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