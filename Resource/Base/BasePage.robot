*** Setting ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  Collections
Library  BuiltIn

*** Variables ***
########### SIGN UP #########
${TXT_NAME}  xpath://*[contains(@data-test-id,'signupName')]//input
${ERR_BLANK_NAME}  xpath://*[contains(@data-test-id,'signupName')]//*[contains(text(),'Vui lòng nhập họ tên')]
${ERR_INVALID_NAME}  xpath://*[contains(@data-test-id,'signupName')]//*[contains(text(),'Nhập Tên tối thiểu 3 ký tự')]

${TXT_EMAIL}  xpath://*[contains(@data-test-id,'signupEmail')]//input
${ERR_BLANK_EMAIL}  xpath://*[contains(@data-test-id,'signupEmail')]//*[contains(text(),'Vui lòng nhập email')]
${ERR_INVALID_EMAIL}  xpath://*[contains(@data-test-id,'signupEmail')]//*[contains(text(),'Địa chỉ email không hợp lệ')]

${TXT_PHONE_SIGNUP}  xpath://*[contains(@data-test-id,'signupPhone')]//input
${ERR_BLANK_PHONE}  xpath://*[contains(@data-test-id,'signupPhone')]//*[contains(text(),'Vui lòng nhập số điện thoại')]
${ERR_INVALID_PHONE}  xpath://*[contains(@data-test-id,'signupPhone')]//*[contains(text(),'Số điện thoại không hợp lệ')]

${MNU_CAT}  xpath://*[@class='category__label__content-placeholder']
${ERR_BLANK_CAT}  xpath://*[contains(@class,'sign-up__category')][contains(text(),'Vui lòng chọn loại tài khoản')]

${TXT_REF}  xpath://*[@data-test-id='signupReferralCode']//input

${BTN_SIGNUP}  xpath://*[@class='mt-4 submit-signup v-btn v-btn--block v-btn--large v-btn--depressed theme--light accent']
${BTN_SIGNUP_DISABLE}  xpath://*[@class='mt-4 submit-signup v-btn v-btn--block v-btn--disabled v-btn--large v-btn--depressed theme--light accent--text']

########### LOGIN  ##############
${TAB_SIGNUP}  xpath://*[@class="ahamove-auth__methods"]/div[2]

${TXT_PHONE}  xpath://input[@data-test-id='phone-number']
${BTN_LOGIN} =  xpath://*[@class='signin-methods__submit v-btn v-btn--block v-btn--large v-btn--depressed theme--light accent']

${BTN_NOTFOUND_PHONE}  xpath://*[@data-test-id='mobileNotFoundSignUpBtn']

############ OTP ########
${TXT_OTP1}  xpath://*[@class='digits my-4']/input[1]
${TXT_OTP2}  xpath://*[@class='digits my-4']/input[2]
${TXT_OTP3}  xpath://*[@class='digits my-4']/input[3]
${TXT_OTP4}  xpath://*[@class='digits my-4']/input[4]
${ERR_CODE}  xpath://div[contains(text(),'Bạn đã nhập sai OTP, vui lòng nhập lại')]

############ CATEGORY ############
${POPUP_CATEGORY} =  xpath://*[@class='v-dialog select-category-modal select-step-2 v-dialog--active v-dialog--persistent']

${TITLE_BUSINESS} =  xpath://*[@class='business__header__sub-title no-title']
${BTN_INDIVIDUAL}  xpath://*[@class='business__types']/div[1]
${BTN_SMEs}  xpath://*[@class='business__types']/div[2]
${BTN_CORPORATE}  xpath://*[@class='business__types']/div[3]

#${CONTENT_CATEGORY} =  xpath://*[@class='category__label__content-title']
#${CONTENT_SUBCATEGORY} =  xpath://*[@class='category__label__content-sub-title']


${CAT_GROUP} =  xpath://*[@class='select-category-group']/div
${CAT_GROUP_SELECTED} =  xpath://*[@class='category-group selected']
${BTN_SAVE_CATEGORY} =  xpath://*[@class='select-categories__footer']/button
${TOGGLE_SELECTED_CAT} =  xpath://*[@class='select-categories__footer']//*[contains(@type,'checkbox')]
${SELECTED_CAT} =  xpath://*[@class='select-categories__footer']//*[@class='v-input--selection-controls__ripple']
${BACK_CATEGORY} =  xpath://*[@class='header__back']
${ELM_BLANK} =  xpath://*[@class='no-data__title']
${TXB_OTHER} =  xpath://*[@class='category-input-manually']//input

${TXT_SEARCH_CAT} =  xpath://*[@class='v-input v-text-field v-text-field--placeholder theme--light']
${TXB_SEARCH_CAT} =  xpath://input[contains(@placeholder,'Nhập')]

${CATEGORY_STEP1} =  xpath://*[@class='banner__step1']
${BTN_X_CAT} =  xpath://*[@class='header__close']//*[@class='v-menu__activator']
${BTN_CANCEL_CLOSE} =  xpath://*[@class='v-btn v-btn--flat v-btn--small theme--light']
${BTN_YES_CLOSE} =  xpath://*[@class='v-btn v-btn--depressed v-btn--small theme--light']

######## NEW ORDER #########
${POP_CAT_NEWORDER} =  xpath://*[@class='v-dialog v-dialog--active']
${LBL_NEWORDER_TITLE}  xpath://*[@class='new-order__form__title']
${BTN_POP_CAT} =  xpath://*[@class='category__message-btn']/button
${HOME_LAYOUT} =  xpath://*[@class='v-overlay v-overlay--active']

######## LEFT MENU ###########
${HOME_MNU} =  xpath://*[@class='v-toolbar__content']
${MNU_PROFILE} =  xpath://*[@class='v-list__tile v-list__tile--avatar theme--light']

######## PROFILE  #########
${BANNER_CAT} =  xpath://*[@class='suggest-update-category-banner mt-2']
${POP_CAT_PROFILE} =  xpath://*[@class='suggest-update-category__content']
${BUT_X_POP_CAT} =  xpath://*[@class='content__close']
${MNU_CAT_PROFILE} =  xpath://*[@class='category']



*** Keywords ***
Wait And Click
    [Arguments]  ${element}
    Wait until element is visible  ${element}  25s  not found
    Click Element  ${element}

Wait And Input
    [Arguments]  ${textbox}  ${data}
    Wait Until Element Is Visible  ${textbox}  25s  Not found
    Input Text  ${textbox}  ${data}

Wait Visible
    [Arguments]  ${element}
    Wait until element is visible  ${element}  25s  not found

Wait Not Visible
    [Arguments]  ${element}
    Wait Until Element Is Not Visible  ${element}  25s  not found

Wait Page Contains
    [Arguments]  ${element}
    Wait Until Page Contains  ${element}  25s  not found

Wait Page Not Contains
    [Arguments]  ${element}
    Wait Until Page Does Not Contain  ${element}  25s  not found

Wait Element Enabled
    [Arguments]  ${element}
    Wait Until Element Is Enabled   ${element}  25s  not found

Scroll And Click
    [Arguments]  ${element}
    Scroll Element Into View  ${element}
    Wait until element is visible  ${element}  25s  not found
    Click Element  ${element}


#*** Test Cases ***
#Test Scroll
#    Open Browser  https://appstg.ahamove.com
#    Scroll And Click  ${BTN_LOGIN}
#    Close Browser