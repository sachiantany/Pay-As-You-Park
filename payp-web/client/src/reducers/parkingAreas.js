import { GETPARKINGBYUSER } from '../constants/actionTypes';

export default (parkingAreas = [], action) => {
    switch (action.type) {
        case GETPARKINGBYUSER:
            return action.payload;
        // case LIKE:
        //     return parkingAreas.map((post) => (post._id === action.payload._id ? action.payload : post));
        // case CREATE:
        //     return [...parkingAreas, action.payload];
        // case UPDATE:
        //     return parkingAreas.map((post) => (post._id === action.payload._id ? action.payload : post));
        // case DELETE:
        //     return parkingAreas.filter((post) => post._id !== action.payload);
        default:
            return parkingAreas;
    }
};
