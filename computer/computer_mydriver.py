__author__ = 'Ming'

import threading
import socket
import serial
import cv2
import numpy as np
import math
import sys

# distance data measured by ultrasonic sensor
sensor_data =b""

class NeuralNetwork(object):

    def __init__(self):
        self.annmodel = cv2.ml.ANN_MLP_load('mlp_mlp2.xml')


    def predict(self, samples):
        ret, resp = self.annmodel.predict(samples)
        return resp.argmax(-1)  #find max



class Car_Control(object):

    def __init__(self):
        self.serial_port = serial.Serial('com3', 115200, timeout=1)
    def steer(self, prediction):
        self.serial_port.write(chr(prediction*10).encode())
        print('', prediction)






class VideoDateHandle(object):

    # create neural network
    def __init__(self):
        self.model = NeuralNetwork()
        self.my_car = Car_Control()
        self.server_socket = socket.socket()
        self.server_socket.bind(('192.168.191.1', 8080))
        self.server_socket.listen(0)
        self.connection = self.server_socket.accept()[0].makefile('rb')
        self.handle()

    def handle(self):
        stream_bytes = b' '
        et1 = cv2.getTickCount()
        # stream video frames one by one
        try:
            while True:
                stream_bytes += self.connection.read(1024)
                first = stream_bytes.find(b'\xff\xd8')
                last = stream_bytes.find(b'\xff\xd9')
                if first != -1 and last != -1:
                    jpg = stream_bytes[first:last+2]
                    stream_bytes = stream_bytes[last+2:]
                    gray = cv2.imdecode(np.fromstring(jpg, dtype=np.uint8), 0)
                    image = cv2.imdecode(np.fromstring(jpg, dtype=np.uint8), -1)
                    # lower half of the image
                    half_gray = gray[50:170, :]
                    half_img = image[50:170, :]

                    half_gray = cv2.GaussianBlur(half_gray,(15, 15),0)
                    half_gray = cv2.threshold(half_gray, 100, 255, cv2.THRESH_BINARY)[1]
                    # reshape image
                    image_array = half_gray.reshape(1, 38400).astype(np.float32)
                    # neural network makes prediction

                    prediction = self.model.predict(image_array)
                    # et2 = cv2.getTickCount()
                    # time1 = (et2 - et1)/ cv2.getTickFrequency()
                    # print("time1:",time1)
                    # et1 = cv2.getTickCount()
                    cv2.putText(half_gray,"{}".format(prediction), (5, 20), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 255, 255))
                    cv2.imshow('image', half_gray)

                    self.my_car.steer(prediction)
                    if cv2.waitKey(1) & 0xFF == ord('q'):
                        break
            cv2.destroyAllWindows()

        finally:
            self.connection.close()
            self.server_socket.close()



if __name__ == '__main__':
    VideoDateHandle()
