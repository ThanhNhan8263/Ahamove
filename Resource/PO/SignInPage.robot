*** Setting ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  Collections
Library  BuiltIn

Resource  ../Common.robot
Resource   ${EXECDIR}/Resource/Base/BasePage.robot


*** Keywords ***
Input Phone Number
    [Arguments]  ${phone}
    BasePage.Wait And Input   ${TXT_PHONE}  ${phone}

Click Login Button
    BasePage.Wait And CLick   ${BTN_LOGIN}

Click To Sign Up At Popup Account Not Found
    BasePage.Wait And CLick  ${BTN_NOTFOUND_PHONE}

Click To Tap SignUp
    BasePage.Wait And Click  ${TAB_SIGNUP}

Login Success
    [Arguments]  ${phone}
    BasePage.Wait And Input  ${TXT_PHONE}  ${phone}
    BasePage.Wait And Click  ${BTN_LOGIN}
