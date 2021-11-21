import axios from 'axios';

const API = axios.create({ baseURL: 'http://localhost:5000' });

API.interceptors.request.use((req) => {
  if (localStorage.getItem('profile')) {
    req.headers.Authorization = `Bearer ${JSON.parse(localStorage.getItem('profile')).token}`;
  }

  return req;
});

export const fetchPosts = () => API.get('/posts');
export const createPost = (newPost) => API.post('/posts', newPost);
export const likePost = (id) => API.patch(`/posts/${id}/likePost`);
export const updatePost = (id, updatedPost) => API.patch(`/posts/${id}`, updatedPost);
export const deletePost = (id) => API.delete(`/posts/${id}`);

export const fetchParks = () => API.get('/parks');
export const createPark = (newPark) => API.post('/parks', newPark);
export const likePark = (id) => API.patch(`/parks/${id}/likePark`);
export const updatePark = (id, updatedPark) => API.patch(`/parks/${id}`, updatedPark);
export const deletePark = (id) => API.delete(`/parks/${id}`);

export const signIn = (formData) => API.post('/user/signin', formData);
export const signUp = (formData) => API.post('/user/signup', formData);

export const fetchParkingAreaByUser = () => API.get('/parkingArea/getByUser');
export const createParkingArea = (newParkingArea) => API.post('/parkingArea/create', newParkingArea);
