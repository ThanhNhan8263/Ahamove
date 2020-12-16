*** Setting ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  Collections
Library  BuiltIn

Resource   ${EXECDIR}/Resource/PO/SignUpPage.robot
Resource   ${EXECDIR}/Resource/PO/CategoryPage.robot
Resource   ${EXECDIR}/Resource/DB/User_categoryDB.robot
Resource   ${EXECDIR}/Resource/PO/VerifyOTPPage.robot
Resource   ${EXECDIR}/Resource/PO/NewOrderPage.robot

*** Keywords ***
User click on category menu
    SignUpPage.Click Menu Category
Open to bussiness type screen

User click choose business type Individual
    CategoryPage.Click Menu Individual

Open and auto choose category Individual
    [Arguments]  ${type}  ${language}
    ${list_category_db} =  Get Category List  ${type}  ${language}
    ${list_category_ui} =  Get list category Individual
    Lists Should Be Equal  ${list_category_db}  ${list_category_ui}  ignore_order=False

User click choose business type SMEs
    CategoryPage.Click Menu SMEs

Open and show list category SMEs and blank screen
    [Arguments]  ${type}  ${language}
    ${list_category_db} =  Get Category List  ${type}  ${language}
    ${list_category_ui} =  Get list category SMEs
    Lists Should Be Equal  ${list_category_db}  ${list_category_ui}  ignore_order=False
    Page Should Contain  Hãy để chúng tôi hiểu rõ bạn hơn

User click choose business type Corporation
    CategoryPage.Click Menu Corporation

Open and show list category Corporation and blank screen
    [Arguments]  ${type}  ${language}
    ${list_category_db} =  Get Category List  ${type}  ${language}
    ${list_category_ui} =  Get list category Corporation
    Lists Should Be Equal  ${list_category_db}  ${list_category_ui}  ignore_order=False
    Page Should Contain  Hãy để chúng tôi hiểu rõ bạn hơn

User click on search bar and input category
    [Arguments]  ${search_data}
    Input search  ${search_data}

Show not found category
    [Arguments]  ${search_data}
    Show text not found category  ${search_data}

Show list result category and user click on result
    [Arguments]  ${search_data}
    Click search result  ${search_data}

Choose that category success
    [Arguments]  ${search_data}
    Choose sreach category  ${search_data}

User click on category on the left
    [Arguments]  ${type}  ${category}  ${language}
    Click choose any category  ${type}  ${category}  ${language}

#Show subcategory on the right
#    [Arguments]  ${type}  ${category}  ${language}
#    ${list_category_db} =  Get Subcategory List  ${type}  ${category}  ${language}
#    ${list_category_ui} =  Get list subcategory
#    Lists Should Be Equal  ${list_category_db}  ${list_category_ui}  ignore_order=False

User click again on choose category

Hide subcategory on the right

User click on many category on the left

Scroll and show all list subcategory

Save button is disable

Selected category toggle is disable

User click on subcategory
    [Arguments]  ${type}  ${sub_cat}  ${language}
    Click choose any subcategory  ${type}  ${sub_cat}  ${language}

Save button enable and available to click

User click on selected category toggle

Show selected category

Click again should show all list again

User click back

User click x

Close popup

Click yes at cofirm popup

Click no at cofirm popup

Still show popup

User click out of popup

User click on Save button
    Click Save Category

Save category success to database
    [Arguments]  ${phone}  ${user_type}  ${cat}  ${subcat}
    Verify User Type And Category Info  ${phone}  ${user_type}  ${cat}  ${subcat}

User click on category menu at profile
    ProfilePage.Click menu category

#*** Test Cases ***
#Test
#    Open browser   https://appstg.ahamove.com/sign-up  headlesschrome
#    BasePage.Wait And Click  ${MNU_CAT}
#    Show list category SMEs and blank screen
#    Close All Browsers
#

