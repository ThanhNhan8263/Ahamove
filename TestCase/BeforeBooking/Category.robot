*** Setting ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  Collections
Library  BuiltIn

Resource   ${EXECDIR}/Script/CategoryDF.robot
Resource   ${EXECDIR}/Script/SignUpDF.robot

Test Setup  Begin Web Test
Test Teardown  End Web Test

***Variables *** 
${category_code} =  FOOD
${sub_cat} =  FAST FOOD
*** Test Cases ***
########## REGISTER ###########
#1 pass
Verify that choose category success when sign up
    [Tags]  TC_choose_category_success_when_sign_up
    Given User open app to sign up screen
    And User input success full all info
    When User click on category menu
    And User click choose business type  SMEs
    And User click on category on the left  SMEs  ${category_code}  vi
    And User click on subcategory  SMEs  ${sub_cat}  vi
    And User click on Save button
    And User click to Sign Up button
    And Go to input activation code screen and input code success
    Then User sign up success to new order screen  SMEs  FOOD  FAST FOOD


########## NEW ORDER ############
#2 pass
Verify show popup request update catgory
    [Tags]  TC_show_popup_request_update_category
    Given User don't have field "user_type","categories" and "category"  84910000008
    When User open to new order page  84910000008
    And Show popup request to update category
    And Click to update button
    And User click choose business type  SMEs
    And User click on category on the left  SMEs  FOOD  vi
    And User click on subcategory  SMEs  FAST FOOD  vi
    And User click on Save button
    Then Save category success to database  84910000008  SMEs  FOOD  FAST FOOD
    And User have field "user_type","categories" or "category"  84910000008
    And User click back new order page 
    And Show new order page



######### PROFILE  ##########
#4 pass
Verify that update category form banner update category at user profle
    [Tags]  TC_update_category_form_banner_update_at_user_profile
    Given User don't have field "user_type","categories" and "category"  84910000005
    And User open to profile screen  84910000005
    When Click to banner category at user profile
    And User click choose business type  Corporation
    And User click on category on the left  Corporation  FOOD  vi
    And User click on category on the left  Corporation  OTHER  vi
    And User click on subcategory  Corporation  FAST FOOD  vi
    And User input other category  Đồ linh tinh
    And User click on Save button
    Then Save category success to database  84910000005  Corporation  FOOD  FAST FOOD



#5 pass
Verify that don't show popup and banner update category at user profle if user have been update
    [Tags]  TC_donnot_show_popup_update_at_user_profile_if_user_have_been_update
    Given User have field "user_type","categories" or "category"  84981875523
    When User open to profile screen  84981875523
    Then Don't Show banner update category

#6 pass
Verify that when user have verify_status = REJECT, COMPLETED, SUBMITTED then can't choose business type
    [Tags]  TC_when_verify_status_reject_completed_submitted_then_cannot_choose_business_type
    Given User have verify status "reject" or "completed" or "submitted"  84981875523
    And User open to profile screen  84981875523
    When User click on category menu at profile
    Then Open to choose category screen and can't click back to bussiness type


############ DETAIL #############
#7 pass
Verify that when click choose Individual should be able show category Individual
    [Tags]  TC_click_choose_Individual_show_category_Individual
    Given User open app to sign up screen
    And User click on category menu
    When User click choose business type  Individual
    Then List category Individual is displayed and automatically selected  Individual  vi

#8 pass
Verify that when click choose SMEs should be able show category SMEs
    [Tags]  TC_click_choose_SMEs_show_category_SMEs
    Given User open app to sign up screen
    And User click on category menu
    When User click choose business type  SMEs
    Then List category SMEs is displayed and blank screen  SMEs  vi

#9 pass
Verify that when click choose Corporation should be able show category Corporation
    [Tags]  TC_click_choose_Corporation_show_category_Corporation
    Given User open app to sign up screen
    And User click on category menu
    When User click choose business type  Corporation
    Then List category Corporation is displayed and blank screen  Corporation  vi

#10 pass
Verify that when search invalid category should be able show not found
    [Tags]  TC_search_invalid_category_show_not_found
    Given User open app to sign up screen
    And User click on category menu
    And User click choose business type  Individual
    When User click on search bar and input category  abc
    Then Show not found category  abc

#11 pass
Verify that when click on search result should be able choose that category
    [Tags]  TC_click_on_search_result_choose_that_category
    Given User open app to sign up screen
    And User click on category menu
    And User click choose business type  Corporation
    When User click on search bar and input category  Hoa
    And Show list result category and user click on result  Hoa
    Then Choose that category success  Hoa

#12 fail, error "Dictionary '${i}' has no key 'parent_code'"
Verify that list subcategory show matching with data
    [Tags]  TC_click_list_category_show_matching_with_data
    Given User open app to sign up screen
    And User click on category menu
    And User click choose business type  Corporation
    When User click on category on the left  Corporation  FOOD  vi
    Then Show subcategory on the right  Corporation  FOOD  vi

#13 pass
Verify that click again on choose category should be able hide list subcategory
    [Tags]  TC_click_again_on_choose_category_should_hide_list_subcategory
    Given User open app to sign up screen
    And User click on category menu
    And User click choose business type  SMEs
    When User click category twice  SMEs  FOOD  vi
    Then Hide subcategory on the right

#14 pass
Verify that choose many category should be able to scroll and show list subcategory
    [Tags]  TC_choose_many_category_scroll_and_show_list_subcategory
    Given User open app to sign up screen
    And User click on category menu
    And User click choose business type  Corporation
    When User click on many category on the left  1  4
    Then Scroll and click list subcategory  Corporation  FAST FOOD  vi  Đồ ăn

#15 pass 
Verify that when don't choose any subcategory then disable save button and selected category toggle
    [Tags]  TC_when_donnot_choose_subcategory_then_disable_save_button_and_toggle
    Given User open app to sign up screen
    And User click on category menu
    When User click choose business type  SMEs
    Then Save button is disable
    And Selected category toggle is disable

#16 pass
Verify that enable save button when choose subcategory
    [Tags]  TC_when_choose_subcategory_then_enable_save_button_and_toggle
    Given User open app to sign up screen
    And User click on category menu
    And User click choose business type  Corporation
    When User click on category on the left  Corporation  FOOD  vi
    And User click on subcategory  Corporation  FAST FOOD  vi
    Then Save button enable and available to click

#17 pass
Verify that show chosse category when click on selected category
    [Tags]  TC_show_choose_category_when_click_selected_category
    Given User open app to sign up screen
    And User click on category menu
    And User click choose business type  SMEs
    When User click on category on the left  SMEs  FOOD  vi
    And User click on subcategory  SMEs  FAST FOOD  vi
    And User click on selected category toggle
    Then Show selected category  SMEs  FOOD  FAST FOOD  vi

#18 pass
Verify that click back on category screen to business screen
    [Tags]  TC_click_back_on_category_to_business
    Given User open app to sign up screen
    And User click on category menu
    And User click choose business type  SMEs
    When User click back
    Then Open to bussiness type screen


#20 pass
Verify that when click confirm close popup
    [Tags]  TC_click_confirm_close_popup
    Given User open app to sign up screen
    And User click on category menu
    And User click choose business type  SMEs
    When User click on category on the left  SMEs  FOOD  vi
    And User click on subcategory  SMEs  FAST FOOD  vi
    When User click x
    And Click no at cofirm popup and still Show popup
    And User click x
    And Click yes at cofirm popup
    Then Close popup

