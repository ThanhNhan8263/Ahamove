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

Get Category List
    [Arguments]  ${type}  ${language}
    ${user_type} =  MongoDB.Get Field And Return Array  masterdata  user_category  {"level":1,"type":"${type}"}  name
    ${category_list} =  Create List
    FOR  ${i}  IN  @{user_type}
        Append To List  ${category_list}  ${i}[name][vi]
    END
    Log  ${category_list}
    [return]  ${category_list}

Get Subcategory List
    [Arguments]  ${type}  ${category}  ${language}
    ${user_type} =  MongoDB.Get Field And Return Array  masterdata  user_category  {"parent_code":"${category}","type":"${type}"}  name
    ${subcategory_list} =  Create List
    FOR  ${i}  IN  @{user_type}
        Append To List  ${subcategory_list}  ${i}[name][vi]
    END
    Log  ${subcategory_list}
    [return]  ${subcategory_list}

Get Category And User When Save Success
    [Arguments]  ${id}
    &{user_category} =  MongoDB.Get Records  ahamove  user  {"_id": "${id}"}
    @{user_category} =  Create List  ${user_category.user_type}  ${user_category.categories[0].code}  ${user_category.categories[0].child_code[0]}
    Log  ${user_category}
    [return]  @{user_category}


#*** Test Cases ***
#Get sample
#     Get Subcategory List  SMEs  FOOD  vi
#


