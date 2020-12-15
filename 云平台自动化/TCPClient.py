#coding=utf-8
import socket
from time import sleep
import time
import datetime






def tcpclient(device_tag,SecretKey):

    time_format = '%Y-%m-%d %X'
    s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
    s.connect(('117.78.1.201',8600))
    bdevice_tag = device_tag.encode()
    bSecretKey = SecretKey.encode()
    bconnect_cmd = b'{"t":1,"device":"' + bdevice_tag + b'","key":"' + bSecretKey + b'","ver":"v1.3"}\r'
    s.send(bconnect_cmd)
    start = datetime.datetime.now()
    Sensor_tag ="Sensor_001"
    bSensor_tag = Sensor_tag.encode()
    while True:
        end = datetime.datetime.now()
        if ((end - start).seconds > 60):
            break
        current_time = time.strftime(time_format,time.localtime())
        bcurrent_time = current_time.encode()
        bdata_cmd = b'{"t":3,"datatype":2,"datas":{"' + bSensor_tag + b'":{"' + bcurrent_time + b'":22.5}},"msgid":123}\r'
        s.send(bdata_cmd)
        sleep(3)
        continue
    s.close()


tcpclient("Devtag_123","a9f4deeaddf940bf8d57addb71f66a3b")
