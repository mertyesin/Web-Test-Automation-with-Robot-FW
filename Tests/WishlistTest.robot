*** Settings ***
Library  SeleniumLibrary
Library  Screenshot
Documentation     Westwing website wishlist test

Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PageObjects.robot
Resource  ../library/CommonKeywords.robot

Test Setup  CommonKeywords.Start Test Case
Test Teardown  CommonKeywords.Finish Test Case

*** Variables ***

*** Test Cases ***
Add and remove an item to wishlist
    [Documentation]  This test case checks that the items which are added to wishlist and removed from wishlist
    # get test data and credentials

    Add first listed product in Mobel Section to the Wishlist
    Check wishlist product count is  1
    Take screenshot  1_item_in_wishlist_icon

    Remove the product from wishlist
    # Check wishlist product count is  0

*** Keywords ***
Check wishlist product count is
    [Arguments]  ${expected_product_count}
    ${actual_product_count}  Get wishlist product count
    [Return]  ${expected_product_count} == ${actual_product_count}