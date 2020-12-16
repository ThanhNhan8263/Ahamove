*** Setting ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  Collections
Library  BuiltIn

*** Variables ***
${BTN_LOGIN}  xpath://*[@class='signin-methods__submit v-btn v-btn--block v-btn--large v-btn--depressed theme--light accent']

*** Keywords ***
Wait And Click
    [Arguments]  ${button}
    Wait until element is visible  ${button}  25s  not found
    Click Element  ${button}

Wait And Input
    [Arguments]  ${textbox}  ${data}
    Wait Until Element Is Visible  ${textbox}  25s  Not found
    Input Text  ${textbox}  ${data}

Wait Visible
    [Arguments]  ${element}
    Wait until element is visible  ${element}  25s  not found

Wait Page Contains
    [Arguments]  ${element}
    Wait Until Page Contains  ${element}  25s  not found

Scroll And Click
    [Arguments]  ${x_location}
    Scroll Element Into View  ${x_location}


#*** Test Cases ***
#Test Scroll
#    Open Browser  https://appstg.ahamove.com
#    Scroll And Click  ${BTN_LOGIN}
#    Close Browser