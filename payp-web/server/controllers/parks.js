import express from 'express';
import mongoose from 'mongoose';

import carPark from '../models/carPark.js';

const router = express.Router();

export const getParks = async (req, res) => { 
    try {
        const carParks = await carPark.find();
                
        res.status(200).json(carParks);
    } catch (error) {
        res.status(404).json({ message: error.message });
    }
}

export const getPark = async (req, res) => { 
    const { id } = req.params;

    try {
        const park = await carPark.findById(id);
        
        res.status(200).json(park);
    } catch (error) {
        res.status(404).json({ message: error.message });
    }
}

export const createPark = async (req, res) => {
    const park = req.body;

    const newcarParks = new carPark({ ...park, creator: req.userId, createdAt: new Date().toISOString() })

    try {
        await newcarParks.save();

        res.status(201).json(newcarParks );
    } catch (error) {
        res.status(409).json({ message: error.message });
    }
}

export const updatePark = async (req, res) => {
    const { id } = req.params;
    const { title, message, creator, selectedFile, tags } = req.body;
    
    if (!mongoose.Types.ObjectId.isValid(id)) return res.status(404).send(`No park with id: ${id}`);

    const updatedPark = { creator, title, message, tags, selectedFile, _id: id };


// PID: String,
//     Name: String,
//     Address: String,
//     Latitude: Number,
//     Longitude: Number,
//     Capacity: Number,
//     MaxWidth: Number,
//     MaxLength: Number,
//     MaxHeight: Number,
//     creator: String,
//     Image1: String,
//     Image2: String,
//     Image3: String,
//     likes: { type: [String], default: [] },
//     Dislikes: { type: [String], default: [] },
//     Comments: {type: [String], default: []},
//     QualityPercentage: Number,
//     QualityArray: [String],
//     OverallQuality: String,
//     Status: String,
//     NextEvaluationDate:{
//         type: Date,
//         default: +new Date() + 30*24*60*60*1000,
//     },
//     createdAt: {
//         type: Date,
//         default: new Date(),
//     },


    await carPark.findByIdAndUpdate(id, updatedPark, { new: true });

    res.json(updatedPark);
}

export const deletePark = async (req, res) => {
    const { id } = req.params;

    if (!mongoose.Types.ObjectId.isValid(id)) return res.status(404).send(`No Park with id: ${id}`);

    await carPark.findByIdAndRemove(id);

    res.json({ message: "Park deleted successfully." });
}

export const likePark = async (req, res) => {
    const { id } = req.params;

    if (!req.userId) {
        return res.json({ message: "Unauthenticated" });
      }

    if (!mongoose.Types.ObjectId.isValid(id)) return res.status(404).send(`No Park with id: ${id}`);
    
    const park = await carPark.findById(id);

    const index = park.likes.findIndex((id) => id ===String(req.userId));

    if (index === -1) {
      park.likes.push(req.userId);
    } else {
      park.likes = park.likes.filter((id) => id !== String(req.userId));
    }
    const updatedPark = await carPark.findByIdAndUpdate(id, park, { new: true });
    res.status(200).json(updatedPark);
}


export default router;
