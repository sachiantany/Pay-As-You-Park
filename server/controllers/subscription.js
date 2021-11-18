import express from 'express';
import mongoose from 'mongoose';

import Subscription from '../models/subscription.js';

const router = express.Router();

export const getSubscriptionByUser = async (req, res) => { 
    const { id } = req.params.id;
    try {
        const subscription = await Subscription.find({ "user_email": req.params['id'] });
                
        res.status(200).json(subscription);
    } catch (error) {
        res.status(404).json({ message: error.message });
    }
}

export const getActiveSubscriptionByUser = async (req, res) => { 
    const { id } = req.params.id;
    try {
        const subscription = await Subscription.find({ "user_email": req.params['id'], "balance":{$gt:0}});
                
        res.status(200).json(subscription);
    } catch (error) {
        res.status(404).json({ message: error.message });
    }
}

export const getSubscriptionBalanceByUser = async (req, res) => { 
    const { id } = req.params.id;
    console.log(req.params['id']);
    try {
        Subscription.aggregate([
            { "$match": { "user_email": req.params['id'] } },
            {
                $group: {
                    _id: null,
                    sum: {
                        $sum: "$balance"
                    }
                }
            }
        ])
            .then(subscription => res.json(subscription[0].sum))
    } catch (error) {
        res.status(404).json({ message: error.message });
    }
}

export const subscribePackage = async (req, res) => {
    const { user_email,package_name,minute,price,balance } = req.body;

    console.log(req)
  
    try {  
    
      const result = await Subscription.create({ user_email,package_name,minute,price,balance });
    
      res.status(201).json({ result });
    } catch (error) {
      res.status(500).json({ message: "Something went wrong" });
      
      console.log(error);
    }
  };


export default router;