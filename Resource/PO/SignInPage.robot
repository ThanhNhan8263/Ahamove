*** Setting ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  Collections
Library  BuiltIn

Resource  ../Common.robot
Resource   ${EXECDIR}/Resource/Base/BasePage.robot

*** Variables ***
${TXT_PHONE}  xpath://input[@data-test-id='phone-number']
${BTN_LOGIN}  xpath://*[@class='signin-methods__submit v-btn v-btn--block v-btn--large v-btn--depressed theme--light accent']
${BTN_LOG_FACE}  xpath://*[@class='button elevation-0 white--text v-btn v-btn--block v-btn--large theme--light']
#${BTN_LOG_GG}  xpath:

${BTN_NOTFOUND_SIGNUP}  xpath://*[@data-test-id='mobileNotFoundSignUpBtn']

${TAB_SIGNUP}  xpath://*[@class="ahamove-auth__methods"]/div[2]
${TXT_ID}   xpath://*[@name='email']
${TXT_PASS}   xpath://*[@name='pass']
${BTN_LOGIN}  xpath://*[@class='uiButton uiButtonConfirm uiButtonLarge']


*** Keywords ***
Input Phone Number At login
    [Arguments]  ${phone}
    Wait And Input   ${TXT_PHONE}  ${phone}

Click Login Button At Login
    Click Button   ${BTN_LOGIN}

Click Login With Facebook At Login
    Click Button   ${BTN_LOG_FACE}

#Click Login With Google At Login


Click To Sign Up At Popup Account Not Found
    Click Button  ${BTN_NOTFOUND_SIGNUP}

Click To Tap SignUp At Login
    Wait And Click  ${TAB_SIGNUP}

Login With Facebook Success
    Switch Window  NEW  5s  CURRENT
    Wait And Input  ${TXT_ID}  0981875523
    Wait And Input  ${TXT_PASS}
    Wait And CLick  ${BTN_LOGIN}