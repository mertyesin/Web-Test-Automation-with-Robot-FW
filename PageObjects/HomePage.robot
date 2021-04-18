*** Settings ***
Library   SeleniumLibrary
Library   JSONLibrary
Library   OperatingSystem
Resource  ../PageObjects/MobelPage.robot
Resource  ../PageObjects/LoginPage.robot
Resource  ../library/CommonKeywords.robot

*** Variables ***

*** Keywords ***
Go to Mobel Menu from Home Page
    [Documentation]  TBD
    # get test data and credentials
    ${mobel_xpath}  Get xpaths from the JSON file for Home Page
    Wait Until Element Is Visible  ${mobel_xpath}
    sleep  3
    Click Element  ${mobel_xpath}
    sleep  3
    Maximize Browser Window  # This may seem unnecessary, but the window that opening when hovering over the möbel, can block further actions that follow. Elements may not be found.

Go to Wishlist from Home Page
    [Documentation]  TBD
    # get test data and credentials
    ${wishlist_icon}  Get xpaths from the JSON file for Wishlist Icon
    Wait Until Element Is Visible  ${wishlist_icon}
    Click Element  ${wishlist_icon}




