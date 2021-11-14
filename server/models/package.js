import mongoose from "mongoose";

const packageSchema = mongoose.Schema({
  name: { type: String, required:  true },
  minute: { type: Number, required: true },
  price: { type: Number, required: true },
  active: { type: Boolean, required: true },
  bonus: { type: Number, required: true },
  id: { type: String },
});

export default mongoose.model("Packages", packageSchema);