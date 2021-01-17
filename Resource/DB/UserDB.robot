*** Setting ***
Library  MongoDBLibrary
Library  JSONLibrary
Library  Collections

Resource   ${EXECDIR}/Resource/DB/MongoDB.robot
*** Keywords ***
Get OTP
    [Arguments]  ${id}
    &{user_ref_id} =  MongoDB.Get Field  ahamove  user  {"_id": "${id}"}  activation_code
    Log  ${user_ref_id.activation_code}
    [return]  ${user_ref_id.activation_code}

Get User Id
    [Arguments]  ${id}
    &{user_id} =  MongoDB.Get Field  ahamove  user  {"_id": "${id}"}  _id
    Log  ${user_id}
    [return]  ${user_id._id}

Get User Email
    [Arguments]  ${email}
    &{user_email} =  MongoDB.Get Field  ahamove  user  {"email": "${email}"}  email
    Log  ${user_email.email}
    [return]  ${user_email.email}

Get Blank Field User Type Categories Category
    [Arguments]  ${id}
    &{user_type} =  MongoDB.Get Blank Field  ahamove  user  {"_id": "${id}"}  user_type

Get Exist Field User Type Categories Category
    [Arguments]  ${id}
    &{user_type} =  MongoDB.Get Exist Field  ahamove  user  {"_id": "${id}"}  user_type


#*** Test Cases ***
#Get OT
#    Open Browser  https://appstg.ahamove.com/sign-in  chrome
#    BasePage.Wait And Input  ${TXT_PHONE}  84910000005
#    BasePage.Wait And Click  ${BTN_LOGIN}
#    ${otp} =  Get OTP  84910000005
#    Input Activate Code  ${otp}





