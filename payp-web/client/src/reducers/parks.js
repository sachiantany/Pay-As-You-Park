import { FETCH_ALL, CREATE, UPDATE, DELETE, LIKE } from '../constants/actionTypes';

export default (parks = [], action) => {
  switch (action.type) {
    case FETCH_ALL:
      return action.payload;
    case LIKE:
      return parks.map((park) => (park._id === action.payload._id ? action.payload : park));
    case CREATE:
      return [...parks, action.payload];
    case UPDATE:
      return parks.map((park) => (park._id === action.payload._id ? action.payload : park));
    case DELETE:
      return parks.filter((park) => park._id !== action.payload);
    default:
      return parks;
  }
};

