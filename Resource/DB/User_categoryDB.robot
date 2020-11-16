*** Setting ***
Library  MongoDBLibrary
Library  JSONLibrary
Library  Collections

Resource   ${EXECDIR}/Resource/DB/MongoDB.robot

*** Keywords ***
Get Category Name
    #Change name ${code} to make sense, lang => language
    [Arguments]  ${code}  ${type}  ${lang}
    ${user_type} =  MongoDB.Get Field  masterdata  user_category  {"code":"${code}","type":"${type}"}  name
    Log  ${user_type.name.${lang}}
    [return]  ${user_type.name.${lang}}


#*** Test Cases ***
#Get sample
#    Get Category name  FOOD  SMEs  en