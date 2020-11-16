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
    Click To Tap SignUp

User already exist on system
    [Arguments]  ${data}
    User Id In Database  ${data}

Email already exist in system
    [Arguments]  ${data}
    Email In Database  ${data}

User input success full all info
    Input User Info

User input success full all info but phone is existed
    [Arguments]  ${name}  ${email}  ${phone}
    Input Name  ${name}
    Input Email  ${email}
    Input Phone  ${phone}

User input success full all info but email is existed
    [Arguments]  ${name}  ${email}  ${phone}
    Input Name  ${name}
    Input Email  ${email}
    Input Phone  ${phone}

When User input all invalid info
    [Arguments]  ${name}  ${email}  ${phone}
    Input Name  ${name}
    Input Email  ${email}
    Input Phone  ${phone}

User choosing category is Individual
    [Arguments]  ${type}  ${category}  ${sub_cat}  ${language}
    Click Menu Category
    Choose Category Individual  ${type}  ${category}  ${sub_cat}  ${language}

User choosing category is SMEs
    [Arguments]  ${type}  ${category}  ${sub_cat}  ${language}
    Click Menu Category
    Choose Category SMEs  ${type}  ${category}  ${sub_cat}  ${language}

User choosing category is Corporate
    [Arguments]  ${type}  ${category}  ${sub_cat}  ${language}
    Click Menu Category
    Choose Category Corporate  ${type}  ${category}  ${sub_cat}  ${language}

User input referral code
    [Arguments]  ${ref}
    Input Referral Code  ${ref}

User click to Sign Up button
    Click Button Sign Up

Go to input activation code screen and input code success
    [Arguments]  @{otp}
    Input Activate Code  @{otp}

Go to input activation code screen and input invalid code
    [Arguments]  @{otp}
    Input Activate Code  @{otp}

User sign up success to new order screen
    [Arguments]  ${user_type}  ${cat}  ${subcat}
    Verify Title New Order
    Verify User Info  ${user_type}  ${cat}  ${subcat}

User sign up to new order screen
    Verify Title New Order

Show error input invalid acctivated code
    Error Mess Invalid Activate Code

Show error message email is existed
    Error Existed Mail

Show error message need to input at require field
    Show Error Message Blank Name
    Show Error Message Blank Email
    Show Error Message Blank Phone
    Show Error Message Blank Category

Show error message invalid info at require field
    Show Error Message Invalid Name
    Show Error Message Invalid Email
    Show Error Message Invalid Phone

SignUp Button is disable
    Button SignUp Is Disable

Show error input invalid referral code
    Error Referral Code

Referral info matching with input
    [Arguments]  ${referral_code}
    #Verify Referral Info  ${referral_code}
    Verify Referral Info Not Phone  ${referral_code}



