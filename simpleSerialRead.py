import serial
#Physical serial: 8
#Bluetooth: 5
port = 'COM5'
speed = 115200
ser = serial.Serial(port, speed, timeout=1)
#ser.open()
for i in range(0,100):
    data = ser.readline()
    print(data)
ser.close()
