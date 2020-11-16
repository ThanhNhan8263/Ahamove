*** Setting ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  RequestsLibrary
Library  String
Library  Collections
Library  BuiltIn

Resource   ${EXECDIR}/Script/SignUpDF.robot

Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Test Cases ***
Verify that show popup request to update if user don't have category info at new order page
    [Tags] TC_show_popup_if_don't_have_category_info_at_new_order_page
    Given User don't have field "user_type","categories" and "category"
    When User open to new order page
    Then Show popup request to update category

Verify that don't show popup if user have category info
    [Tags] TC_don't_show_popup_if_user_have_category_info
    Given User have field "user_type","categories" or "category"
    When User open to new order page
    Then Open to new order page


Verify that when click out popup should be able close popup
    [Tags] TC_click_out_of_popup_should_close_popup
    Given User don't have field "user_type","categories" and "category"
    When User open to new order page
    And User click to out of popup update category
    Then Open to new order page

Verify that show popup update category at user profle
    [Tags] TC_show_popup_update_at_user_profile
    Given User don't have field "user_type","categories"
    When Open profile screen
    Then Show popup update category
    And reward point matching with config data

Verify that show don't popup update category at user profle if user have been update
    [Tags] TC_don't_show_popup_update_at_user_profile_if_user_have_been_update
    Given User have field "user_type","categories"
    When Open profile screen
    Then Show user profile screen

Verify that show banner update category at user profle
    [Tags] TC_show_banner_update_at_user_profile
    Given User don't have field "user_type","categories"
    When Open profile screen
    Then Show banner update category
    And reward point matching with config data

Verify that don't show banner update category at user profle if user have been update
    [Tags] TC_don't_show_banner_update_at_user_profile_if_user_have_been_update
    Given User have field "user_type","categories"
    When Open profile screen
    Then Show user profile screen don't have banner

Verify that when click to update now at popup should be able lead to Business type screen
    [Tags] TC_click_update_new_at_popup_lead_to_business_type_screen
    Given User don't have field "user_type","categories" and "category"
    When User open to new order page
    And User click to update now at popup update category
    Then Open to bussiness type screen

Verify that when click to category menu at signin should be able lead to Business type screen
    [Tags] TC_click_to_category_new_at_signin_lead_to_business_type_screen
    Given User is a new user
    When User open sign in screen
    And User click to category menu
    Then Open to bussiness type screen

Verify that when click to category menu at profile should be able lead to Business type screen
    [Tags] TC_click_to_category_new_at_profile_lead_to_business_type_screen
    Given User don't have field "user_type","categories"
    When User open profile screen
    And User click to category menu
    Then Open to bussiness type screen


Verify that choose business type should be able go to category screen
    [Tags] TC_choose_business_type_should_be_able_go_to_category_screen
    Given User open to Bussiness type screen
    When User click on one of business type
    Then Open to category screen








