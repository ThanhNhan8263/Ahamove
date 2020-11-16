*** Setting ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  Collections
Library  BuiltIn

Resource  ../Common.robot
Resource   ${EXECDIR}/Resource/DB/User_categoryDB.robot
Resource   ${EXECDIR}/Resource/Base/BasePage.robot

*** Variables ***
${BTN_INDIVIDUAL}  xpath://*[@class='business__types']/div[1]
${BTN_SMEs}  xpath://*[@class='business__types']/div[2]
${BTN_CORPORATE}  xpath://*[@class='business__types']/div[3]

${BTN-SAVE}  xpath://*[@class='v-btn v-btn--depressed theme--light accent']
${MNU_CAT}  xpath://*[@class='category__label__content-placeholder']


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

















#*** Test Cases ***
#Click category
#    Open browser   https://appstg.ahamove.com/sign-up  chrome
#    Wait And Click  ${MNU_CAT}
#    Choose category  Corporation  OTHER  CONVENIENCE STORES  vi
#    Close All Browsers