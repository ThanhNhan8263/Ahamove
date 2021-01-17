*** Setting ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  Collections
Library  BuiltIn

Resource   ${EXECDIR}/Resource/PO/SignInPage.robot
Resource   ${EXECDIR}/Resource/PO/SignUpPage.robot
Resource   ${EXECDIR}/Resource/PO/CategoryPage.robot
Resource   ${EXECDIR}/Resource/PO/VerifyOTPPage.robot
Resource   ${EXECDIR}/Resource/PO/NewOrderPage.robot
Resource   ${EXECDIR}/Resource/DB/UserDB.robot

*** Keywords ***
User open app to sign up screen
    SignInPage.Click To Tap SignUp

User already exist on system
    [Arguments]  ${data}
    SignUpPage.Verify Phone Existed  ${data}

Email already exist in system
    [Arguments]  ${data}
    SignUpPage.Verify Email Existed  ${data}

User input success full all info
    SignUpPage.Input Fake User Info


User input success full all info with exist info
    [Arguments]  ${name}  ${email}  ${phone}
    SignUpPage.Input Name  ${name}
    SignUpPage.Input Email  ${email}
    SignUpPage.Input Phone  ${phone}

When User input all invalid info
    [Arguments]  ${name}  ${email}  ${phone}
    SignUpPage.Input Name  ${name}
    SignUpPage.Input Email  ${email}
    SignUpPage.Input Phone  ${phone}

User choosing category is Individual
    [Arguments]  ${type}  ${category}  ${sub_cat}  ${language}
    SignUpPage.Click Menu Category 
    CategoryPage.Choose Category Individual  ${type}  ${category}  ${sub_cat}  ${language}

User choosing category is SMEs
    [Arguments]  ${type}  ${category}  ${sub_cat}  ${language}
    SignUpPage.Click Menu Category 
    CategoryPage.Choose Category SMEs  ${type}  ${category}  ${sub_cat}  ${language}

User choosing category is Corporate
    [Arguments]  ${type}  ${category}  ${sub_cat}  ${language}
    SignUpPage.Click Menu Category 
    CategoryPage.Choose Category Corporate  ${type}  ${category}  ${sub_cat}  ${language}

User input referral code
    [Arguments]  ${ref}
    SignUpPage.Input Referral Code  ${ref}

User click to Sign Up button
    SignUpPage.Click Button Sign Up

Go to input activation code screen and input code success
    ${phone} =  Get Substring  ${data_info}[2]  1
    ${phone} =  Set Variable  84${phone}
    VerifyOTPPage.Input Activate Code  ${phone}

Go to input activation code screen and input code success when exist phone 
    [Arguments]  ${phone}
    VerifyOTPPage.Input Activate Code  ${phone}

Go to input activation code screen and input invalid code
    [Arguments]  @{otp}
    VerifyOTPPage.Input Invalid Activate Code  @{otp}

User sign up success to new order screen
    [Arguments]  ${user_type}  ${cat}  ${subcat}
    NewOrderPage.Verify Title New Order
    SignUpPage.Verify User Info  ${user_type}  ${cat}  ${subcat}

User sign up to new order screen
    NewOrderPage.Verify Title New Order

Show error input invalid acctivated code
    VerifyOTPPage.Error Mess Invalid Activate Code

Show error message email is existed
    SignUpPage.Error Existed Mail

Show error message need to input at require field
    SignUpPage.Show Error Message Blank Name
    SignUpPage.Show Error Message Blank Email
    SignUpPage.Show Error Message Blank Phone
    SignUpPage.Show Error Message Blank Category

Show error message invalid info at require field
    SignUpPage.Show Error Message Invalid Name
    SignUpPage.Show Error Message Invalid Email
    SignUpPage.Show Error Message Invalid Phone

SignUp Button is disable
    SignUpPage.Button SignUp Is Disable

Show error input invalid referral code
    SignUpPage.Error Referral Code

Referral info matching with input
    [Arguments]  ${referral_code}
    #Verify Referral Info  ${referral_code}
    SignUpPage.Verify Referral Info  ${referral_code}



