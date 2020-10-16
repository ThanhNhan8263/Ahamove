*** Setting ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  Collections
Library  BuiltIn

Resource  ../Common.robot

*** Variables ***
${BUT_CAT}  xpath://*[@class='category__label__content-placeholder']
${BUT_INDIVIDUAL}  xpath://*[@class='business__types']/div[1]
${BUT_SMEs}  xpath://*[@class='business__types']/div[2]
${BUT_CORPORATE}  xpath://*[@class='business__types']/div[3]

${BUT_CAT_SMEs}  xpath://*[contains(@class,'select-category-group')]//*[contains(text(),'Đồ ăn')]
${BUT_CAT_CORPORATE}  xpath://*[contains(@class,'select-category-group')]//*[contains(text(),'Đồ ăn')]

${CB_SUBCAT_INDIVIDUAL}  xpath://*[@class='category-item__wrapper']/div[1]//*[@class='v-input v-input--selection-controls v-input--checkbox theme--light']//*[@class='v-input--selection-controls__ripple']
${CB_SUBCAT_SMEs}  xpath://*[contains(@class,'v-input v-input--selection-controls v-input--checkbox theme--light')]//*[contains(text(),'Đồ ăn nhanh')]
${CB_SUBCAT_CORPORATE}  xpath://*[contains(@class,'v-input v-input--selection-controls v-input--checkbox theme--light')]//*[contains(text(),'Đồ ăn nhanh')]
${BUT-SAVE}  xpath://*[@class='v-btn v-btn--depressed theme--light accent']

*** Keywords ***
Choose category Individual
    Click Element  ${BUT_CAT}
    Sleep  2s
    Click Element  ${BUT_INDIVIDUAL}
    Sleep  2s
    Click Element  ${CB_SUBCAT_INDIVIDUAL}
    Sleep  2s
    Click Button  ${BUT-SAVE}

Choose category SMEs
    Click Element  ${BUT_CAT}
    Sleep  2s
    Click Element  ${BUT_SMEs}
    Sleep  2s
    Click Element  ${BUT_CAT_SMEs}
    Sleep  2s
    Click Element  ${CB_SUBCAT_SMEs}
    Sleep  2s
    Click Button  ${BUT-SAVE}

Choose category Corporate
    Click Element  ${BUT_CAT}
    Sleep  2s
    Click Element  ${BUT_CORPORATE}
    Sleep  2s
    Click Element  ${BUT_CAT_CORPORATE}
    Sleep  2s
    Click Element  ${CB_SUBCAT_CORPORATE}
    Sleep  2s
    Click Button  ${BUT-SAVE}