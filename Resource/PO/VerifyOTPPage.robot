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
    BasePage.Wait And Input  ${TXT_OTP1}   ${otp}[0]
    BasePage.Wait And Input  ${TXT_OTP2}   ${otp}[1]
    BasePage.Wait And Input  ${TXT_OTP3}   ${otp}[2]
    BasePage.Wait And Input  ${TXT_OTP4}   ${otp}[3]

Input Invalid Activate Code
    [Arguments]  @{otp}
    BasePage.Wait And Input  ${TXT_OTP1}   ${otp}[0]
    BasePage.Wait And Input  ${TXT_OTP2}   ${otp}[1]
    BasePage.Wait And Input  ${TXT_OTP3}   ${otp}[2]
    BasePage.Wait And Input  ${TXT_OTP4}   ${otp}[3]

Error Mess Invalid Activate Code
    BasePage.Wait Visible  ${ERR_CODE}
