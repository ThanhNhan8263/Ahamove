*** Setting ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  Collections
Library  BuiltIn

*** Variables ***
${TXT_NAME}  xpath://*[contains(@data-test-id,'signupName')]//input
#${CON_TBOX_NAME}  xpath://*[@class='v-input a-text-field sign-up__name v-text-field theme--light dark']//label
${ERR_BLANK_NAME}  xpath://*[contains(@data-test-id,'signupName')]//*[contains(text(),'Vui lòng nhập họ tên')]
${ERR_INVALID_NAME}  xpath://*[contains(@data-test-id,'signupName')]//*[contains(text(),'Nhập Tên tối thiểu 3 ký tự')]

${TXT_EMAIL}  xpath://*[contains(@data-test-id,'signupEmail')]//input
#${CON_TBOX_EMAIL}  xpath://*[@class='layout mb-3 row']//*[@class='v-input a-text-field v-text-field theme--light dark']//*[@class='v-text-field__slot']//label
${ERR_BLANK_EMAIL}  xpath://*[contains(@data-test-id,'signupEmail')]//*[contains(text(),'Vui lòng nhập email')]
${ERR_INVALID_EMAIL}  xpath://*[contains(@data-test-id,'signupEmail')]//*[contains(text(),'Địa chỉ email không hợp lệ')]


#${LB_SIGNUP_COUNTRY}  xpath://*[@class='sign-up__phone-country']
${TXT_PHONE_SIGNUP}  xpath://*[contains(@data-test-id,'signupPhone')]//input
#${CON_TBOX_PHONE}  xpath://*[@class='flex sign-up__phone mb-3 xs12']//*[@class='v-input a-text-field title v-text-field theme--light dark']//label
${ERR_BLANK_PHONE}  xpath://*[contains(@data-test-id,'signupPhone')]//*[contains(text(),'Vui lòng nhập số điện thoại')]
${ERR_INVALID_PHONE}  xpath://*[contains(@data-test-id,'signupPhone')]//*[contains(text(),'Số điện thoại không hợp lệ')]

${ERR_BLANK_CAT}  xpath://*[contains(@class,'sign-up__category')][contains(text(),'Vui lòng chọn loại tài khoản')]
${MNU_CAT}  xpath://*[@class='category__label__content-placeholder']

${TXT_REF}  xpath://*[@data-test-id='signupReferralCode']//input
#${CON_TBOX_REF}  xpath://*[@class='flex xs12']//*[@class='v-input a-text-field v-text-field theme--light dark']//label

${BTN_SIGNUP_DISABLE}  xpath://*[@class='mt-4 submit-signup v-btn v-btn--block v-btn--disabled v-btn--large v-btn--depressed theme--light accent--text']
${BTN_SIGNUP}  xpath://*[@class='mt-4 submit-signup v-btn v-btn--block v-btn--large v-btn--depressed theme--light accent']
#${CON_BUT_SIGNUP}  xpath://*[@class='mt-4 submit-signup v-btn v-btn--block v-btn--large v-btn--depressed theme--light accent']/div[1]

*** Keywords ***
Input Name At SignUp
    [Arguments]  ${Info}
    Wait Until Element Is Visible  ${TXT_NAME}  15s  Not found
    Input Text  ${TXT_NAME}  ${Info}

Input Email At SignUp
    [Arguments]  ${Info}
    Wait Until Element Is Visible  ${TXT_EMAIL}  15s  Not found
    Input Text  ${TXT_EMAIL}  ${Info}

Input Phone At SignUp
    [Arguments]  ${Info}
    Wait Until Element Is Visible  ${TXT_PHONE_SIGNUP}  25s  Not found
    Input Text  ${TXT_PHONE_SIGNUP}  ${Info}

Input Referral Code At SignUp
    [Arguments]  ${Ref}
    Wait Until Element Is Visible  ${TXT_REF}  15s  Not found
    Input Text  ${TXT_REF}  ${Ref}

Click Button Sign Up At Sign Up
    Click Button  ${BTN_SIGNUP}

Show Error Message Blank Name
    Element Should Be Visible  ${ERR_BLANK_NAME}
Show Error Message Blank Email
    Element Should Be Visible  ${ERR_BLANK_EMAIL}
Show Error Message Blank Phone
    Element Should Be Visible  ${ERR_BLANK_PHONE}
Show Error Message Blank Category
    Element Should Be Visible  ${ERR_BLANK_CAT}

Show Error Message Invalid Name
    Wait until element is visible  ${ERR_INVALID_NAME}  15s  not found
Show Error Message Invalid Email
    Wait until element is visible  ${ERR_INVALID_EMAIL}  15s  not found
Show Error Message Invalid Phone
    Wait until element is visible  ${ERR_INVALID_PHONE}  15s  not found

Error Existed Mail
    Wait Until Page Contains  Email này đã được đăng ký  15s  not found

Button SignUp Is Disable
    Element Should Be Visible  ${BTN_SIGNUP_DISABLE}

Error Referral Code At SignUp
    Wait Until Page Contains  Mã giới thiệu không tồn tại  15s  not found

Click Menu Category
    Wait until element is visible  ${MNU_CAT}  15s  ${MNU_CAT} not found
    Click Element  ${MNU_CAT}


