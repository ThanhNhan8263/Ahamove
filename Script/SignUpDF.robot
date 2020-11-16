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
    Click To Tap SignUp At Login

User already exist on system
    [Arguments]  ${data}
    Have user id in database  ${data}

Email already exist in system
    [Arguments]  ${data}
    Have email in database  ${data}

User input success full all info
    Input user info

User input success full all info but phone is existed
    [Arguments]  ${name}  ${email}  ${phone}
    Input Name At SignUp  ${name}
    Input Email At SignUp  ${email}
    Input Phone At SignUp  ${phone}

User input success full all info but email is existed
    [Arguments]  ${name}  ${email}  ${phone}
    Input Name At SignUp  ${name}
    Input Email At SignUp  ${email}
    Input Phone At SignUp  ${phone}

When User input all invalid info
    [Arguments]  ${name}  ${email}  ${phone}
    Input Name At SignUp  ${name}
    Input Email At SignUp  ${email}
    Input Phone At SignUp  ${phone}

User choosing category is Individual
    [Arguments]  ${type}  ${category}  ${sub_cat}  ${lang}
    Click Menu Category
    Choose Category Individual  ${type}  ${category}  ${sub_cat}  ${lang}

User choosing category is SMEs
    [Arguments]  ${type}  ${category}  ${sub_cat}  ${lang}
    Click Menu Category
    Choose Category SMEs  ${type}  ${category}  ${sub_cat}  ${lang}

User choosing category is Corporate
    [Arguments]  ${type}  ${category}  ${sub_cat}  ${lang}
    Click Menu Category
    Choose Category Corporate  ${type}  ${category}  ${sub_cat}  ${lang}

User input referral code
    [Arguments]  ${ref}
    Input Referral Code At SignUp  ${ref}

User click to Sign Up button
    Click Button Sign Up At Sign Up

Go to input activation code screen and input code success
    [Arguments]  @{otp}
    Input Activate Code  @{otp}

Go to input activation code screen and input invalid code
    [Arguments]  @{otp}
    Input Activate Code  @{otp}

User sign up success to new order screen
    [Arguments]  ${user_type}  ${cat}  ${subcat}
    Title New Order Page Is Valid
    Verify user info  ${user_type}  ${cat}  ${subcat}

User sign up to new order screen
    Title New Order Page Is Valid

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
    Error Referral Code At SignUp

And SignUp button is disable
    Button SignUp Is Disable









