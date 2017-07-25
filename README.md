# BPnetwork_smartcar

Devices:
	Raspberry_pi3b+ 
	NXP_smartcar game model
	Computer
  
Dependencies：
	Computer：
		opencv3.4
		Numpy
		PiSerial
		Pygame
	
	Raspberry Pi:
		Picamera
		Piserual

	model_car:
		K60
		

Running:
	1.Run pi_stream.py in raspberr_pi firstly.
	2.Run computer_training_date_collect.py in the computer and use joy to control model_car to collet training_date.
	  The date will be saved in a .npz file
	3.Run computer_mlp_training.py in the computer.The network_model will be saved in a .xlm file.
	4.Run computer_mydriver.py in the computer.The model_car should be run automatically 


Note:
	I set up communication between car and computer by HC05 Bluetooth.
    You should download the code into car in advance and make sure your car can be controled by computer's command well