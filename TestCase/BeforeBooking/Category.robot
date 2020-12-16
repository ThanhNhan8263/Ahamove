*** Setting ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  Collections
Library  BuiltIn

Resource   ${EXECDIR}/Script/SignUpDF.robot
Resource   ${EXECDIR}/Script/CategoryDF.robot
Resource   ${EXECDIR}/Script/ProfileDF.robot

Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Test Cases ***
#Verify that show popup request to update if user don't have category info at new order page
#    [Tags] TC_show_popup_if_don't_have_category_info_at_new_order_page
#    Given User don't have field "user_type","categories" and "category"
#    When User open to new order page
#    Then Show popup request to update category
#
#Verify that don't show popup if user have category info
#    [Tags] TC_don't_show_popup_if_user_have_category_info
#    Given User have field "user_type","categories" or "category"
#    When User open to new order page
#    Then Open to new order page
#
#
#Verify that when click out popup should be able close popup
#    [Tags] TC_click_out_of_popup_should_close_popup
#    Given User don't have field "user_type","categories" and "category"
#    When User open to new order page
#    And User click to out of popup update category
#    Then Open to new order page
#
#Verify that show popup update category at user profle
#    [Tags] TC_show_popup_update_at_user_profile
#    Given User don't have field "user_type","categories"
#    When Open profile screen
#    Then Show popup update category
#    And reward point matching with config data
#
#Verify that show don't popup update category at user profle if user have been update
#    [Tags] TC_don't_show_popup_update_at_user_profile_if_user_have_been_update
#    Given User have field "user_type","categories"
#    When Open profile screen
#    Then Show user profile screen
#
#Verify that show banner update category at user profle
#    [Tags] TC_show_banner_update_at_user_profile
#    Given User don't have field "user_type","categories"
#    When Open profile screen
#    Then Show banner update category
#    And reward point matching with config data
#
#Verify that don't show banner update category at user profle if user have been update
#    [Tags] TC_don't_show_banner_update_at_user_profile_if_user_have_been_update
#    Given User have field "user_type","categories"
#    When Open profile screen
#    Then Show user profile screen don't have banner
#
#Verify that when click to update now at popup should be able lead to Business type screen
#    [Tags] TC_click_update_new_at_popup_lead_to_business_type_screen
#    Given User don't have field "user_type","categories" and "category"
#    When User open to new order page
#    And User click to update now at popup update category
#    Then Open to bussiness type screen


#REGISTER
#Verify that when click on category menu at signin should be able go to Business type
#    [Tags] TC_click_on_category_new_at_signin_go_to_business_type_screen
#    Given User open app to sign up screen
#    And User click on category menu
#    Then Open to bussiness type screen
#
#DETAIL
Verify that when click choose Individual should be able show category Individual
    [Tags]  TC_click_choose_Individual_show_category_Individual
    Given User open app to sign up screen
    And User click on category menu
    When User click choose business type Individual
    Then Open and auto choose category Individual  Individual  vi

Verify that when click choose SMEs should be able show category SMEs
    [Tags]  TC_click_choose_SMEs_show_category_SMEs
    Given User open app to sign up screen
    And User click on category menu
    When User click choose business type SMEs
    Then Open and show list category SMEs and blank screen  SMEs  vi

Verify that when click choose Corporation should be able show category Corporation
    [Tags]  TC_click_choose_Corporation_show_category_Corporation
    Given User open app to sign up screen
    And User click on category menu
    When User click choose business type Corporation
    Then Open and show list category Corporation and blank screen  Corporation  vi

Verify that when search invalid category should be able show not found
    [Tags]  TC_search_invalid_category_show_not_found
    Given User open app to sign up screen
    And User click on category menu
    And User click choose business type Individual
    When User click on search bar and input category  abc
    Then Show not found category  abc

Verify that when click on search result should be able choose that category
    [Tags]  TC_click_on_search_result_choose_that_category
    Given User open app to sign up screen
    And User click on category menu
    And User click choose business type Corporation
    When User click on search bar and input category  Hoa
    And Show list result category and user click on result  Hoa
    Then Choose that category success  Hoa

#Verify that click on category should be able show list subcategory
#    [Tags] TC_click_on_category_should_list_subcategory
#    Given User open app to sign up screen
#    And User click on category menu
#    And User click choose business type SMEs
#    When User click on category on the left  SMEs  FOOD  vi
#    Then Show subcategory on the right  SMEs  FOOD  vi

#Verify that click again on choose category should be able hide list subcategory
#    [Tags] TC_click_again_on_choose_category_should_hide_list_subcategory
#    Given User open app to sign up screen
#    And User click on category menu
#    And User click choose business type SMEs
#    And User click on category on the left
#    When User click again on choose category
#    Then Hide subcategory on the right
#
#Verify that choose many category should be able to scroll and show list subcategory
#    [Tags] TC_choose_many_category_scroll_and_show_list_subcategory
#    Given User open app to sign up screen
#    And User click on category menu
#    And User click choose business type SMEs
#    When User click on many category on the left
#    Then Scroll and show all list subcategory
#
#Verify that disable save button and selected category toggle when don't choose any subcategory
#    Given User open app to sign up screen
#    And User click on category menu
#    When User click choose business type SMEs
#    Then Save button is disable
#    And Selected category toggle is disable
#
#Verify that enable save button when choose subcategory
#    Given User open app to sign up screen
#    And User click on category menu
#    And User click choose business type SMEs
#    When User click on category on the left
#    And User click on subcategory
#    Then Save button enable and available to click
#
#Verify that show chosse category when click on selected category
#    Given User open app to sign up screen
#    And User click on category menu
#    And User click choose business type SMEs
#    When User click on category on the left
#    And User click on subcategory
#    And User click on selected category toggle
#    Then Show selected category
#    And Click again should show all list again
#
#Verify that click back on category screen to business screen
#    [Tags] TC_click_back_on_category_to_business
#    Given User open app to sign up screen
#    And User click on category menu
#    And User click choose business type SMEs
#    When User click back
#    Then Open to bussiness type screen
#
#Verify that when click x on popup should be able close popup
#    [Tags] TC_click_x_on_popup
#    Given User open app to sign up screen
#    And User click on category menu
#    When User click x
#    Then Close popup
#
#Verify that when click to yes at confirm close popup should be able to close popup
#    [Tags] TC_click_yes_at_confirm_close
#    Given User open app to sign up screen
#    And User click on category menu
#    And User click choose business type SMEs
#    And User click on category on the left
#    And User click on subcategory
#    When User click x
#    And Click yes at cofirm popup
#    Then Close popup
#
#Verify that when click to no at confirm close popup should be able stay on screen
#    [Tags] TC_click_no_at_confirm_close
#    Given User open app to sign up screen
#    And User click on category menu
#    And User click choose business type SMEs
#    And User click on category on the left
#    And User click on subcategory
#    When User click x
#    And Click no at cofirm popup
#    Then Still show popup
#
#Verify that when click out of popup cannot close popup
#    [Tags] TC_click_out_of_popup_cannot_close_popup
#    Given User open app to sign up screen
#    And User click on category menu
#    When User click out of popup
#    Then Still show popup
#
Verify that when click save category should be able save success on database
    [Tags]  TC_save_category_should_save_on_database
    Given User open to profile screen  84910000005
    And User click on category menu at profile
    And User click choose business type SMEs
    And User click on category on the left  SMEs  FOOD  vi
    And User click on subcategory  SMEs  FAST FOOD  vi
    When User click on Save button
    Then Save category success to database  84910000005  SMEs  FOOD  FAST FOOD