import express from 'express';

import { getPackages } from '../controllers/package.js';

const router = express.Router();
import auth from "../middleware/auth.js";

router.get('/', getPackages);


export default router;