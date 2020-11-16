*** Settings ***
Library  String
Library  BuiltIn
Library  FakerLibrary

*** Keywords ***
Fake Data Info
    ${user_name} =  Name
    ${random_num} =  Generate Random String  8  [NUMBERS]
    ${user_email} =  Set Variable  testuseraccount${random_num}@gmail.com
    ${user_phone} =  Set Variable  841${random_num}
    @{data_info} =  Create List  ${user_name}  ${user_email}  ${user_phone}
    Log  ${data_info}
    [return]   @{data_info}



















#*** Test Cases ***
#Fake data
#    Fake Data Info
