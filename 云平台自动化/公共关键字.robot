*** Keywords ***
Post_reg_login
    [Arguments]    ${path}    ${status1}    ${dict}
    Create Session    event    http://api.nlecloud.com:80
    ${headers}    Create Dictionary    Content-Type=application/json
    ${payload}=    Create Dictionary
    FOR    ${key}    IN    @{dict.keys()}
        set to dictionary    ${payload}    ${key}    ${dict['${key}']}
    END
    log    ${payload}
    ${r}=    Post Request    event    ${path}    data=${payload}    headers=${headers}
    Should Be Equal As Strings    ${r.status_code}    200
    ${resp}    Set variable    ${r.json()}
    log    ${resp}
    ${stu}    Get From Dictionary    ${resp}    Status
    ${status2}    Evaluate    int(${status1})
    Should Be Equal    ${stu}    ${status2}
    Comment    登录接口获取USerID    如果有USerIDkey,则获取值，没有的话赋值为default,并设置为全局变量
    ${flag}    ${UserID}    Run Keyword And Ignore Error    Get From Dictionary    ${resp}[ResultObj]    UserID
    ${value}    Set Variable    default
    ${result1}    Set Variable If    '${flag}'=='FAIL'    ${value}    ${UserID}
    Set Global Variable    ${result1}
    Comment    登录(获取token)接口获取AccessToken    如果有AccessTokenkey,则获取值，没有的话赋值为default,并设置为全局变量
    ${flag}    ${AccessToken}    Run Keyword And Ignore Error    Get From Dictionary    ${resp}[ResultObj]    AccessToken
    ${value}    Set Variable    default
    ${result2}    Set Variable If    '${flag}'=='FAIL'    ${value}    ${AccessToken}
    Set Global Variable    ${result2}

Put_updateapi
    [Arguments]    ${path}    ${status1}    ${dict}
    Create Session    event    http://api.nlecloud.com:80
    ${headers}    Create Dictionary    Content-Type=application/json
    ${payload}=    Create Dictionary
    FOR    ${key}    IN    @{dict.keys()}
        set to dictionary    ${payload}    ${key}    ${dict['${key}']}
    END
    log    ${payload}
    ${r}=    Put Request    event    ${path}    data=${payload}    headers=${headers}
    Should Be Equal As Strings    ${r.status_code}    200
    ${resp}    Set variable    ${r.json()}
    log    ${resp}
    ${stu}    Get From Dictionary    ${resp}    Status
    ${status2}    Evaluate    int(${status1})
    Should Be Equal    ${stu}    ${status2}

Post_token_project_device
    [Arguments]    ${path}    ${status1}    ${dict}
    Create Session    event    http://api.nlecloud.com:80
    ${headers}    Create Dictionary    Content-Type=application/json    AccessToken=${result2}
    ${payload}=    Create Dictionary
    FOR    ${key}    IN    @{dict.keys()}
        set to dictionary    ${payload}    ${key}    ${dict['${key}']}
    END
    log    ${payload}
    ${r}=    Post Request    event    ${path}    data=${payload}    headers=${headers}
    Should Be Equal As Strings    ${r.status_code}    200
    ${resp}    Set variable    ${r.json()}
    log    ${resp}
    ${stu}    Get From Dictionary    ${resp}    Status
    ${status2}    Evaluate    int(${status1})
    Should Be Equal    ${stu}    ${status2}
    Comment    设置设备deviceTag为随机
    ${result6}    Generate Random String    10    [LETTERS]    #成10位大小写英文字符串
    Set Global Variable    ${result6}
    Comment    ProjectID、deviceId    如果有ProjectIDkey,则获取值，没有的话赋值为default,并设置为全局变量
    ${flag}    ${Project_deviceID}    Run Keyword And Ignore Error    Get From Dictionary    ${resp}    ResultObj
    ${value}    Set Variable    default
    ${result3}    Set Variable If    '${flag}'=='FAIL'    ${value}    ${Project_deviceID}
    Set Global Variable    ${result3}

Post_token_Sen_Act
    [Arguments]    ${path}    ${status1}    ${dict}
    Create Session    event    http://api.nlecloud.com:80
    ${headers}    Create Dictionary    Content-Type=application/json    AccessToken=${result2}
    ${payload}=    Create Dictionary
    FOR    ${key}    IN    @{dict.keys()}
        set to dictionary    ${payload}    ${key}    ${dict['${key}']}
    END
    log    ${payload}
    ${r}=    Post Request    event    ${path}    data=${payload}    headers=${headers}
    Should Be Equal As Strings    ${r.status_code}    200
    ${resp}    Set variable    ${r.json()}
    log    ${resp}
    ${stu}    Get From Dictionary    ${resp}    Status
    ${status2}    Evaluate    int(${status1})
    Should Be Equal    ${stu}    ${status2}

Get_DevTag_seckey
    [Arguments]    ${path}    ${status1}    ${dict}
    Create Session    event    http://api.nlecloud.com:80
    ${headers}    Create Dictionary    Content-Type=application/json    AccessToken=${result2}
    ${payload}=    Create Dictionary
    FOR    ${key}    IN    @{dict.keys()}
        set to dictionary    ${payload}    ${key}    ${dict['${key}']}
    END
    log    ${payload}
    ${r}=    Get Request    event    ${path}    headers=${headers}    params=${payload}
    Should Be Equal As Strings    ${r.status_code}    200
    ${resp}    Set variable    ${r.json()}
    log    ${resp}
    ${stu}    Get From Dictionary    ${resp}    Status
    ${status2}    Evaluate    int(${status1})
    Should Be Equal    ${stu}    ${status2}
    Comment    DevTag    如果有DevTag,则获取值，没有的话赋值为default,并设置为全局变量
    ${flag}    ${DevTag}    Run Keyword And Ignore Error    Get From Dictionary    ${resp}[ResultObj]    Tag
    ${value}    Set Variable    default
    ${result4}    Set Variable If    '${flag}'=='FAIL'    ${value}    ${DevTag}
    Set Global Variable    ${result4}
    Comment    seckey    如果有seckey,则获取值，没有的话赋值为default,并设置为全局变量
    ${flag}    ${seckey}    Run Keyword And Ignore Error    Get From Dictionary    ${resp}[ResultObj]    SecurityKey
    ${value}    Set Variable    default
    ${result5}    Set Variable If    '${flag}'=='FAIL'    ${value}    ${seckey}
    Set Global Variable    ${result5}
