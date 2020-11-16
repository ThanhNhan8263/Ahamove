*** Setting ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  Collections
Library  BuiltIn


Resource   ${EXECDIR}/Resource/DB/UserDB.robot
Resource   ${EXECDIR}/Resource/Base/FakeData.robot
Resource   ${EXECDIR}/Resource/Base/BasePage.robot

*** Variables ***
${TXT_NAME}  xpath://*[contains(@data-test-id,'signupName')]//input
${ERR_BLANK_NAME}  xpath://*[contains(@data-test-id,'signupName')]//*[contains(text(),'Vui lòng nhập họ tên')]
${ERR_INVALID_NAME}  xpath://*[contains(@data-test-id,'signupName')]//*[contains(text(),'Nhập Tên tối thiểu 3 ký tự')]

${TXT_EMAIL}  xpath://*[contains(@data-test-id,'signupEmail')]//input
${ERR_BLANK_EMAIL}  xpath://*[contains(@data-test-id,'signupEmail')]//*[contains(text(),'Vui lòng nhập email')]
${ERR_INVALID_EMAIL}  xpath://*[contains(@data-test-id,'signupEmail')]//*[contains(text(),'Địa chỉ email không hợp lệ')]


${TXT_PHONE_SIGNUP}  xpath://*[contains(@data-test-id,'signupPhone')]//input
${ERR_BLANK_PHONE}  xpath://*[contains(@data-test-id,'signupPhone')]//*[contains(text(),'Vui lòng nhập số điện thoại')]
${ERR_INVALID_PHONE}  xpath://*[contains(@data-test-id,'signupPhone')]//*[contains(text(),'Số điện thoại không hợp lệ')]

${ERR_BLANK_CAT}  xpath://*[contains(@class,'sign-up__category')][contains(text(),'Vui lòng chọn loại tài khoản')]
${MNU_CAT}  xpath://*[@class='category__label__content-placeholder']

${TXT_REF}  xpath://*[@data-test-id='signupReferralCode']//input

${BTN_SIGNUP_DISABLE}  xpath://*[@class='mt-4 submit-signup v-btn v-btn--block v-btn--disabled v-btn--large v-btn--depressed theme--light accent--text']
${BTN_SIGNUP}  xpath://*[@class='mt-4 submit-signup v-btn v-btn--block v-btn--large v-btn--depressed theme--light accent']

*** Keywords ***
Input user info
    @{data_info} =  FakeData.Fake Data Info
    Set suite variable  @{data_info}  @{data_info}
    BasePage.Wait And Input  ${TXT_NAME}  ${data_info}[0]
    BasePage.Wait And Input  ${TXT_EMAIL}  ${data_info}[1]
    BasePage.Wait And Input  ${TXT_PHONE_SIGNUP}  ${data_info}[2]


Input Name At SignUp
    [Arguments]  ${name}
    BasePage.Wait And Input  ${TXT_NAME}  ${name}

Input Email At SignUp
    [Arguments]  ${email}
    BasePage.Wait And Input  ${TXT_EMAIL}  ${email}

Input Phone At SignUp
    [Arguments]  ${phone}
    BasePage.Wait And Input  ${TXT_PHONE_SIGNUP}  ${phone}

Input Referral Code At SignUp
    [Arguments]  ${ref}
    BasePage.Wait And Input  ${TXT_REF}  ${ref}

Click Button Sign Up At Sign Up
    Click Button  ${BTN_SIGNUP}

Show Error Message Blank Name
    BasePage.Wait visible  ${ERR_BLANK_NAME}
Show Error Message Blank Email
    BasePage.Wait visible  ${ERR_BLANK_EMAIL}
Show Error Message Blank Phone
    BasePage.Wait visible  ${ERR_BLANK_PHONE}
Show Error Message Blank Category
    BasePage.Wait visible  ${ERR_BLANK_CAT}

Show Error Message Invalid Name
    BasePage.Wait visible  ${ERR_INVALID_NAME}
Show Error Message Invalid Email
    BasePage.Wait visible  ${ERR_INVALID_EMAIL}
Show Error Message Invalid Phone
    BasePage.Wait visible  ${ERR_INVALID_PHONE}

Error Existed Mail
    Wait Page Contains  Email này đã được đăng ký

Button SignUp Is Disable
    Element Should Be Visible  ${BTN_SIGNUP_DISABLE}

Error Referral Code At SignUp
    Wait Page Contains  Mã giới thiệu không tồn tại

Click Menu Category
    BasePage.Wait And Click  ${MNU_CAT}

Verify user info
    [Arguments]  ${user_type}  ${cat}  ${subcat}
    @{user_info} =  UserDB.Get User Info When Sign Up  ${data_info}[2]
    Should Be Equal As Strings  ${data_info}[2]  ${user_info}[0]  msg=Fail
    Should Be Equal As Strings  ${data_info}[0]  ${user_info}[1]  msg=Fail
    Should Be Equal As Strings  ${data_info}[1]  ${user_info}[2]  msg=Fail
    Should Be Equal As Strings  ${user_type}  ${user_info}[3]  msg=Fail
    Should Be Equal As Strings  ${cat}  ${user_info}[4]  msg=Fail
    Should Be Equal As Strings  ${subcat}  ${user_info}[5]  msg=Fail
    Log  ${user_info}


Have user id in database
    [Arguments]  ${data}
    UserDB.Get User Id  ${data}

Don't have user id in database
    [Arguments]  ${data}
    UserDB.Get Blank User Id  ${data}

Have email in database
    [Arguments]  ${data}
    UserDB.Get User Email  ${data}






#*** Test Cases ***
#Input data
#    Open Browser  https://appstg.ahamove.com/sign-up  chrome
#    Input user info
#    Close Browser




