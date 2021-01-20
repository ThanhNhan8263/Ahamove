*** Setting ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  Collections
Library  BuiltIn

Resource  ../Common.robot
Resource   ${EXECDIR}/Resource/Base/BasePage.robot
Resource   ${EXECDIR}/Resource/DB/UserDB.robot


*** Keywords ***
Input Activate Code
    [Arguments]  ${phone}
    ${otp} =  UserDB.Get OTP  ${phone}
    BasePage.Wait And Input  ${TXT_OTP}    ${otp}

Input Invalid Activate Code
    [Arguments]  @{otp}
    BasePage.Wait And Input  ${TXT_OTP}   ${otp}

Error Mess Invalid Activate Code
    BasePage.Wait Visible  ${ERR_CODE}
