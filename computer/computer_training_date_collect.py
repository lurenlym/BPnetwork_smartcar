__author__ = 'Ming'

import numpy as np
import cv2
import serial
import pygame
from pygame.locals import *
import socket

class TextPrint:
    def __init__(self):
        self.reset()
        self.font = pygame.font.Font(None, 20)
        self.x = 10
        self.y = 10
        self.line_height = 15
        self.black = (0,   0,   0)

    def print(self, screen, textString):
        textBitmap = self.font.render(textString, True, self.black)
        screen.blit(textBitmap, [self.x, self.y])
        self.y += self.line_height

    def reset(self):
        self.x = 10
        self.y = 10
        self.line_height = 15

    def indent(self):
        self.x += 10

    def unindent(self):
        self.x -= 10

class MyTimer:
    def __init__(self):
        self.et1 = cv2.getTickCount()
        self.et2 = 0

    def mytime(self):
        self.et2 = cv2.getTickCount()
        time1 = (self.et2 - self.et1) / cv2.getTickFrequency()
        print('Streaming duration:', time1)
        self.et1 = cv2.getTickCount()
class CollectTrainingData(object):

    def __init__(self):

        self.server_socket = socket.socket()
        self.server_socket.bind(('192.168.191.1', 8080))
        self.server_socket.listen(0)

        # accept a single connection
        self.connection = self.server_socket.accept()[0].makefile('rb')

        # connect to a seral port
        self.ser = serial.Serial('com3', 115200, timeout=1)
        self.send_inst = True

        # create labels
        self.k = np.zeros((11, 11), 'float')
        for i in range(11):
            self.k[i, i] = 1
        self.temp_label = np.zeros((1, 11), 'float')

        pygame.init()
        self.thistime = MyTimer()
        self.clock = pygame.time.Clock()

# Initialize the joysticks
        pygame.joystick.init()
# Get ready to print
        self.textPrint = TextPrint()

        self.axes = [0, 3]
        self.axis = [0, 0]
        self.collect_image()

    def collect_image(self):

        saved_frame = 0
        total_frame = 0
        screen = pygame.display.set_mode((320,240))
        pygame.display.set_caption("Control")
        # collect images for training
        print('Start collecting images...')
        e1 = cv2.getTickCount()
        image_array = np.zeros((1, 2400))
        label_array = np.zeros((1, 11), 'float')

        # stream video frames one by one
        try:
            stream_bytes =b' '
            frame = 1
            c = 0
            while self.send_inst:
                screen.fill((255,255,255))
                self.textPrint.reset()
                joystick = pygame.joystick.Joystick(0)
                joystick.init()
                self.textPrint.print(screen, "Joystick {}".format(0) )
                self.textPrint.indent()
                stream_bytes += self.connection.read(1024)
                first = stream_bytes.find(b'\xff\xd8')
                last = stream_bytes.find(b'\xff\xd9')
                if first != -1 and last != -1:
                    jpg = stream_bytes[first:last + 2]
                    stream_bytes = stream_bytes[last + 2:]
                    image = cv2.imdecode(np.fromstring(jpg, dtype=np.uint8), 0)

                    # select lower half of the image
                    roi = image[50:170, :]
                    # roi = cv2.GaussianBlur(roi,(15, 15),0)
                    # roi = cv2.threshold(roi, 100, 255, cv2.THRESH_BINARY)[1]
                    #self.thistime.mytime()
                    # save streamed images
                    #cv2.imwrite('training_images/frame{:>05}.jpg'.format(frame), image)

                    # cv2.imshow('roi_image', roi)
                    roi = cv2.resize(roi,(80,30))
                    cv2.imshow('image', roi)

                    # reshape the roi image into one row array
                    temp_array = roi.reshape(1, 2400).astype(np.float32)

                    frame += 1
                    total_frame += 1
                    for event in pygame.event.get(): # User did something
                        if event.type == pygame.JOYAXISMOTION:
                            self.axis[0] = int(round(joystick.get_axis(0)*5))+5
                            self.ser.write(chr(self.axis[0]*10).encode())
                            print(self.axis[0])
                            image_array = np.vstack((image_array, temp_array))
                            label_array = np.vstack((label_array, self.k[self.axis[0]]))
                            saved_frame += 1
                            cv2.imwrite('E:/network_car/network_car_joy/photo2/image'+str(c)+'.jpg', roi)
                            c = c + 1
                        if event.type == KEYDOWN:
                            key_input = pygame.key.get_pressed()
                            if key_input[pygame.K_x] or key_input[pygame.K_q]:
                                print('exit')
                                self.send_inst = False
                                break
                    self.axis[0] = int(round(joystick.get_axis(0)*5))+5
                    #self.axis[1] = int(joystick.get_axis(3)*5)+5
                    self.textPrint.print(screen, "Number of axes: {}".format(self.axes))
                    self.textPrint.indent()
                    self.textPrint.print(screen, "Axis {} value: {:>6.3f}".format(0, self.axis[0]))
                    #self.textPrint.print(screen, "Axis {} value: {:>6.3f}".format(3, self.axis[1]))

                    self.textPrint.unindent()
                    self.textPrint.unindent()
                    pygame.display.flip()
                    #self.clock.tick(10)
                    # get input from human driver
                    # self.ser.write(date_to_send.encode())
                    for event in pygame.event.get(): # User did something
                        if event.type == pygame.QUIT:
                            print('exit')
                            self.send_inst = False
                            break
                    #self.thistime.mytime()



			# save training images and labels
            train = image_array[1:, :]
            train_labels = label_array[1:, :]

            # save training data as a numpy file
            np.savez("training_data_temptest050802.npz", train=train, train_labels=train_labels)

            e2 = cv2.getTickCount()
            # calculate streaming duration
            time0 = (e2 - e1) / cv2.getTickFrequency()
            print('Streaming duration:', time0)

            print(train.shape)
            print(train_labels.shape)
            print('Total frame:', total_frame)
            print('Saved frame:', saved_frame)
            print('Dropped frame', total_frame - saved_frame)

        finally:
            self.connection.close()
            self.server_socket.close()

if __name__ == '__main__':
    CollectTrainingData()



