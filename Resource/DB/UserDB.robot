*** Setting ***
Library  MongoDBLibrary
Library  JSONLibrary
Library  Collections

Resource   ${EXECDIR}/Resource/DB/MongoDB.robot
*** Keywords ***
Get User Id
    [Arguments]  ${id}
    &{user_id} =  MongoDB.Get Field  ahamove  user  {"_id": "${id}"}  _id
    Log  ${user_id}
    [return]  ${user_id._id}

Get Blank User Id
    [Arguments]  ${id}
    &{user_id} =  MongoDB.Get Blank Records  ahamove  user  {"_id": "${id}"}
    Log  ${user_id}

Get User Email
    [Arguments]  ${email}
    &{user_email} =  MongoDB.Get Field  ahamove  user  {"email": "${email}"}  email
    Log  ${user_email.email}
    [return]  ${user_email.email}

Get User Info When Sign Up
    [Arguments]  ${id}
    &{user_info} =  MongoDB.Get Records  ahamove  user  {"_id": "${id}"}
    @{user_info} =  Create List  ${user_info._id}  ${user_info.name}  ${user_info.email}  ${user_info.user_type}  ${user_info.categories[0].code}  ${user_info.categories[0].child_code[0]}
    Log  ${user_info}
    [return]  @{user_info}

Get User Id Form Referral Code
    [Arguments]  ${id}
    &{user_ref} =  MongoDB.Get Field  ahamove  user  {"referral_code": "${id}"}  _id
    Log  ${user_ref._id}
    [return]  ${user_ref._id}

Get Referral Id From Id
    [Arguments]  ${id}
    &{user_ref_id} =  MongoDB.Get Field  ahamove  user  {"_id": "${id}"}  referral_id
    Log  ${user_ref_id.referral_id}
    [return]  ${user_ref_id.referral_id}

Get OTP
    [Arguments]  ${id}
    &{user_ref_id} =  MongoDB.Get Field  ahamove  user  {"_id": "${id}"}  activation_code
    Log  ${user_ref_id.activation_code}
    [return]  ${user_ref_id.activation_code}

Get Blank Field User Type Categories Category
    [Arguments]  ${id}
    &{user_type} =  MongoDB.Get Blank Field  ahamove  user  {"_id": "${id}"}  user_type

Get Exist Field User Type Categories Category
    [Arguments]  ${id}
    &{user_type} =  MongoDB.Get Exist Field  ahamove  user  {"_id": "${id}"}  user_type

Get Verify Status
    [Arguments]  ${id}
    &{user_ref_id} =  MongoDB.Get Field  ahamove  user  {"_id": "${id}"}  verify_status
    Log  ${user_ref_id.verify_status}
    [return]  ${user_ref_id.verify_status}







#*** Test Cases ***
#Get sample
#    Get verify status  84981875523


#Get OT
#    Open Browser  https://appstg.ahamove.com/sign-in  chrome
#    BasePage.Wait And Input  ${TXT_PHONE}  84910000005
#    BasePage.Wait And Click  ${BTN_LOGIN}
#    ${otp} =  Get OTP  84910000005
#    Input Activate Code  ${otp}





