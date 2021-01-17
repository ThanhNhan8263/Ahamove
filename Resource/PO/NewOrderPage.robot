*** Setting ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  Collections
Library  BuiltIn

Resource  ../Common.robot
Resource   ${EXECDIR}/Resource/Base/BasePage.robot

*** Variables ***

*** Keywords ***
Verify Title New Order
    Element Text Should Be  ${LBL_NEWORDER_TITLE}  Đơn hàng mới

Popup update category
    BasePage.Wait Visible  ${POP_CAT_NEWORDER}

Click update at popup category
    BasePage.Wait And Click  ${BTN_POP_CAT}

Close popup category
    ${check_update_category} =  Run Keyword And Return Status  BasePage.Wait Visible  ${POP_CAT_NEWORDER} 
    Run Keyword If  '${check_update_category}'=='True'  Press Keys  None  ESC
    ...         ELSE  Log  ${POP_CAT_NEWORDER} not found

Click to home screen 
    BasePage.Wait And Click  ${MNU_NEWORDER}

