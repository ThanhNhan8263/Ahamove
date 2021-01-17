*** Setting ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  Collections
Library  BuiltIn

Resource   ${EXECDIR}/Resource/DB/UserDB.robot

Resource   ${EXECDIR}/Resource/PO/CategoryPage.robot
Resource   ${EXECDIR}/Resource/PO/NewOrderPage.robot
Resource   ${EXECDIR}/Resource/PO/ProfilePage.robot
Resource   ${EXECDIR}/Resource/PO/SignInPage.robot
Resource   ${EXECDIR}/Resource/PO/SignUpPage.robot
Resource   ${EXECDIR}/Resource/PO/VerifyOTPPage.robot

*** Keywords ***
User don't have field "user_type","categories" and "category"
    [Arguments]  ${id}
    UserDB.Get Blank Field User Type Categories Category  ${id}

User open to new order page
    [Arguments]  ${phone}
    SignInPage.Login Success  ${phone}
    VerifyOTPPage.Input Activate Code  ${phone}

User open to profile screen
    [Arguments]  ${phone}
    SignInPage.Login Success  ${phone}
    VerifyOTPPage.Input Activate Code  ${phone}
    NewOrderPage.Close popup category
    ProfilePage.Open to profile screen

Show popup request to update category
    NewOrderPage.Popup update category

Click to update button
    NewOrderPage.Click update at popup category

User have field "user_type","categories" or "category"
    [Arguments]  ${id}
    UserDB.Get Exist Field User Type Categories Category  ${id}

Show new order page
    NewOrderPage.Verify Title New Order


Click to banner category at user profile
    ProfilePage.Click banner category


User have verify status "reject" or "completed" or "submitted"
    [Arguments]  ${id}
    ${token} =  APIUser.User Activate  ${id}
    ${verify_status} =  APIUser.Get Verify Status  ${token}
    Run Keyword If    "${verify_status}" == "COMPLETED"  Log  pass
    ...   ELSE IF  "${verify_status}" == "REJECT"  Log  pass
    ...   ELSE IF  "${verify_status}" == "SUBMITTED"  Log  pass
    ...   ELSE  Fail  fail

Open to choose category screen and can't click back to bussiness type
    BasePage.Wait Visible  ${CATEGORY_STEP1}
    BasePage.Wait Not Visible  ${BACK_CATEGORY}

Choose category success when sign up
    [Arguments]  ${type}  ${language}
    ${list_category_db} =  Get Category List  ${type}  ${language}

User click on category menu
    SignUpPage.Click Menu Category

Open to bussiness type screen
    CategoryPage.Bussiness Type Screen


List category Individual is displayed and automatically selected
    [Arguments]  ${type}  ${language}
    ${list_category_db} =  APIUser.Get Category List  ${type}  ${language}
    ${list_category_ui} =  Get list category Individual
    Lists Should Be Equal  ${list_category_db}  ${list_category_ui}

List category SMEs is displayed and blank screen
    [Arguments]  ${type}  ${language}
    ${list_category_db} =  APIUser.Get Category List  ${type}  ${language}
    ${list_category_ui} =  CategoryPage.Get list category
    Lists Should Be Equal  ${list_category_db}  ${list_category_ui}
    CategoryPage.Blank screen

User click choose business type
    [Arguments]  ${type}
    ${div} =  Run keyword if  "${type}" == "Individual"  Set Variable  1
    ...     ELSE IF  "${type}" == "SMEs"  Set Variable  2
    ...     ELSE IF  "${type}" == "Corporation"  Set Variable  3
    ...     ELSE  Fail
    CategoryPage.Click Menu Category  ${div}

List category Corporation is displayed and blank screen
    [Arguments]  ${type}  ${language}
    ${list_category_db} =  APIUser.Get Category List  ${type}  ${language}
    ${list_category_ui} =  CategoryPage.Get list category
    Lists Should Be Equal  ${list_category_db}  ${list_category_ui}  ignore_order=True
    CategoryPage.Blank screen

User click on search bar and input category
    [Arguments]  ${search_data}
    CategoryPage.Input search  ${search_data}

Show not found category
    [Arguments]  ${search_data}
    CategoryPage.Show text not found category  ${search_data}

Show list result category and user click on result
    [Arguments]  ${search_data}
    CategoryPage.Click search result  ${search_data}

Choose that category success
    [Arguments]  ${search_data}
    CategoryPage.Choose sreach category  ${search_data}

User click on category on the left
    [Arguments]  ${type}  ${category}  ${language}
    CategoryPage.Click choose category  ${type}  ${category}  ${language}

