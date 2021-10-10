import mongoose from "mongoose";

const indoorLocationSchema = mongoose.Schema({
  user: { type: String, required:  true },
  distanceX: { type: String, required:  true },
  distanceY: { type: String, required: true },
});

var IndoorLocation = mongoose.model('IndoorLocation', indoorLocationSchema);

export default IndoorLocation;