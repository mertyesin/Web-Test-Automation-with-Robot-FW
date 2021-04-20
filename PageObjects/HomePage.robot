*** Settings ***
Library   SeleniumLibrary
Library   JSONLibrary
Library   OperatingSystem
Resource  ../library/CommonKeywords.robot

*** Variables ***

*** Keywords ***
Go to Mobel Menu from Home Page
    [Documentation]  Navigate to Möbel Menu
    # get test data and credentials
    ${mobel_xpath}  ${SearchBox}  Get xpaths from the JSON file for Home Page
    sleep  3
    Click Element  ${mobel_xpath}
    Click Element  ${SearchBox}  # This may seem unnecessary, but the window which is opening when hovering over the möbel, can block further actions that follow. Elements may not be found.
    Maximize Browser Window

Go to Wishlist from Home Page
    [Documentation]  Navigate to Wishlist
    # get test data and credentials
    ${wishlist_icon}  Get xpaths from the JSON file for Wishlist Icon
    Wait Until Element Is Visible  ${wishlist_icon}
    Click Element  ${wishlist_icon}




