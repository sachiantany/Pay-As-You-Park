import mongoose from 'mongoose';

const carParkSchema = mongoose.Schema({
    PID: String,
    Name: String,
    Address: String,
    Latitude: Number,
    Longitude: Number,
    Capacity: Number,
    MaxWidth: Number,
    MaxLength: Number,
    MaxHeight: Number,
    creator: String,
    Image1: String,
    Image2: String,
    Image3: String,
    likes: { type: [String], default: [] },
    Dislikes: { type: [String], default: [] },
    Comments: {type: [String], default: []},
    QualityPercentage: Number,
    QualityArray: [String],
    OverallQuality: String,
    Status: String,
    NextEvaluationDate:{
        type: Date,
        default: +new Date() + 30*24*60*60*1000,
    },
    createdAt: {
        type: Date,
        default: new Date(),
    },
})

var parkingyard = mongoose.model('parkingyard', carParkSchema);

export default parkingyard;