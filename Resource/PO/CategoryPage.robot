*** Setting ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  Collections
Library  BuiltIn

Resource  ../Common.robot

*** Variables ***
${BTN_INDIVIDUAL}  xpath://*[@class='business__types']/div[1]
${BTN_SMEs}  xpath://*[@class='business__types']/div[2]
${BTN_CORPORATE}  xpath://*[@class='business__types']/div[3]

${BTN_CAT_SMEs}  xpath://*[@class='select-category-group']/*[@class='category-group'][1]
${BTN_CAT_CORPORATE}  xpath://*[@class='select-category-group']/*[@class='category-group'][1]

${CHK_SUBCAT_INDIVIDUAL}  xpath://*[@class='category-items__wrapper']/div/div[2]/div[1]//*[@class='v-input--selection-controls__ripple']
${CHK_SUBCAT_SMEs}  xpath://*[@class='category-items__wrapper']/div/div[2]/div[1]//*[@class='v-input--selection-controls__ripple']
${CHK_SUBCAT_CORPORATE}  xpath://*[@class='category-items__wrapper']/div/div[2]/div[1]//*[@class='v-input--selection-controls__ripple']
${BTN-SAVE}  xpath://*[@class='v-btn v-btn--depressed theme--light accent']

*** Keywords ***
Choose Category Individual
    Wait until element is visible  ${BTN_INDIVIDUAL}  15s  not found
    Click Element  ${BTN_INDIVIDUAL}
    Wait until element is visible  ${CHK_SUBCAT_INDIVIDUAL}  15s  not found
    Click Element  ${CHK_SUBCAT_INDIVIDUAL}
    Click On Save Category

Choose Category SMEs
    Wait until element is visible  ${BTN_SMEs}  15s  not found
    Click Element  ${BTN_SMEs}
    Wait until element is visible  ${BTNCAT_SMEs}  15s  not found
    Click Element  ${BTNCAT_SMEs}
    Wait until element is visible  ${CHK_SUBCAT_SMEs}  15s  not found
    Click Element  ${CHK_SUBCAT_SMEs}
    Click On Save Category

Choose Category Corporate
    Wait until element is visible  ${BTN_CORPORATE}  15s  not found
    Click Element  ${BTN_CORPORATE}
    Wait until element is visible  ${BTN_CAT_SMEs}  15s  not found
    Click Element  ${BTN_CAT_SMEs}
    Wait until element is visible  ${CHK_SUBCAT_CORPORATE}  15s  not found
    Click Element  ${CHK_SUBCAT_CORPORATE}
    Click On Save Category

Click On Save Category
    Wait until element is visible  ${BTN-SAVE}  15s  not found
    Click Button  ${BTN-SAVE}