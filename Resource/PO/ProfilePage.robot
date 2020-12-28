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


*** Keywords ***
Open to profile screen
    Sleep  2s
    Go To  https://appstg.ahamove.com/profile
#    Sleep  10s
#    Click Element At Coordinates  ${HOME_LAYOUT}  600  600
#    BasePage.Wait And Click  ${HOME_MNU}
#    BasePage.Wait And Click  ${MNU_PROFILE}

Click menu category
    BasePage.Wait And Click  ${MNU_CAT_PROFILE}

Show banner update category
    BasePage.Wait Visible  ${BANNER_CAT}

Don't show banner update category
    Element Should Not Be Visible  ${BANNER_CAT}

Click banner category
    ProfilePage.Close popup update category
    BasePage.Wait And Click  ${BANNER_CAT}

Close popup update category
    BasePage.Wait And Click  ${BUT_X_POP_CAT}