Show subcategory on the right
    [Arguments]  ${type}  ${category}  ${language}
    ${list_category_db} =  APIUser.Get Subcategory List  ${type}  ${category}  ${language}
    ${list_category_ui} =  CategoryPage.Get list subcategory  ${type}  ${category}  ${language}
    Lists Should Be Equal   ${list_category_db}  ${list_category_ui}  ignore_order=True

User click category twice
    [Arguments]  ${type}  ${category}  ${language}
    CategoryPage.Click choose category  ${type}  ${category}  ${language}
    CategoryPage.Click choose category  ${type}  ${category}  ${language}

Hide subcategory on the right
    CategoryPage.Blank screen

Verify all list subcategory
    [Arguments]  ${type}  ${language}
    ${count_element} =  Get Element Count  ${CAT_GROUP}
    FOR  ${i}  IN RANGE  1  ${count_element}+1
        CategoryPage.Click choose all category  ${i}
        ${category_selected} =  Get text  ${CAT_GROUP_SELECTED}
        ${category} =  User_categoryDB.Get Category Code  ${category_selected}  ${type}  ${language}
        ${list_category_db} =  User_categoryDB.Get Subcategory List  ${type}  ${category}  ${language}
        ${list_category_ui} =  CategoryPage.Get list subcategory  ${type}  ${category}  ${language}
        Lists Should Be Equal   ${list_category_db}  ${list_category_ui}  ignore_order=True
        CategoryPage.Click choose all category  ${i}
    END

User click on many category on the left
    [Arguments]  ${div1}  ${div2}
    BasePage.Wait And Click  xpath://*[@class='select-category-group']/div[${div1}]
    BasePage.Wait And Click  xpath://*[@class='select-category-group']/div[${div2}]
#    BasePage.Wait And Click  xpath://*[@class='select-category-group']/div[${div3}]
#    BasePage.Wait And Click  xpath://*[@class='select-category-group']/div[${div4}]

Scroll and click list subcategory
    [Arguments]  ${type}  ${subcategory}  ${language}  ${scroll_element}
    CategoryPage.Scroll and click choose any subcategory  ${type}  ${subcategory}  ${language}  ${scroll_element}

Save button is disable
    Element Should Be Disabled  ${BTN_SAVE_CATEGORY}

Selected category toggle is disable
    Element Should Be Disabled  ${TOGGLE_SELECTED_CAT}

User click on subcategory
    [Arguments]  ${type}  ${sub_cat}  ${language}
    CategoryPage.Click choose any subcategory  ${type}  ${sub_cat}  ${language}

Save button enable and available to click
    BasePage.Wait Element Enabled  ${BTN_SAVE_CATEGORY}
    BasePage.Wait And Click  ${SELECTED_CAT}
    Element Attribute Value Should Be  ${TOGGLE_SELECTED_CAT}  aria-checked  true
    BasePage.Wait And Click  ${BTN_SAVE_CATEGORY}

User click on selected category toggle
    CategoryPage.Click On Toggle Selected

Show selected category
    [Arguments]  ${type}  ${cat}  ${sub_cat}  ${language}
    CategoryPage.Selected Category  ${type}  ${cat}  ${language}
    CategoryPage.Selected Subategory  ${type}  ${sub_cat}  ${language}

User click back
    BasePage.Wait And Click  ${BACK_CATEGORY}

User click x
    BasePage.Wait And Click  ${BTN_X_CAT}

Close popup
    BasePage.Wait Not Visible  ${POPUP_CATEGORY}

Click yes at cofirm popup
    BasePage.Wait And Click  ${BTN_YES_CLOSE}


Click no at cofirm popup and still Show popup
    BasePage.Wait And Click  ${BTN_CANCEL_CLOSE}

User click on Save button
    Click Save Category

Save category success to database
    [Arguments]  ${phone}  ${user_type}  ${cat}  ${subcat}
    CategoryPage.Verify User Type And Category Info  ${phone}  ${user_type}  ${cat}  ${subcat}

User click on category menu at profile
    ProfilePage.Click menu category


User input other category
    [Arguments]  ${subcategory}
    BasePage.Wait And Input  ${TXB_OTHER}  ${subcategory}
    BasePage.Wait And Click  ${BTN_SAVE_OTHER}

Show popup update category
    BasePage.Wait Visible  ${POP_CAT_PROFILE}
    BasePage.Wait Visible  ${POP_CAT_PROFILE}

 Click to popup category at user profile
     BasePage.Wait And Click  ${BUT_X_POP_CAT}

User click back new order page
    BasePage.Wait And Click  ${MNU_NEWORDER}



#*** Test Cases ***
#Test
#    Open browser   https://appstg.ahamove.com/sign-up  headlesschrome
#    BasePage.Wait And Click  ${MNU_CAT}
#    Show list category SMEs and blank screen
#    Close All Browsers
#

