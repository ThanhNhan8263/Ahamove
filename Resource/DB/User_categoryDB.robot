*** Setting ***
Library  MongoDBLibrary
Library  JSONLibrary
Library  Collections

Resource   ${EXECDIR}/Resource/DB/MongoDB.robot

*** Keywords ***
Get Category Name
    [Arguments]  ${category_code}  ${type}  ${language}
    ${user_type} =  MongoDB.Get Field  masterdata  user_category  {"code":"${category_code}","type":"${type}"}  name
    Log  ${user_type.name.${language}}
    [return]  ${user_type.name.${language}}




















#*** Test Cases ***
#Get sample
#    Get Category name  FOOD  SMEs  en