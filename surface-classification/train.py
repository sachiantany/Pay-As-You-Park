import dataset
import tensorflow as tf
import time
from datetime import timedelta
import math
import random
import numpy as np
import os
tf.compat.v1.disable_eager_execution()
#Adding Seed so that random initialization is consistent
from numpy.random import seed
seed(1)
# from tensorflow import set_random_seed
tf.random.set_seed(2)

batch_size = 32

#Prepare input data
classes = os.listdir('training_data')
num_classes = len(classes)

# 20% of the data will automatically be used for validation
validation_size = 0.2
img_size = 128
num_channels = 3
train_path='training_data'

# Training the dataset
data = dataset.read_train_sets(train_path, img_size, classes, validation_size=validation_size)
