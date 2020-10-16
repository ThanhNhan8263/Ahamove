*** Setting ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  Collections
Library  BuiltIn

Resource  ../Common.robot

*** Variables ***
${Input1}  xpath://*[@class='digits my-4']/input[1]
${Input2}  xpath://*[@class='digits my-4']/input[2]
${Input3}  xpath://*[@class='digits my-4']/input[3]
${Input4}  xpath://*[@class='digits my-4']/input[4]
${ER_CODE}  xpath://div[contains(text(),'Bạn đã nhập sai OTP, vui lòng nhập lại')]

*** Keywords ***
Input activate code
    [Arguments]  @{OTP}
    wait until element is visible  ${Input1}  2s  ${Input1} not found
    Sleep  3s
    Input Text  ${Input1}   ${OTP}[0]
    Input Text  ${Input2}   ${OTP}[1]
    Input Text  ${Input3}   ${OTP}[2]
    Input Text  ${Input4}   ${OTP}[3]

Error mess invalid activate code
    Wait Until Page Contains  Mã kích hoạt của bạn đã hết hạn.  10s  not found
    Sleep  3s
