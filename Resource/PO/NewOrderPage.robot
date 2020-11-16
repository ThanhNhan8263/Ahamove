*** Setting ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  Collections
Library  BuiltIn

Resource  ../Common.robot
*** Variables ***
${LBL_TITLE}  xpath://*[@class='new-order__form__title']

*** Keywords ***
Verify Title New Order
    Element Text Should Be  ${LBL_TITLE}  Đơn hàng mới