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
    Wait until element is visible  ${button}  25s  not found  #What not found?
    Click Element  ${button}

Wait And Input
    [Arguments]  ${textbox}  ${data}
    Wait Until Element Is Visible  ${textbox}  25s  Not found  #What not found?
    Input Text  ${textbox}  ${data}

# Visible instead visible
Wait visible
    #Use element instead component
    [Arguments]  ${component}
    Wait until element is visible  ${component}  25s  not found  #What not found?

Wait Page Contains
    #Use element instead component
    [Arguments]  ${component}
    Wait Until Page Contains  ${component}  25s  not found  #What not found?