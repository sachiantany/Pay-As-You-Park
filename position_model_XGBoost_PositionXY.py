#!/usr/bin/env python
# coding: utf-8

# In[29]:


import numpy as np
import pandas as pd

import xgboost as xgb

data = []
labels = []


def get_train_data_X():
    with open("D:/4th-Year/Research Proposal/Dataset/Indoor_Positioning_Beacon/beacon_readings_train.csv", "r") as fp:
        emp_data = fp.readlines()
        B = []
        X = []
        cnt = 1
        for line in emp_data:
            line = line.strip()
            arr = line.split(',')
            X.append( float(arr[3]) )
            B.append([ float(arr[0]), float(arr[1]), float(arr[2]) ])
            cnt += 1
            #X.append(int(arr[0]))
        return B, X
    
def get_train_data_Y():
    with open("D:/4th-Year/Research Proposal/Dataset/Indoor_Positioning_Beacon/beacon_readings_train.csv", "r") as fp:
        emp_data = fp.readlines()
        B = []
        Y = []
        cnt = 1
        for line in emp_data:
            line = line.strip()
            arr = line.split(',')
            Y.append( float(arr[4]) )
            B.append([ float(arr[0]), float(arr[1]), float(arr[2]) ])
            cnt += 1
            #X.append(int(arr[0]))
        return B, Y    

dataX, labelsX = get_train_data_X()
dataY, labelsY = get_train_data_Y()

dataX = np.array(dataX)
labelsX = np.array(labelsX)
dataY = np.array(dataY)
labelsY = np.array(labelsY)

#data = np.random.rand(5,10) # 5 entities, each contains 10 features
#labels = np.random.randint(2, size=5) # binary target

T_trainX_xgb = xgb.DMatrix(dataX, label=labelsX)
T_trainY_xgb = xgb.DMatrix(dataY, label=labelsY)

#params = {"objective": "reg:linear", "booster":"gblinear"}
params = {'bst:max_depth':6, 'bst:eta':1, 'gamma':15, 'silent':1, 'booster':'gblinear', 'objective':'reg:linear' }
params['nthread'] = 4
params['eval_metric'] = 'mae'
#params['updater'] = 'grow_gpu'


evallistX  = [(T_trainX_xgb,'eval'), (T_trainX_xgb,'train')]


evallistY  = [(T_trainY_xgb,'eval'), (T_trainY_xgb,'train')]
num_round = 100

print("################################Training Eval and Train Values of X##########################################")  
gbmX = xgb.train(params, T_trainX_xgb, num_round, evallistX)
print("################################Training Eval and Train Values of Y##########################################") 
gbmY = xgb.train(params, T_trainY_xgb, num_round, evallistY)

X_pred = gbmX.predict(xgb.DMatrix(dataX, labelsX))
Y_pred = gbmY.predict(xgb.DMatrix(dataY, labelsY))

print("################################Predict and Target Values of X##########################################")    
for i in range(len(X_pred)):
    print ("Predicted X: " + str(X_pred[i]) + " Target X: " + str(labelsX[i]) + " Difference: " + str(X_pred[i] - labelsX[i]))

print("################################Predict and Target Values of Y##########################################")    
for i in range(len(Y_pred)):
    print ("Predicted Y: " + str(Y_pred[i]) + " Target Y: " + str(labelsY[i]) + " Difference: " + str(Y_pred[i] - labelsY[i]))


# In[ ]:





# In[ ]:




