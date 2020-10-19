*** Setting ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  Collections
Library  BuiltIn

Resource  ../Common.robot

*** Variables ***
${TXT_PHONE}  xpath://*[@class='v-input title supported-by-aha__phone-input v-text-field theme--light']//input
${BTN_LOGIN}  xpath://*[@class='signin-methods__submit v-btn v-btn--block v-btn--large v-btn--depressed theme--light accent']
${BTN_LOG_FACE}  xpath://*[@class='button elevation-0 white--text v-btn v-btn--block v-btn--large theme--light']
${BTN_LOG_GG}  xpath:

${BTN_ACCNOTFOUND}  xpath://*[@data-test-id='mobileNotFoundSignUpBtn']

${TAB_SIGNUP}  xpath://*[@class="ahamove-auth__methods"]/div[2]

*** Keywords ***
Input Phone Number At login
    [Arguments]  ${Phone}
    Wait until element is visible  ${TXT_PHONE}  15s  not found
    Input Text   ${TXT_PHONE}  ${Phone}

Click Login Button At Login
    Click Button   ${BTN_LOGIN}

Click Login With Facebook At Login
    Click Button   ${BTN_LOG_FACE}

Click Login With Google At Login


Click To Sign Up At Popup Account Not Found
    Click Button  ${BUT_ACCNOTFOUND}

Click To Tap SignUp At Login
    Wait Until Element Is Visible  ${TAB_SIGNUP}  15s  Not found
    Click Element  ${TAB_SIGNUP}