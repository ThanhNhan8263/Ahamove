*** Setting ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  Collections
Library  BuiltIn

*** Keywords ***
Wait And Click
    [Arguments]  ${button}
    Wait until element is visible  ${button}  25s  not found
    Click Element  ${button}

Wait And Input
    [Arguments]  ${textbox}  ${data}
    Wait Until Element Is Visible  ${textbox}  25s  Not found
    Input Text  ${textbox}  ${data}

Wait visible
    [Arguments]  ${component}
    Wait until element is visible  ${component}  25s  not found

Wait Page Contains
    [Arguments]  ${component}
    Wait Until Page Contains  ${component}  25s  not found