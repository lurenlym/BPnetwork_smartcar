__author__ = 'Mind'

import cv2
import numpy as np
import glob
import matplotlib.pyplot as plt

print('Loading training data...')
e0 = cv2.getTickCount()

# load training data
image_array = np.zeros((1, 38400))
label_array = np.zeros((1, 11), 'float')
training_data = glob.glob('training_data_temptest0407.npz')

for single_npz in training_data:
    with np.load(single_npz) as data:
        print(data.files)
        train_temp = data['train']
        train_labels_temp = data['train_labels']
        print(train_temp.shape)
        print(train_labels_temp.shape)
    image_array = np.vstack((image_array, train_temp))
    label_array = np.vstack((label_array, train_labels_temp))

train = image_array[1:, :]
train_labels = label_array[1:, :]
print(train.shape)
print(train_labels.shape)

image_array = np.zeros((1, 38400))
label_array = np.zeros((1, 11), 'float')
training_data = glob.glob('training_data_temptest0408.npz')

for single_npz in training_data:
    with np.load(single_npz) as data:
        print(data.files)
        train_temp = data['train']
        train_labels_temp = data['train_labels']
        print(train_temp.shape)
        print(train_labels_temp.shape)
    image_array = np.vstack((image_array, train_temp))
    label_array = np.vstack((label_array, train_labels_temp))

test = image_array[1:, :]
test_labels = label_array[1:, :]
print(test.shape)
print(test_labels.shape)

e00 = cv2.getTickCount()
time0 = (e00 - e0)/ cv2.getTickFrequency()
print('Loading image duration:%f'%time0)

# set start time
e1 = cv2.getTickCount()

# create MLP
layer_sizes = np.int32([38400, 50, 11]) #250：92.40 200：86.38 50：81.93
model = cv2.ml.ANN_MLP_create()
model.setLayerSizes(layer_sizes)
model.setTrainMethod(cv2.ml.ANN_MLP_BACKPROP)
model.setBackpropMomentumScale(0.01)
model.setBackpropWeightScale(0.1)
model.setTermCriteria((cv2.TERM_CRITERIA_COUNT| cv2.TERM_CRITERIA_EPS, 50, 0.001))
model.setActivationFunction(cv2.ml.ANN_MLP_SIGMOID_SYM, 0.2, 1)
#model.setActivationFunction(cv2.ml.ANN_MLP_SIGMOID_SYM, 0.5, 1)

print('Training MLP ...')
num_iter = model.train(np.float32(train), cv2.ml.ROW_SAMPLE, np.float32(train_labels))

# set end time
e2 = cv2.getTickCount()
time = (e2 - e1)/cv2.getTickFrequency()
print('Training duration:%f'% time)

# save param
model.save('mlp_mlp2.xml')

#print('Ran for %d iterations'% num_iter)

ret, resp = model.predict(train)
prediction = resp.argmax(-1)
#print('Prediction:', prediction)
true_labels = train_labels.argmax(-1)
#print('True labels:', true_labels)
number = prediction.shape[0]

print('Testing...')
train_rate0 = np.mean(prediction == true_labels)
train_rate1 = np.mean(prediction == true_labels+1)
train_rate2 = np.mean(prediction == true_labels-1)
train_rate = train_rate0 + train_rate1 + train_rate2
print('Train rate: %f:' % (train_rate0*100))
print('Train rate: %f:' % (train_rate*100))
plt.plot(range(number), prediction, 'b')
plt.plot(range(number), true_labels, 'r')

ret2, resp2 = model.predict(test)
prediction2 = resp2.argmax(-1)
#print('Prediction:', prediction)
true_test_labels = test_labels.argmax(-1)
#print('True labels:', true_labels)
number = prediction2.shape[0]

print('Testing...')
test_rate0 = np.mean(prediction2 == true_test_labels)
test_rate1 = np.mean(prediction2 == true_test_labels+1)
test_rate2 = np.mean(prediction2 == true_test_labels-1)
test_rate2 = test_rate0 + test_rate1 + test_rate2
print('Train rate: %f:' % (test_rate0*100))
print('Train rate: %f:' % (test_rate2*100))

plt.show()