*** Settings ***
Library  Collections
Library  RequestsLibrary 
Library  BuiltIn
Library  String
Library  SeleniumLibrary
Variables  ${EXECDIR}/Utils/Constants.py
Resource   ${EXECDIR}/Resource/Base/BasePage.robot

Resource   ${EXECDIR}/Resource/PO/SignInPage.robot
Resource   ${EXECDIR}/Resource/PO/SignUpPage.robot
Resource   ${EXECDIR}/Resource/PO/CategoryPage.robot


*** Variables *** 
@{category_code} =  FOOD
${type} =  SMEs 
${language} =   vi

*** Keywords ***
#########LOGIN-REGISTER-ACTIVATED#########
User Activate
    [Arguments]  ${mobile} 
    Create Session  User-Activate  ${API_URL}[${ENVIRONMENT}]  verify=true
    ${headers} =  Create Dictionary  User-Agent=Ahamove-App
    ${body_json} =  Create Dictionary  mobile=${mobile}  activation_code=0258  type=web  imei=1idvXglweQCOwYxNVKUz  ahamove_sms_auth=${TRUE}  fcm=${TRUE}  push=as
    ${response} =  Post Request  User-Activate  /api/v3/public/user/activate  headers=${headers}  json=${body_json}
    ${token} =  Get From Dictionary  ${response.json()}  token 
    Log  ${response}
    [return]  ${token}

###########PROFILE###########
Get User Info When Sign Up
    [Arguments]  ${token}
    Create Session  User-Profile  ${API_URL}[${ENVIRONMENT}]  verify=true
    ${param} =  Create Dictionary  token=${token}
    ${response} =  Get Request  User-Profile  /v1/user/profile  params=${param}
    &{user_info} =  Set To Dictionary  ${response.json()}
    @{user_info} =  Create List  ${user_info._id}  ${user_info.name}  ${user_info.email}  ${user_info.user_type}  ${user_info.categories[0].code}  ${user_info.categories[0].child_code[0]}
    Log  ${user_info}
    [return]  @{user_info}

Get Verify Status
    [Arguments]  ${token}
    Create Session  User-Profile  ${API_URL}[${ENVIRONMENT}]  verify=true
    ${param} =  Create Dictionary  token=${token}
    ${response} =  Get Request  User-Profile  /v1/user/profile  params=${param}
    &{user_info} =  Set To Dictionary  ${response.json()}
    @{user_info} =  Create List  ${user_info.verify_status} 
    Log  ${user_info}
    [return]  @{user_info}

###########CATEGORY###########
Get Category List Master Data
    Create Session  User-Category  ${API_URL}[${ENVIRONMENT}]  verify=true
    ${response} =  Get Request  User-Category  /api/v3/public/master-data/user-category?format=list
    [return]  ${response.json()}


Get Category Name
    [Arguments]  ${category_code}  ${type}  ${language}
    ${category} =  Get Category List Master Data
    ${category_name} =  Create List
    FOR  ${i}  IN  @{category}
        Run keyword if  '${i}[code]'=='${category_code}' and '${i}[type]'=='${type}'  Append to list  ${category_name}  ${i}[name][${language}]
    END
    Log  ${category_name}[0]
    [Return]  ${category_name}[0]

Get Category Code
    [Arguments]  ${category_name}  ${type}  ${language}
    ${category} =  Get Category List Master Data
    ${category_code} =  Create List
    FOR  ${i}  IN  @{category}
        Run keyword if  '${i}[name][${language}]'=='${category_name}' and '${i}[type]'=='${type}'  Append to list  ${category_code}  ${i}[code]
    END
    Log  ${category_code}[0]
    [Return]  ${category_code}[0]

Get Category List
    [Arguments]  ${type}  ${language}
    ${category} =  Get Category List Master Data
    ${category_list1} =  Create List
    FOR  ${i}  IN  @{category}
        Run keyword if  ${i}[level]==1 and '${i}[type]'=='${type}'  Append to list  ${category_list1}  ${i}[name][${language}]
    END
    Log  ${category_list1}
    [Return]  ${category_list1}

Get Subcategory List
    [Arguments]  ${type}  ${parent_code}  ${language}
    ${category} =  Get Category List Master Data
    ${category_list2} =  Create List
    FOR  ${i}  IN  @{category}
        Run keyword if  ${i}[level]==2 and '${i}[type]'=='${type}'  Run keyword if  '${i}[parent_code]'=='${parent_code}'  Append to list  ${category_list2}  ${i}[name][${language}]
    END
    Log  ${category_list2}
    [Return]  ${category_list2}

Get User Type And Category
    [Arguments]  ${token}
    Create Session  User-Profile  ${API_URL}[${ENVIRONMENT}]  verify=true
    ${param} =  Create Dictionary  token=${token}
    ${response} =  Get Request  User-Profile  /v1/user/profile  params=${param}
    &{user_category} =  Set To Dictionary  ${response.json()}
    @{user_category} =  Create List  ${user_category.user_type}  ${user_category.categories[0].code}  ${user_category.categories[0].child_code[0]}
    Log  ${user_category}
    [return]  @{user_category}



# *** Test Cases *** 
# Test
#     Get Subcategory List  SMEs  FOOD  vi
#     ${token} =  User Activate  84981875523
#     Get Verify Status   ${token}
    # Open browser  https://appstg.ahamove.com/sign-in   chrome
    # SignInPage.Click To Tap SignUp
    # SignUpPage.Click Menu Category