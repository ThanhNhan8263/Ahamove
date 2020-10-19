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
#${BTN_LOG_GG}  xpath:

${BTN_NOTFOUND_SIGNUP}  xpath://*[@data-test-id='mobileNotFoundSignUpBtn']

${TAB_SIGNUP}  xpath://*[@class="ahamove-auth__methods"]/div[2]

${URL_FACE}  https://www.facebook.com/login.php?skip_api_login=1&api_key=851274091655215&kid_directed_site=0&app_id=851274091655215&signed_next=1&next=https%3A%2F%2Fwww.facebook.com%2Fv3.3%2Fdialog%2Foauth%3Fapp_id%3D851274091655215%26auth_type%3Drerequest%26cbt%3D1602239838283%26channel_url%3Dhttps%253A%252F%252Fstaticxx.facebook.com%252Fx%252Fconnect%252Fxd_arbiter%252F%253Fversion%253D46%2523cb%253Df44a185bc3edbc%2526domain%253Dappstg.ahamove.com%2526origin%253Dhttps%25253A%25252F%25252Fappstg.ahamove.com%25252Ff7f49232cdf4%2526relation%253Dopener%26client_id%3D851274091655215%26display%3Dpopup%26domain%3Dappstg.ahamove.com%26e2e%3D%257B%257D%26fallback_redirect_uri%3Dhttps%253A%252F%252Fappstg.ahamove.com%252F%26locale%3Dvi_VN%26logger_id%3Df3f29057edb8c3c%26origin%3D1%26redirect_uri%3Dhttps%253A%252F%252Fstaticxx.facebook.com%252Fx%252Fconnect%252Fxd_arbiter%252F%253Fversion%253D46%2523cb%253Df4cdcc76daa72%2526domain%253Dappstg.ahamove.com%2526origin%253Dhttps%25253A%25252F%25252Fappstg.ahamove.com%25252Ff7f49232cdf4%2526relation%253Dopener%2526frame%253Df27a70fadbd6164%26response_type%3Dtoken%252Csigned_request%252Cgraph_domain%26scope%3Dpublic_profile%252C%2Bemail%26sdk%3Djoey%26version%3Dv3.3%26ret%3Dlogin%26fbapp_pres%3D0&cancel_url=https%3A%2F%2Fstaticxx.facebook.com%2Fx%2Fconnect%2Fxd_arbiter%2F%3Fversion%3D46%23cb%3Df4cdcc76daa72%26domain%3Dappstg.ahamove.com%26origin%3Dhttps%253A%252F%252Fappstg.ahamove.com%252Ff7f49232cdf4%26relation%3Dopener%26frame%3Df27a70fadbd6164%26error%3Daccess_denied%26error_code%3D200%26error_description%3DPermissions%2Berror%26error_reason%3Duser_denied&display=popup&locale=vi_VN&pl_dbl=0
${TXT_ID}   xpath://*[@name='email']
${TXT_PASS}   xpath://*[@name='pass']
${BTN_LOGIN}  xpath://*[@class='uiButton uiButtonConfirm uiButtonLarge']


*** Keywords ***
Input Phone Number At login
    [Arguments]  ${phone}
    Wait until element is visible  ${TXT_PHONE}  15s  not found
    Input Text   ${TXT_PHONE}  ${phone}

Click Login Button At Login
    Click Button   ${BTN_LOGIN}

Click Login With Facebook At Login
    Click Button   ${BTN_LOG_FACE}

#Click Login With Google At Login


Click To Sign Up At Popup Account Not Found
    Click Button  ${BTN_NOTFOUND_SIGNUP}

Click To Tap SignUp At Login
    Wait Until Element Is Visible  ${TAB_SIGNUP}  15s  Not found
    Click Element  ${TAB_SIGNUP}

Login With Facebook Success
    Switch Window  NEW  5s  CURRENT
    Wait until element is visible  ${TXT_ID}  15s  not found
    Input Text  ${TXT_ID}  0981875523
    Wait until element is visible  ${TXT_PASS}  15s  not found
    Input Text  ${TXT_PASS}
    Wait until element is visible  ${BTN_LOGIN}  15s  not found
    Click Button  ${BTN_LOGIN}