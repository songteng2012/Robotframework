*** Keywords ***
添加注册接口
    [Arguments]    ${Kind}    ${Telphone}    ${Password}    ${CollegeName}    ${IsTeacher}    ${CompanyName}    ${City}    ${status1}
    ${dict}    create dictionary    Kind=${Kind}    Telphone=${Telphone}    Password=${Password}    CollegeName=${CollegeName}    IsTeacher=${IsTeacher}    CompanyName=${CompanyName}    City=${City}
    Post_reg_login    Users/register    ${status1}    ${dict}

登录接口
    [Arguments]    ${Account}    ${Password}    ${IsRememberMe}    ${status1}
    ${dict}    create dictionary    Account=${Account}    Password=${Password}    IsRememberMe=${IsRememberMe}
    Post_reg_login    /Users/Login    ${status1}    ${dict}

更新API接口
    [Arguments]    ${UserID}    ${ApiKey}    ${ApiKeyExpire}    ${OperUserID}    ${status1}
    ${dict}    create dictionary    UserID=${UserID}    ApiKey=${ApiKey}    ApiKeyExpire=${ApiKeyExpire}    OperUserID=${OperUserID}
    Put_updateapi    /Users/apikey    ${status1}    ${dict}

登录(获取token)接口
    [Arguments]    ${Account}    ${Password}    ${IsRememberMe}    ${status1}
    ${dict}    create dictionary    Account=${Account}    Password=${Password}    IsRememberMe=${IsRememberMe}
    Post_reg_login    /Users/Login    ${status1}    ${dict}

新增项目接口
    [Arguments]    ${Industry}    ${NetWorkKind}    ${Name}    ${Remark}    ${status1}
    ${dict}    create dictionary    Industry=${Industry}    NetWorkKind=${NetWorkKind}    Name=${Name}    Remark=${Remark}
    Post_token_project_device    Projects    ${status1}    ${dict}

新增设备接口
    [Arguments]    ${Protocol}    ${IsTrans}    ${ProjectIdOrTag}    ${Name}    ${Tag}    ${Coordinate}    ${DeviceImg}    ${IsShare}    ${status1}
    ${dict}    create dictionary    Protocol=${Protocol}    IsTrans=${IsTrans}    ProjectIdOrTag=${ProjectIdOrTag}    Name=${Name}    Tag=${Tag}    Coordinate=${Coordinate}    DeviceImg=${DeviceImg}    IsShare=${IsShare}
    Post_token_project_device    Devices    ${status1}    ${dict}

添加传感器接口
    [Arguments]    ${Name}    ${ApiTag}    ${TransType}    ${DataType}    ${TypeAttrs}    ${Unit}    ${Precision}    ${status1}
    ${dict}    create dictionary    Name=${Name}    ApiTag=${ApiTag}    TransType=${TransType}    DataType=${DataType}    TypeAttrs=${TypeAttrs}    Unit=${Unit}    Precision=${Precision}
    Post_token_Sen_Act    devices/${result3}/Sensors    ${status1}    ${dict}

添加执行器接口
    [Arguments]    ${Name}    ${ApiTag}    ${TransType}    ${DataType}    ${TypeAttrs}    ${OperType}    ${OperTypeAttrs}    ${SerialNumber}    ${status1}
    ${dict}    create dictionary    Name=${Name}    ApiTag=${ApiTag}    TransType=${TransType}    DataType=${DataType}    TypeAttrs=${TypeAttrs}    OperType=${OperType}    OperTypeAttrs=${OperTypeAttrs}    SerialNumber=${SerialNumber}
    Post_token_Sen_Act    devices/${result3}/Sensors    ${status1}    ${dict}

查询设备获取标识符和秘钥接口
    [Arguments]    ${status1}
    ${dict}    create dictionary
    Get_DevTag_seckey    Devices/${result3}    ${status1}    ${dict}
