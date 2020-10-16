*** Setting ***
Library  SeleniumLibrary  #run_on_failure=Nothing k chụp lại hình
Library  OperatingSystem

*** Variables ***
&{URL}  stg=https://appstg.ahamove.com
${ENVIROMENT} =  stg
#default value, run -V ENVIROMENT:prod
${BROWSER} =  headlesschrome
# chạy ngầm => run -v BROWSER:headlesschrome

*** Keywords ***
Begin Web Test
    Open Browser  about:blank  ${BROWSER}
    Sleep  2s
    Go To  ${URL.${ENVIROMENT}}
    Set Screenshot Directory  ./Report/image
End Web Test
    Close Browser


#{biến check}BuldIn.Run Keyeord and Return Status Element SHould Be Visiable {Xpath-nút đó}
#Run keywords if {biến check = true}  click {xpath}