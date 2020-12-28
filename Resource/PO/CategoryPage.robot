*** Setting ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  Collections
Library  BuiltIn

Resource  ../Common.robot
Resource   ${EXECDIR}/Resource/DB/User_categoryDB.robot
Resource   ${EXECDIR}/Resource/DB/UserDB.robot
Resource   ${EXECDIR}/Resource/Base/BasePage.robot


*** Keywords ***
Choose Category Individual
    [Arguments]  ${type}  ${category}  ${sub_cat}  ${language}
    BasePage.Wait And Click  ${BTN_INDIVIDUAL}
    ${txt_subcat} =  User_categoryDB.Get Category Name  ${sub_cat}  ${type}  ${language}
    BasePage.Wait And Click  xpath://*[@class='category-item']//*[contains(text(),'${txt_subcat}')]
    CategoryPage.Click Save Category

Choose Category SMEs
    [Arguments]  ${type}  ${category}  ${sub_cat}  ${language}
    BasePage.Wait And Click  ${BTN_SMEs}
    ${txt_cat} =  User_categoryDB.Get Category Name  ${category}  ${type}  ${language}
    BasePage.Wait And Click  xpath://*[@class='select-category-group']/*[contains(text(),'${txt_cat}')]
    ${txt_subcat} =  User_categoryDB.Get Category Name  ${sub_cat}  ${type}  ${language}
    BasePage.Wait And Click  xpath://*[@class='category-item']//*[contains(text(),'${txt_subcat}')]
    CategoryPage.Click Save Category

Choose Category Corporate
    [Arguments]  ${type}  ${category}  ${sub_cat}  ${language}
    BasePage.Wait And Click  ${BTN_CORPORATE}
    ${txt_cat} =  User_categoryDB.Get Category Name  ${category}  ${type}  ${language}
    BasePage.Wait And Click  xpath://*[@class='select-category-group']/*[contains(text(),'${txt_cat}')]
    ${txt_subcat} =  User_categoryDB.Get Category Name  ${sub_cat}  ${type}  ${language}
    BasePage.Wait And Click  xpath://*[@class='category-item']//*[contains(text(),'${txt_subcat}')]
    CategoryPage.Click Save Category

Click Save Category
    BasePage.Wait And Click  ${BTN_SAVE_CATEGORY}

Click Menu Category
    [Arguments]  ${div}
    BasePage.Wait And Click  xpath://*[@class='business__types']/div[${div}]

Get list category Individual
    ${count_element}  Get Element Count  xpath://*[@class='category-group']
    ${categoryIndividual} =  Get Text  xpath://*[@class='category-group selected'][1]
    ${list_categoryIndividual} =  Create List  ${categoryIndividual}
    Log  ${list_categoryIndividual}
    [return]  ${list_categoryIndividual}


Get list category
    ${count_element}  Get Element Count  xpath://*[@class='category-group']
    ${list_category} =  Create List
    FOR  ${i}  IN RANGE  1  ${count_element}+1
        ${i} =  Get Text  xpath://*[@class='select-category-group']/div[${i}]
        Append to list  ${list_category}  ${i}
    END
    Log  ${list_category}
    [return]  ${list_category}


Get list subcategory
    [Arguments]  ${type}  ${category}  ${language}
    ${category_name} =  User_categoryDB.Get Category Name  ${category}  ${type}  ${language}
    ${count_element}  Get Element Count  xpath://*[text()='${category_name}']/following-sibling::*//*[@class='category-item']//label
    ${list_subcategory} =  Create List
    FOR  ${i}  IN RANGE  1  ${count_element}+1
        ${i} =  Get Text  xpath://*[text()='${category_name}']/following-sibling::*//*[@class='category-item'][${i}]//label
        Append to list  ${list_subcategory}  ${i}
    END
    Log  ${list_subcategory}
    [return]  ${list_subcategory}


Click choose category
    [Arguments]  ${type}  ${category}  ${language}
    ${txt_cat} =  User_categoryDB.Get Category Name  ${category}  ${type}  ${language}
    Log  ${txt_cat}
    BasePage.Wait And Click  xpath://*[@class='select-category-group']/*[contains(text(),'${txt_cat}')]

Click choose any subcategory
    [Arguments]  ${type}  ${sub_cat}  ${language}
    ${txt_subcat} =  User_categoryDB.Get Category Name  ${sub_cat}  ${type}  ${language}
    Log  ${txt_subcat}
    BasePage.Scroll And Click  xpath://*[@class='category-item']//*[contains(text(),'${txt_subcat}')]

Verify User Type And Category Info
    [Arguments]  ${phone}  ${user_type}  ${cat}  ${subcat}
    @{user_category} =  User_categoryDB.Get User Type And Category  ${phone}
    Should Be Equal As Strings  ${user_type}  ${user_category}[0]  msg=Fail
    Should Be Equal As Strings  ${cat}  ${user_category}[1]  msg=Fail
    Should Be Equal As Strings  ${subcat}  ${user_category}[2]  msg=Fail
    Log  ${user_category}

Input search
    [Arguments]  ${search_data}
    BasePage.Wait And Click  ${TXT_SEARCH_CAT}
    BasePage.Wait And Input  ${TXB_SEARCH_CAT}  ${search_data}

Show text not found category
    [Arguments]  ${search_data}
    ${not_found} =  Get Text  ${ELM_BLANK}
    BasePage.Wait Page Contains  ${not_found}

Click search result
    [Arguments]  ${search_data}
    BasePage.Wait And Click  xpath://*[@class='data-item__title'][contains(text(),'${search_data}')]

Choose sreach category
    [Arguments]  ${search_data}
    Element Attribute Value Should Be  xpath://*[@aria-label='${search_data}']  aria-checked  true

Blank screen
    ${text_blank} =  Get Text  ${ELM_BLANK}
    BasePage.Wait Page Contains  ${text_blank}

Click choose all category
    [Arguments]  ${div}
    BasePage.Wait And Click  xpath://*[@class='select-category-group']/div[${div}]

Click On Toggle Selected
    BasePage.Wait And Click  ${SELECTED_CAT}

Selected Category
    [Arguments]  ${type}  ${category}  ${language}
    ${text_selected} =  Get Text  ${CAT_GROUP_SELECTED}
    ${text_selected} =  User_categoryDB.Get Category Code  ${text_selected}  ${type}  ${language}
    Should Be Equal As Strings  ${text_selected}  ${category}  msg=Fail

Selected Subategory
    [Arguments]  ${type}  ${subcategory}  ${language}
    ${text_selected} =  User_categoryDB.Get Category Name  ${subcategory}  ${type}  ${language}
    ${text_selected} =  Get Text  //*[@class='category-item']//*[contains(text(),'${text_selected}')]
    ${text_selected} =  User_categoryDB.Get Category Code  ${text_selected}  ${type}  ${language}
    Should Be Equal As Strings  ${text_selected}  ${subcategory}  msg=Fail

Bussiness Type Screen
    ${text_title_business} =  Get Text  ${TITLE_BUSINESS}
    BasePage.Wait Page Contains   ${text_title_business}


#*** Test Cases ***
#Click category
#    Open browser   https://appstg.ahamove.com/sign-up  chrome
#    BasePage.Wait And Click  ${MNU_CAT}
#    Choose Category Corporate  Corporation  OTHER  CONVENIENCE STORES  vi
#    Close All Browsers

#Click category
#    Open browser   https://appstg.ahamove.com/sign-up  headlesschrome
#    BasePage.Wait And Click  ${MNU_CAT}
#    Get list category SMEs
#    Close All Browsers