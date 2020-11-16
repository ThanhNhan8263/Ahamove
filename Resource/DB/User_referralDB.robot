*** Setting ***
Library  MongoDBLibrary
Library  JSONLibrary
Library  Collections
Library  SeleniumLibrary
Library  String

Resource   ${EXECDIR}/Resource/DB/MongoDB.robot

*** Keywords ***
Get Referral Info
    [Arguments]  ${id}
    &{user_ref} =  MongoDB.Get Records  ahamove  user_referral  {"referee_id": "${id}"}
    Log  ${user_ref.referrer_id}
    [return]  ${user_ref.referrer_id}

Get abc
    [Arguments]  ${id}
    ${referee_id} =  Get Referral Info  84185640138
    ${referrer_id} =  Remove String  ${id}  0
    ${referrer_id} =  Set Variable  84${referrer_id}
    Should Be Equal As Strings  ${referee_id}  ${referrer_id}  msg=Fail











#*** Test Cases ***
#Get sample
#    Get abc  0981875523