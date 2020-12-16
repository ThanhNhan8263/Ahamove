*** Setting ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  Collections
Library  BuiltIn

Resource   ${EXECDIR}/Resource/PO/CategoryPage.robot
Resource   ${EXECDIR}/Resource/PO/NewOrderPage.robot
Resource   ${EXECDIR}/Resource/PO/ProfilePage.robot
Resource   ${EXECDIR}/Resource/PO/VerifyOTPPage.robot
Resource   ${EXECDIR}/Resource/PO/SignInPage.robot

*** Keywords ***
User open to profile screen
    [Arguments]  ${phone}
    SignInPage.Login Success  ${phone}
    VerifyOTPPage.Input Activate Code  ${phone}
    ProfilePage.Open to profile screen
