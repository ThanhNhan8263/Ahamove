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

Get User Email
    [Arguments]  ${email}
    &{user_email} =  MongoDB.Get Field  ahamove  user  {"email": "${email}"}  email
    Log  ${user_email.email}
    [return]  ${user_email.email}

Get Blank User Id
    [Arguments]  ${id}
    &{user_id} =  MongoDB.Get Blank Records  ahamove  user  {"_id": "${id}"}
    Log  ${user_id}

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












#*** Test Cases ***
#Get abc
#    ${referrer_ref_code} =  Get User Id Form Referral Code  0981875523
#    ${referee_ref_id} =  Get Referral Id From Id  84922936471
#    Should Be Equal As Strings  ${referrer_ref_code}  ${referee_ref_id}  msg=Fail



