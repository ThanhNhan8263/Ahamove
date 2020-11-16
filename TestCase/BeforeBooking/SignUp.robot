*** Setting ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  Collections
Library  BuiltIn

Resource   ${EXECDIR}/Script/SignUpDF.robot

Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Test Cases ***
Verify That User Can Sign Up Success With Category Individual
    [Tags]  TC_signup_with_category_Individual
    Given User open app to sign up screen
    When User input success full all info
    And User choosing category is Individual  Individual  INDIVIDUAL NEEDS  DOCUMENT SHIPPING  vi
    And User click to Sign Up button
    And Go to input activation code screen and input code success  2  0  0  7
    Then User sign up success to new order screen  Individual  INDIVIDUAL NEEDS  DOCUMENT SHIPPING


Verify That User Can Sign Up Success With Category SMEs
    [Tags]  TC_signup_with_category_SMEs
    Given User open app to sign up screen
    When User input success full all info
    And User choosing category is SMEs  SMEs  DRINK  CAFE  vi
    And User click to Sign Up button
    And Go to input activation code screen and input code success  2  0  0  7
    Then User sign up success to new order screen  SMEs  DRINK  CAFE


Verify That User Can Sign Up Success With Category Corporate
    [Tags]  TC_signup_with_category_Corporate
    Given User open app to sign up screen
    When User input success full all info
    And User choosing category is Corporate  Corporation  OTHER  CONVENIENCE STORES  vi
    And User click to Sign Up button
    And Go to input activation code screen and input code success  2  0  0  7
    Then User sign up success to new order screen  Corporation  OTHER  CONVENIENCE STORES

Verify That User Can Sign Up Success With Valid Referral Code
    [Tags]  TC_sign_up_with_valid_referral_code
    Given User open app to sign up screen
    When User input success full all info
    And User choosing category is Individual  Individual  INDIVIDUAL NEEDS  DOCUMENT SHIPPING  vi
    And User input referral code  0981875523
    And User click to Sign Up button
    And Go to input activation code screen and input code success  2  0  0  7
    Then User sign up success to new order screen  Individual  INDIVIDUAL NEEDS  DOCUMENT SHIPPING
    And Referral info matching with input  0981875523

Verify That User Can Sign Up Success With Invalid Referral Code
    [Tags]  TC_sign_up_with_invalid_referral_code
    Given User open app to sign up screen
    When User input success full all info
    And User choosing category is Individual  Individual  INDIVIDUAL NEEDS  DOCUMENT SHIPPING  vi
    And User input referral code  abc
    And User click to Sign Up button
    Then Show error input invalid referral code

Verify That User Can't Sign Up With Invalid OTP
    [Tags]  TC_signup_with_invalid_OTP
    Given User open app to sign up screen
    When User input success full all info
    And User choosing category is Individual  Individual  INDIVIDUAL NEEDS  DOCUMENT SHIPPING  vi
    And User click to Sign Up button
    And Go to input activation code screen and input invalid code  1  1  1  1
    Then Show error input invalid acctivated code


Verify That Go To Login When User Sign Up With Exist Phone
    [Tags]  TC_signup_with_exist_phone
    Given User already exist on system  84981875523
    And User open app to sign up screen
    When User input success full all info but phone is existed  abc  abc7@gmail.com  0981875523
    And User choosing category is Individual  Individual  INDIVIDUAL NEEDS  DOCUMENT SHIPPING  vi
    And User click to Sign Up button
    And Go to input activation code screen and input code success  2  0  0  7
    Then User sign up to new order screen


Verify That User Can't Sign Up When Input Exist Email
    [Tags]  TC_signup_with_exist_email
    Given Email already exist in system  thanh@gmail.com
    And User open app to sign up screen
    When User input success full all info but email is existed  abc  thanh@gmail.com  0910000007
    And User choosing category is Individual   Individual  INDIVIDUAL NEEDS  DOCUMENT SHIPPING  vi
    And User click to Sign Up button
    Then Show error message email is existed


Verify That User Can't Sign Up When Not Input Request Info
    [Tags]  TC_signup_when_not_input_request_info
    Given User open app to sign up screen
    When User click to Sign Up button
    Then Show error message need to input at require field


Verify That User Can't Sign Up When Input Invalid Infomation
    [Tags]  TC_signup_with_invalid_infomation
    Given User open app to sign up screen
    When User input all invalid info  a  b  c
    Then Show error message invalid info at require field
    And SignUp button is disable


