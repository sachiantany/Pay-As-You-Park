import React from 'react';
import { Card, CardActions, CardContent, CardMedia, Button, Typography } from '@material-ui/core/';
import ThumbUpAltIcon from '@material-ui/icons/ThumbUpAlt';
import DeleteIcon from '@material-ui/icons/Delete';
import MoreHorizIcon from '@material-ui/icons/MoreHoriz';
import ThumbUpAltOutlined from '@material-ui/icons/ThumbUpAltOutlined';
import { useDispatch } from 'react-redux';
import moment from 'moment';

import { likePark, deletePark } from '../../../actions/parks';
import useStyles from './styles';

const Post = ({ post, setCurrentId }) => {
  const dispatch = useDispatch();
  const classes = useStyles();
  const user = JSON.parse(localStorage.getItem('profile'));

  const Likes = () => {
    if (post.likes.length > 0) {
      return post.likes.find((like) => like === (user?.result?.googleId || user?.result?._id))
        ? (
          <><ThumbUpAltIcon fontSize="small" />&nbsp;{post.likes.length > 2 ? `You and ${post.likes.length - 1} others` : `${post.likes.length} like${post.likes.length > 1 ? 's' : ''}` }</>
        ) : (
          <><ThumbUpAltOutlined fontSize="small" />&nbsp;{post.likes.length} {post.likes.length === 1 ? 'Like' : 'Likes'}</>
        );
    }

    return <><ThumbUpAltOutlined fontSize="small" />&nbsp;Like</>;
  };

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
// likes: { type: [String], default: [] },
// Dislikes: { type: [String], default: [] },
// Comments: {type: [String], default: []},
// QualityPercentage: Number,
// QualityArray: [String],
// OverallQuality: String,
// Status: String,
// NextEvaluationDate:{
//     type: Date,
//     default: +new Date() + 30*24*60*60*1000,
// },
// createdAt: {
//     type: Date,
//     default: new Date(),
// },


  return (
    <Card className={classes.card}>
      <CardMedia className={classes.media} image={post.Image1 || 'https://user-images.githubusercontent.com/194400/49531010-48dad180-f8b1-11e8-8d89-1e61320e1d82.png'} title={post.title} />
      <div className={classes.overlay}>
        <Typography variant="h6">{post.Name}</Typography>
        <Typography variant="body2">{moment(post.createdAt).fromNow()}</Typography>
      </div>
      {(user?.result?.googleId === post?.creator || user?.result?._id === post?.creator) && (
      <div className={classes.overlay2}>
        <Button onClick={() => setCurrentId(post._id)} style={{ color: 'white' }} size="small">
          <MoreHorizIcon fontSize="default" />
        </Button>
      </div>
      )}
      
      <Typography className={classes.title} gutterBottom variant="h5" component="h2">{post.Name}</Typography>
      <Typography className={classes.title} variant="body2" component="h4">Address : {post.Address}</Typography>
      <div className={classes.details1}>
        <Typography variant="body2" component="h3">Hight*Width*Lenght : {post.MaxHeight+'*'+post.MaxWidth+'*'+post.MaxLength}</Typography>
      </div>
      <div className={classes.details1}>
        <Typography variant="body2" component="h3">Latitude : {post.Latitude}</Typography>
      </div>
      <div className={classes.details1}>
        <Typography variant="body2" component="h3">Longitude : {post.Longitude}</Typography>
      </div>
<br/>
      {/* <CardContent>
        <Typography variant="body2" color="textSecondary" component="p">{post.Address}</Typography>
      </CardContent> */}
      <CardActions className={classes.cardActions}>
      <div>
        {/* <Typography variant="body2" component="h3">{post.tags.map((tag) => `Parking yard quality is ${tag} `)}</Typography> */}
        <Typography variant="body2" component="h3">Parking yard quality : {post.QualityArray}</Typography>
      </div>
        <Button size="small" color="primary" disabled={!user?.result} onClick={() => dispatch(likePark(post._id))}>
          {/* <Likes /> */}
          {
            post.QualityArray=="Standard"
            ? <Button size="small" color="primary" style={{background:"#51A02F"}}> Approved</Button>
            : [
                post.QualityArray=="Average"
              ? <Button size="small" color="primary" style={{background:"#F4E200"}}> Approved</Button>
              : [
                post.QualityArray=="Bad"
                ? <Button size="small" color="primary" style={{background:"#DA2D08"}}> Rejected</Button>
                : <div></div>
                ]
              ]
            

          }

        </Button>
        {(user?.result?.googleId === post?.creator || user?.result?._id === post?.creator) && (
        <Button size="small" color="secondary" onClick={() => dispatch(deletePark(post._id))}>
          <DeleteIcon fontSize="small" /> Disable
        </Button>
        )}
      </CardActions>
    </Card>
  );
};

export default Post;
