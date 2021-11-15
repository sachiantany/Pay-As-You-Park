import mongoose from "mongoose";

const subscriptionSchema = mongoose.Schema({
  user_email :{ type: String, required:  true },
  package_name: { type: String, required:  true },
  minute: { type: Number, required: true },
  price: { type: Number, required: true },
  balance: { type: Number, required: true },
  id: { type: String },
});

export default mongoose.model("Subscription", subscriptionSchema);