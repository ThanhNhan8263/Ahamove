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
Verify that user can sign up success with category individual
    [Tags]  TC_signup_with_category_Individual
    Given User open app to sign up screen
    When User input success full all info  abc  abc1@gmail.com  0910000001
    And User choosing category is Individual
    And User click to Sign Up button
    And Go to input activation code screen and input code success  2  0  0  7
    Then User sign up success to new order screen


Verify that user can sign up success with category SMEs
    [Tags]  TC_signup_with_category_SMEs
    Given User open app to sign up screen
    When User input success full all info  abc  abc2@gmail.com  0910000002
    And User choosing category is SMEs
    And User click to Sign Up button
    And Go to input activation code screen and input code success  2  0  0  7
    Then User sign up success to new order screen


Verify that user can sign up success with category Corporate
    [Tags]  TC_signup_with_category_Corporate
    #Given  New user on system
    Given User open app to sign up screen
    When User input success full all info  abc  abc3@gmail.com  0910000003
    And User choosing category is Corporate
    And User click to Sign Up button
    And Go to input activation code screen and input code success  2  0  0  7
    Then User sign up success to new order screen

Verify that user can sign up success with valid referral code
    [Tags]  TC_sign_up_with_valid_referral_code
    Given User open app to sign up screen
    When User input success full all info  abc  abc4@gmail.com  0910000004
    And User choosing category is Individual
    And User input referral code  NHAN
    And User click to Sign Up button
    And Go to input activation code screen and input code success  2  0  0  7
    Then User sign up success to new order screen

Verify that user can sign up success with invalid referral code
    [Tags]  TC_sign_up_with_invalid_referral_code
    Given User open app to sign up screen
    When User input success full all info  abc  abc4@gmail.com  0910000005
    And User choosing category is Individual
    And User input referral code  abc
    And User click to Sign Up button
    Then Show error input invalid referral code

Verify that user can't sign up with invalid OTP
    [Tags]  TC_signup_with_invalid_OTP

    Given User open app to sign up screen
    When User input success full all info  abc  abc6@gmail.com  0910000006
    And User choosing category is Individual
    And User click to Sign Up button
    And Go to input activation code screen and input invalid code  1  1  1  1
    Then Show error input invalid acctivated code


Verify that go to login when user sign up with exist phone
    [Tags]  TC_signup_with_exist_phone
    Given User open app to sign up screen
    When User input success full all info but phone is existed  abc  abc7@gmail.com  0981875523
    And User choosing category is Individual
    And User click to Sign Up button
    And Go to input activation code screen and input code success  2  0  0  7
    Then User sign up success to new order screen


Verify that user can't sign up when input exist email
    [Tags]  TC_signup_with_exist_email
    Given User open app to sign up screen
    When User input success full all info but email is existed  abc  thanh@gmail.com  0910000007
    And User choosing category is Individual
    And User click to Sign Up button
    Then Show error message email is existed


Verify that user can't sign up when not input request info
    [Tags]  TC_signup_when_not_input_request_info
    Given User open app to sign up screen
    When User click to Sign Up button
    Then Show error message need to input at require field


Verify that user can't sign up when input invalid infomation
    [Tags]  TC_signup_with_invalid_infomation
    Given User open app to sign up screen
    When User input all invalid info  a  b  c
    Then Show error message invalid info at require field
    And Login button is disable


