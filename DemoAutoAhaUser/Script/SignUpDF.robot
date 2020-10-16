*** Setting ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  Collections
Library  BuiltIn

Resource   ${EXECDIR}/Resource/PO/SignUpScreen.robot
Resource   ${EXECDIR}/Resource/PO/CategoryScreen.robot
Resource   ${EXECDIR}/Resource/PO/VerifyOTP.robot
Resource   ${EXECDIR}/Resource/PO/NewOrderScreen.robot

*** Keywords ***
All component is existed

UI is matching with design

User open app to sign up screen
    #Handle Alert  action=DISMISS  timeout=30 s
    Click to tap SignUp

User input success full all info
    [Arguments]  @{Info}
    Input valid name  ${Info}[0]
    Input valid email  ${Info}[1]
    Input valid phone  ${Info}[2]

User input success full all info but phone is existed
    [Arguments]  @{Info}
    Input valid name  ${Info}[0]
    Input valid email  ${Info}[1]
    Input valid phone  ${Info}[2]

User input success full all info but email is existed
    [Arguments]  @{Info}
    Input valid name  ${Info}[0]
    Input valid email  ${Info}[1]
    Input valid phone  ${Info}[2]

When User input all invalid info
    [Arguments]  @{Info}
    Input valid name  ${Info}[0]
    Input valid email  ${Info}[1]
    Input valid phone  ${Info}[2]

User choosing category is Individual
    Choose category Individual

User choosing category is SMEs
    Choose category SMEs

User choosing category is Corporate
    Choose category Corporate

User click to Sign Up button
    Click button Sign Up

Go to input activation code screen and input code success
    [Arguments]  @{OTP}
    Sleep  2s
    Input activate code  @{OTP}

Go to input activation code screen and input invalid code
    [Arguments]  @{OTP}
    Sleep  2s
    Input activate code  @{OTP}

User sign up success to new order screen
    Title page is valid

Show error input invalid acctivated code
    Error mess invalid activate code

Show error message email is existed
    Error existed mail

Show error message need to input at require field
    Show error message blank name
    Show error message blank email
    Show error message blank phone
    Show error message blank category

Show error message invalid info at require field
    Show error message invalid name
    Show error message invalid email
    Show error message invalid phone

Login button is disable
    Button is disable







