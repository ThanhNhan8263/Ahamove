*** Setting ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  Collections
Library  BuiltIn


Resource   ${EXECDIR}/Resource/DB/UserDB.robot
Resource   ${EXECDIR}/Resource/DB/User_referralDB.robot
Resource   ${EXECDIR}/Resource/Base/FakeData.robot
Resource   ${EXECDIR}/Resource/Base/BasePage.robot

*** Keywords ***
Input User Info
    @{data_info} =  FakeData.Fake Data Info
    Set Global Variable  @{data_info}  @{data_info}
    BasePage.Wait And Input  ${TXT_NAME}  ${data_info}[0]
    BasePage.Wait And Input  ${TXT_EMAIL}  ${data_info}[1]
    BasePage.Wait And Input  ${TXT_PHONE_SIGNUP}  ${data_info}[2]

Input Name
    [Arguments]  ${name}
    BasePage.Wait And Input  ${TXT_NAME}  ${name}

Input Email
    [Arguments]  ${email}
    BasePage.Wait And Input  ${TXT_EMAIL}  ${email}

Input Phone
    [Arguments]  ${phone}
    BasePage.Wait And Input  ${TXT_PHONE_SIGNUP}  ${phone}

Input Referral Code
    [Arguments]  ${ref}
    BasePage.Wait And Input  ${TXT_REF}  ${ref}

Click Button Sign Up
    Click Button  ${BTN_SIGNUP}

Show Error Message Blank Name
    BasePage.Wait visible  ${ERR_BLANK_NAME}
Show Error Message Blank Email
    BasePage.Wait visible  ${ERR_BLANK_EMAIL}
Show Error Message Blank Phone
    BasePage.Wait visible  ${ERR_BLANK_PHONE}
Show Error Message Blank Category
    BasePage.Wait visible  ${ERR_BLANK_CAT}

Show Error Message Invalid Name
    BasePage.Wait visible  ${ERR_INVALID_NAME}
Show Error Message Invalid Email
    BasePage.Wait visible  ${ERR_INVALID_EMAIL}
Show Error Message Invalid Phone
    BasePage.Wait visible  ${ERR_INVALID_PHONE}

Error Existed Mail
    BasePage.Wait Page Contains  Email này đã được đăng ký

Button SignUp Is Disable
    BasePage.Wait Visible  ${BTN_SIGNUP_DISABLE}

Error Referral Code
    BasePage.Wait Page Contains  Mã giới thiệu không tồn tại

Click Menu Category
    BasePage.Wait And Click  ${MNU_CAT}

Verify User Info
    [Arguments]  ${user_type}  ${cat}  ${subcat}
    ${phone} =  Get Substring  ${data_info}[2]  1
    ${phone} =  Set Variable  84${phone}
    @{user_info} =  UserDB.Get User Info When Sign Up  ${phone}
    Should Be Equal As Strings  ${phone}  ${user_info}[0]  msg=Fail
    Should Be Equal As Strings  ${data_info}[0]  ${user_info}[1]  msg=Fail
    Should Be Equal As Strings  ${data_info}[1]  ${user_info}[2]  msg=Fail
    Should Be Equal As Strings  ${user_type}  ${user_info}[3]  msg=Fail
    Should Be Equal As Strings  ${cat}  ${user_info}[4]  msg=Fail
    Should Be Equal As Strings  ${subcat}  ${user_info}[5]  msg=Fail
    Log  ${user_info}

Verify Referral Info
    [Arguments]  ${referral_code}
    ${referee_id} =  User_referralDB.Get Referral Info  ${data_info}[2]
    ${referrer_id} =  Remove String  ${referral_code}  0
    ${referrer_id} =  Set Variable  84${referrer_id}
    Should Be Equal As Strings  ${referee_id}  ${referrer_id}  msg=Fail

Verify Referral Info Not Phone
    [Arguments]  ${referral_code}
    ${referrer_ref_code} =  Get User Id Form Referral Code  ${referral_code}
    ${referee_ref_id} =  Get Referral Id From Id  ${data_info}[2]
    Should Be Equal As Strings  ${referrer_ref_code}  ${referee_ref_id}  msg=Fail

Verify Phone Existed
    [Arguments]  ${id}
    ${user_id} =  UserDB.Get User Id  ${id}
    Should Be Equal As Strings  ${user_id}  ${id}  msg=Fail

Verify Email Existed
    [Arguments]  ${email}
    ${user_email} =  UserDB.Get User Email  ${email}
    Should Be Equal As Strings  ${user_email}  ${email}  msg=Fail












#*** Test Cases ***
#Input data
#    Open Browser  https://appstg.ahamove.com/sign-up  chrome
#    Input user info
#    Close Browser




