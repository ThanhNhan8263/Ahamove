*** Setting ***
Library  MongoDBLibrary
Library  JSONLibrary
Library  Collections

Resource   ${EXECDIR}/Resource/DB/MongoDB.robot
############## What is ${data} ????? #########
*** Keywords ***
Get User Id
    [Arguments]  ${data}
    &{user_id} =  MongoDB.Get Field  ahamove  user  {"_id": "${data}"}  _id
    Log  ${user_id}
    [return]  ${user_id._id}

Get User Email
    [Arguments]  ${data}
    &{user_email} =  MongoDB.Get Field  ahamove  user  {"email": "${data}"}  email
    Log  ${user_email.email}

Get Blank User Id
    [Arguments]  ${data}
    &{user_id} =  MongoDB.Get Blank Records  ahamove  user  {"_id": "${data}"}
    Log  ${user_id}

Get User Info When Sign Up
    [Arguments]  ${data}
    &{user_info} =  MongoDB.Get Records  ahamove  user  {"_id": "${data}"}
    @{user_info} =  Create List  ${user_info._id}  ${user_info.name}  ${user_info.email}  ${user_info.user_type}  ${user_info.categories[0].code}  ${user_info.categories[0].child_code[0]}
    Log  ${user_info}
    [return]  @{user_info}


#*** Test Cases ***
#Get abc
#    Get category info when sign up  84981875523


