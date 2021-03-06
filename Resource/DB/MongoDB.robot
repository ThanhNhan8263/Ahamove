*** Setting ***
Library  MongoDBLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
&{HOST}  stg=mongodb+srv://admin:Aha2020@ahamove-sz8j3.mongodb.net/?ssl=true&ssl_cert_reqs=CERT_NONE  uat=mongodb+srv://nhanddt:acftjJZLTG6LAMq7@ahamove-uat.sjm3i.mongodb.net/?ssl=true&ssl_cert_reqs=CERT_NONE
${DB_ENV} =  stg

*** Keywords ***
Get Records
    [Arguments]  ${dbName}  ${dbCollName}  ${recordJSON}
    Connect To Mongodb  ${HOST.${DB_ENV}}  ${27017}
    @{allResults}  Retrieve Some MongoDB Records  ${dbName}  ${dbCollName}  ${recordJSON}  True
    &{dict} =  Set To Dictionary  @{allResults}
    Log  ${dict}
    [return]  &{dict}
    Disconnect From MongoDB

Get Blank Records
    [Arguments]  ${dbName}  ${dbCollName}  ${recordJSON}
    Connect To Mongodb  ${HOST.${DB_ENV}}  ${27017}
    @{allResults}  Retrieve Some MongoDB Records  ${dbName}  ${dbCollName}  ${recordJSON}  True
    Should Be Equal As Strings  ${allResults}  []
    Disconnect From MongoDB


Get Field
    [Arguments]  ${dbName}  ${dbCollName}  ${recordJSON}  ${recordField}
    Connect To Mongodb  ${HOST.${DB_ENV}}  ${27017}
    @{allResults}  Retrieve Mongodb Records With Desired Fields  ${dbName}  ${dbCollName}  ${recordJSON}  ${recordField}  True  True
    log  ${allResults}
    &{dict} =  Set To Dictionary  @{allResults}
    [return]  &{dict}
    Disconnect From MongoDB

Get Blank Field
    [Arguments]  ${dbName}  ${dbCollName}  ${recordJSON}  ${recordField}
    Connect To Mongodb  ${HOST.${DB_ENV}}  ${27017}
    @{allResults}  Retrieve Mongodb Records With Desired Fields  ${dbName}  ${dbCollName}  ${recordJSON}  ${recordField}  False  True
    log  ${allResults}
    Should Be Equal As Strings  ${allResults}  [{}]
    Disconnect From MongoDB

Get Exist Field
    [Arguments]  ${dbName}  ${dbCollName}  ${recordJSON}  ${recordField}
    Connect To Mongodb  ${HOST.${DB_ENV}}  ${27017}
    @{allResults}  Retrieve Mongodb Records With Desired Fields  ${dbName}  ${dbCollName}  ${recordJSON}  ${recordField}  False  True
    log  ${allResults}
    Should Not Be Equal As Strings  ${allResults}  [{}]
    Disconnect From MongoDB

Get Field And Return Array
    [Arguments]  ${dbName}  ${dbCollName}  ${recordJSON}  ${recordField}
    Connect To Mongodb  ${HOST.${DB_ENV}}  ${27017}
    @{allResults}  Retrieve Mongodb Records With Desired Fields  ${dbName}  ${dbCollName}  ${recordJSON}  ${recordField}  False  True
    log  ${allResults}
    [return]  ${allResults}
    Disconnect From MongoDB








#Delete Records
#    [Arguments]  ${dbName}  ${dbCollName}  ${recordJSON}
#    Connect To Mongodb  ${HOST.${DB_ENV}}  ${27017}
#    ${allResults}  Remove MongoDB Records  ${dbName}  ${dbCollName}  ${recordJSON}
#    Log  ${allResults}
#    ${allResults}  Retrieve All MongoDB Records  ${dbName}  ${dbCollName}  ${recordJSON}
#    Should Not Contain  ${allResults}  'timestamp', 1
#    Disconnect From MongoDB


#*** Test Cases ***
#Get spample
#    &{user_category} =  Get Records  ahamove  user  {"_id":"84981875523"}
#    Log  ${user_category.name}

