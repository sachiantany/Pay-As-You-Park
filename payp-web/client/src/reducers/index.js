import { combineReducers } from 'redux';

import posts from './posts';
import parks from './parks';
import auth from './auth';

export const reducers = combineReducers({ posts, parks, auth });
