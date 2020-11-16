*** Setting ***
Library  SeleniumLibrary  #run_on_failure=Nothing k chụp lại hình
Library  OperatingSystem

*** Variables ***
&{URL}  stg=https://appstg.ahamove.com  uat=https://appuat.ahamove.com  prod=https://app.ahamove.com
${ENVIROMENT} =  stg
${BROWSER} =  headlesschrome
#run -v BROWSER:headlesschrome

*** Keywords ***
Begin Web Test
    Open Browser  about:blank  ${BROWSER}
    Go To  ${URL.${ENVIROMENT}}
    Set Screenshot Directory  ${EXECDIR}/Report/image
End Web Test
    Capture Page Screenshot  ${EXECDIR}/Report/image/custom_name_{index}.png
    Close All Browsers



#{biến check}BuldIn.Run Keyeord and Return Status Element SHould Be Visiable {Xpath-nút đó}
#Run keywords if {biến check = true}  click {xpath}