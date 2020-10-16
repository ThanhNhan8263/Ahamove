*** Setting ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  Collections
Library  BuiltIn

Resource  ../Common.robot
*** Variables ***
${Title}  xpath://*[@class='new-order__form__title']

*** Keywords ***
Title page is valid
    Sleep  5s
    Element Text Should Be  ${Title}  Đơn hàng mới