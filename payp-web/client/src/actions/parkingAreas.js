import { GETPARKINGBYUSER } from '../constants/actionTypes';
import * as api from '../api/index.js';

export const getParkingAreasByUser = () => async (dispatch) => {
    try {
        const { data } = await api.fetchPosts();

        dispatch({ type: GETPARKINGBYUSER, payload: data });
    } catch (error) {
        console.log(error);
    }
};
