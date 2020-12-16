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
Resource   ${EXECDIR}/Resource/Base/constants.robot



*** Keywords ***
Choose Category Individual
    [Arguments]  ${type}  ${category}  ${sub_cat}  ${language}
    BasePage.Wait And Click  ${BTN_INDIVIDUAL}
    ${txt_subcat} =  User_categoryDB.Get Category Name  ${sub_cat}  ${type}  ${language}
    BasePage.Wait And Click  xpath://*[@class='category-item']//*[contains(text(),'${txt_subcat}')]
    Click Save Category

Choose Category SMEs
    [Arguments]  ${type}  ${category}  ${sub_cat}  ${language}
    BasePage.Wait And Click  ${BTN_SMEs}
    ${txt_cat} =  User_categoryDB.Get Category Name  ${category}  ${type}  ${language}
    BasePage.Wait And Click  xpath://*[@class='select-category-group']/*[contains(text(),'${txt_cat}')]
    ${txt_subcat} =  User_categoryDB.Get Category Name  ${sub_cat}  ${type}  ${language}
    BasePage.Wait And Click  xpath://*[@class='category-item']//*[contains(text(),'${txt_subcat}')]
    Click Save Category

Choose Category Corporate
    [Arguments]  ${type}  ${category}  ${sub_cat}  ${language}
    BasePage.Wait And Click  ${BTN_CORPORATE}
    ${txt_cat} =  User_categoryDB.Get Category Name  ${category}  ${type}  ${language}
    BasePage.Wait And Click  xpath://*[@class='select-category-group']/*[contains(text(),'${txt_cat}')]
    ${txt_subcat} =  User_categoryDB.Get Category Name  ${sub_cat}  ${type}  ${language}
    BasePage.Wait And Click  xpath://*[@class='category-item']//*[contains(text(),'${txt_subcat}')]
    Click Save Category

Click Save Category
    BasePage.Wait And Click  ${BTN-SAVE}

Click Menu Individual
    BasePage.Wait And Click  ${BTN_INDIVIDUAL}

Get list category Individual
    ${count_element}  Get Element Count  xpath://*[@class='category-group']
    ${categoryIndividual} =  Get Text  xpath://*[@class='category-group selected'][1]
    ${list_categoryIndividual} =  Create List  ${categoryIndividual}
    Log  ${list_categoryIndividual}
    [return]  ${list_categoryIndividual}


Click Menu SMEs
    BasePage.Wait And Click  ${BTN_SMEs}

Get list category SMEs
    ${count_element}  Get Element Count  xpath://*[@class='category-group']
    ${list_categorySMEs} =  Create List
    FOR  ${i}  IN RANGE  1  ${count_element}+1
        ${i} =  Get Text  xpath://*[@class='category-group'][${i}]
        Append to list  ${list_categorySMEs}  ${i}
    END
    Log  ${list_categorySMEs}
    [return]  ${list_categorySMEs}


Click Menu Corporation
    BasePage.Wait And Click  ${BTN_CORPORATE}

Get list category Corporation
    ${count_element}  Get Element Count  xpath://*[@class='category-group']
    ${list_categoryCorporation} =  Create List
    FOR  ${i}  IN RANGE  1  ${count_element}+1
        ${i} =  Get Text  xpath://*[@class='category-group'][${i}]
        Append to list  ${list_categoryCorporation}  ${i}
    END
    Log  ${list_categoryCorporation}
    [return]  ${list_categoryCorporation}

#Get list subcategory
#    ${count_element}  Get Element Count  xpath://*[@class='category-item']
#    ${list_categoryCorporation} =  Create List
#    FOR  ${i}  IN RANGE  1  ${count_element}+1
#        ${i} =  Get Text  xpath://*[@class='category-item'][${i}]
#        Append to list  ${list_categoryCorporation}  ${i}
#    END
#    Log  ${list_categoryCorporation}
#    [return]  ${list_categoryCorporation}


Click choose any category
    [Arguments]  ${type}  ${category}  ${language}
    ${txt_cat} =  User_categoryDB.Get Category Name  ${category}  ${type}  ${language}
    Log  ${txt_cat}
    BasePage.Wait And Click  xpath://*[@class='select-category-group']/*[contains(text(),'${txt_cat}')]

Click choose any subcategory
    [Arguments]  ${type}  ${sub_cat}  ${language}
    ${txt_subcat} =  User_categoryDB.Get Category Name  ${sub_cat}  ${type}  ${language}
    Log  ${txt_subcat}
    BasePage.Wait And Click  xpath://*[@class='category-item']//*[contains(text(),'${txt_subcat}')]

Verify User Type And Category Info
    [Arguments]  ${phone}  ${user_type}  ${cat}  ${subcat}
    @{user_category} =  User_categoryDB.Get Category And User When Save Success  ${phone}
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
    BasePage.Wait Page Contains  Không tìm thấy "${search_data}"

Click search result
    [Arguments]  ${search_data}
    BasePage.Wait And Click  xpath://*[@class='data-item__title'][contains(text(),'${search_data}')]

Choose sreach category
    [Arguments]  ${search_data}
    Element Should Be Visible  xpath://*[contains(@aria-label,'${search_data}')][contains(@aria-checked,'true')]



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