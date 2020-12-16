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

*** Variables ***
${TXT_OTP1}  xpath://*[@class='digits my-4']/input[1]
${TXT_OTP2}  xpath://*[@class='digits my-4']/input[2]
${TXT_OTP3}  xpath://*[@class='digits my-4']/input[3]
${TXT_OTP4}  xpath://*[@class='digits my-4']/input[4]
${ERR_CODE}  xpath://div[contains(text(),'Bạn đã nhập sai OTP, vui lòng nhập lại')]

*** Keywords ***
Input Activate Code
    [Arguments]  ${phone}
    ${otp} =  UserDB.Get OTP  ${phone}
    BasePage.Wait And Input  ${TXT_OTP1}   ${otp}[0]
    BasePage.Wait And Input  ${TXT_OTP2}   ${otp}[1]
    BasePage.Wait And Input  ${TXT_OTP3}   ${otp}[2]
    BasePage.Wait And Input  ${TXT_OTP4}   ${otp}[3]

Error Mess Invalid Activate Code
    Wait Until Page Contains  Mã kích hoạt của bạn đã hết hạn.  15s  not found
