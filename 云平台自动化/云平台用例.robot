*** Settings ***
Library           RequestsLibrary
Library           Collections
Library           TCPClient.py
Resource          公共关键字.robot
Resource          云平台接口.robot
Library           String

*** Variables ***

*** Test Cases ***
添加注册
    [Setup]
    [Template]    添加注册接口
    2    18668102621    111111    College_123456    ${EMPTY}    Company_1234567    ${EMPTY}    1    #注册用户
    [Teardown]

登录
    [Template]    登录接口
    18668102621    111111    1    0    #登录

更新API
    [Template]    更新API接口
    ${result1}    SONGTENG346457    2021-12-31    ${result1}    1

登录(获取token)
    [Template]    登录(获取token)接口
    18668102621    111111    1    0    #登录

新增项目
    [Template]    新增项目接口
    5    2    Project_123    ${EMPTY}    0

新增设备
    [Template]    新增设备接口
    1    true    ${result3}    Dev_123     ${result6}    ${EMPTY}    ${EMPTY}    true    0

添加一个传感器
    [Template]    添加传感器接口
    传感器001    Sensor_001    0    1    ${EMPTY}    ${EMPTY}    2    0

添加一个执行器
    [Template]    添加执行器接口
    执行器001    Actor_001    1    2    ${EMPTY}    1    ${EMPTY}    0    0

查询设备获取标识符和秘钥
    [Template]    查询设备获取标识符和秘钥接口
    0

TCP上报数据
    Tcpclient    ${result4}    ${result5}

*** Keywords ***
