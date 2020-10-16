*** Setting ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  Collections
Library  BuiltIn

*** Variables ***
${TAB-SignUp}  xpath://*[@class="ahamove-auth__methods"]/div[2]

${Textbox-Name}  xpath://*[@class='v-input a-text-field sign-up__name v-text-field theme--light dark']//input
${Content-Name}  xpath://*[@class='v-input a-text-field sign-up__name v-text-field theme--light dark']//label
${Error-Name}  xpath://*[contains(@data-test-id,'signupName')]//*[contains(text(),'Vui lòng nhập họ tên')]
${Invalid-Name}  xpath://*[contains(@data-test-id,'signupName')]//*[contains(text(),'Nhập Tên tối thiểu 3 ký tự')]

${Textbox-Email}  xpath://*[@class='layout mb-3 row']//*[@class='v-input a-text-field v-text-field theme--light dark']//input
${Content-Email}  xpath://*[@class='layout mb-3 row']//*[@class='v-input a-text-field v-text-field theme--light dark']//*[@class='v-text-field__slot']//label
${Error-Email}  xpath://*[contains(@data-test-id,'signupEmail')]//*[contains(text(),'Vui lòng nhập email')]
${Invalid-Email}  xpath://*[contains(@data-test-id,'signupEmail')]//*[contains(text(),'Địa chỉ email không hợp lệ')]


${SignUp-Contry}  xpath://*[@class='sign-up__phone-country']
${Textbox-Phone}  xpath://*[@class='flex sign-up__phone mb-3 xs12']//*[@class='v-input a-text-field title v-text-field theme--light dark']//input
${Content-Phone}  xpath://*[@class='flex sign-up__phone mb-3 xs12']//*[@class='v-input a-text-field title v-text-field theme--light dark']//label
${Error-Phone}  xpath://*[contains(@data-test-id,'signupPhone')]//*[contains(text(),'Vui lòng nhập số điện thoại')]
${Invalid-Phone}  xpath://*[contains(@data-test-id,'signupPhone')]//*[contains(text(),'Số điện thoại không hợp lệ')]


${Placeholder-Category}  xpath://*[@class='category__label__content-placeholder']
${Error-Category}  xpath://*[contains(@class,'sign-up__category')][contains(text(),'Vui lòng chọn loại tài khoản')]

${Textbox-Referral}  xpath://*[@class='flex xs12']//*[@class='v-input a-text-field v-text-field theme--light dark']
${Content-Referral}  xpath://*[@class='flex xs12']//*[@class='v-input a-text-field v-text-field theme--light dark']//label

${Button-SignUp-disable}  xpath://*[@class='mt-4 submit-signup v-btn v-btn--block v-btn--disabled v-btn--large v-btn--depressed theme--light accent--text']
${Button-SignUp}  xpath://*[@class='mt-4 submit-signup v-btn v-btn--block v-btn--large v-btn--depressed theme--light accent']
${Content-Button}  xpath://*[@class='mt-4 submit-signup v-btn v-btn--block v-btn--large v-btn--depressed theme--light accent']/div[1]

*** Keywords ***
Click to tap SignUp
    Wait Until Element Is Visible  ${TAB-SignUp}  10s  Not found
    Click Element  ${TAB-SignUp}

Input valid name
    [Arguments]  ${Info}
    Wait Until Element Is Visible  ${Textbox-Name}  5s  Not found
    Sleep  3s
    Input Text  ${Textbox-Name}  ${Info}

Input valid email
    [Arguments]  ${Info}
    Wait Until Element Is Visible  ${Textbox-Email}  5s  Not found
    Sleep  3s
    Input Text  ${Textbox-Email}  ${Info}

Input valid phone
    [Arguments]  ${Info}
    Sleep  3s
    Input Text  ${Textbox-Phone}  ${Info}
Click button Sign Up
    Sleep  3s
    Click Button  ${Button-SignUp}

Show error message blank name
    Element Should Be Visible  ${Error-Name}
Show error message blank email
    Element Should Be Visible  ${Error-Email}
Show error message blank phone
    Element Should Be Visible  ${Error-Phone}
Show error message blank category
    Element Should Be Visible  ${Error-Category}

Show error message invalid name
    Element Should Be Visible  ${Invalid-Name}
Show error message invalid email
    Element Should Be Visible  ${Invalid-Email}
Show error message invalid phone
    wait until element is visible  ${Invalid-Phone}  5s  ${Invalid-Phone} not found
Error existed mail
    Wait Until Page Contains  Email này đã được đăng ký  5s  not found

Button is disable
    Element Should Be Visible  ${Button-SignUp-disable}


