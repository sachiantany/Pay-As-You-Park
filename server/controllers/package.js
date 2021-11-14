import express from 'express';
import mongoose from 'mongoose';

import Packages from '../models/package.js';

const router = express.Router();

export const getPackages = async (req, res) => { 
    try {
        const packages = await Packages.find();
                
        res.status(200).json(packages);
    } catch (error) {
        res.status(404).json({ message: error.message });
    }
}


export default router;