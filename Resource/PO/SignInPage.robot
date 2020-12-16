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

${BTN_NOTFOUND_SIGNUP}  xpath://*[@data-test-id='mobileNotFoundSignUpBtn']

${TAB_SIGNUP}  xpath://*[@class="ahamove-auth__methods"]/div[2]
${TXT_ID}   xpath://*[@name='email']
${TXT_PASS}   xpath://*[@name='pass']
${BTN_LOGIN}  xpath://*[@class='uiButton uiButtonConfirm uiButtonLarge']


*** Keywords ***
Input Phone Number
    [Arguments]  ${phone}
    BasePage.Wait And Input   ${TXT_PHONE}  ${phone}

Click Login Button
    BasePage.Wait And CLick   ${BTN_LOGIN}

Click Login With Facebook
    BasePage.Wait And CLick   ${BTN_LOG_FACE}

Click To Sign Up At Popup Account Not Found
    BasePage.Wait And CLick  ${BTN_NOTFOUND_SIGNUP}

Click To Tap SignUp
    BasePage.Wait And Click  ${TAB_SIGNUP}

Login Success
    [Arguments]  ${phone}
    BasePage.Wait And Input  ${TXT_PHONE}  ${phone}
    BasePage.Wait And Click  ${BTN_LOGIN}
