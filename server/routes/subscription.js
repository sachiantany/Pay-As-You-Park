import express from 'express';

import { getSubscriptionByUser,getSubscriptionBalanceByUser, subscribePackage, getActiveSubscriptionByUser } from '../controllers/subscription.js';

const router = express.Router();

router.get('/:id', getSubscriptionByUser);
router.get('/active_subscription/:id', getActiveSubscriptionByUser);
router.get('/acc_bal/:id', getSubscriptionBalanceByUser);
router.post('/subscribe',subscribePackage);

/*router.get('/:id', (req,res) => {
    const { id } = req.params['id'];
    console.log(req.params['id'])
    try {
        Subscription.find({ user_email: req.params['id'] })
        .then(subscription => res.json(subscription))
    } catch (error) {
        res.status(404).json({ message: error.message });
    }
})*/




export default router;