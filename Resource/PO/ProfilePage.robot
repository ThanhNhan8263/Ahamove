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
Resource   ${EXECDIR}/Resource/Base/constants.robot


*** Keywords ***
Open to profile screen
    BasePage.Wait And Click  ${HOME_MNU}
    BasePage.Wait And Click  ${MNU_PROFILE}

Click menu category
    BasePage.Wait And Click  ${MNU_CAT_PROFILE}