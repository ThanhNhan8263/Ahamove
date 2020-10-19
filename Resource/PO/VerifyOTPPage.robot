*** Setting ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  Collections
Library  BuiltIn

Resource  ../Common.robot

*** Variables ***
${TXT_OTP1}  xpath://*[@class='digits my-4']/input[1]
${TXT_OTP2}  xpath://*[@class='digits my-4']/input[2]
${TXT_OTP3}  xpath://*[@class='digits my-4']/input[3]
${TXT_OTP4}  xpath://*[@class='digits my-4']/input[4]
${ERR_CODE}  xpath://div[contains(text(),'Bạn đã nhập sai OTP, vui lòng nhập lại')]

*** Keywords ***
Input Activate Code
    [Arguments]  @{OTP}
    wait until element is visible  ${TXT_OTP1}  15s  not found
    Input Text  ${TXT_OTP1}   ${OTP}[0]
    Input Text  ${TXT_OTP2}   ${OTP}[1]
    Input Text  ${TXT_OTP3}   ${OTP}[2]
    Input Text  ${TXT_OTP4}   ${OTP}[3]

Error Mess Invalid Activate Code
    Wait Until Page Contains  Mã kích hoạt của bạn đã hết hạn.  15s  not found
