*** Settings ***
Library   SeleniumLibrary
Library   JSONLibrary
Library   OperatingSystem
Resource  ../library/CommonKeywords.robot

*** Variables ***

*** Keywords ***
Login
    [Documentation]
    ${email}  ${password}  Get user credentials
    Input Username and Password  ${email}  ${password}

Input Username and Password
    [Arguments]   ${email}  ${password}
    # Get email textbox
    ${username_locator}  ${password_locator}  ${recieveMailBox}  ${terms&conditions}  ${RegisterButton}  Get xpaths of login window from the JSON file for Home Page

    Input text   ${username_locator}  ${email}
    Input text   ${password_locator}  ${password}
    Accept Terms & Conditions  ${terms&conditions}
    Accept mail registration  ${recieveMailBox}
    Click element  ${RegisterButton}

Accept Cookies
    ${Cookie_button}  Get cookie button
    Click element  ${Cookie_button}

Accept mail registration
    [Arguments]   ${recieveMailBox}
    Click element  ${recieveMailBox}

Accept Terms & Conditions
    [Arguments]   ${terms&conditions}
    Click element  ${terms&conditions}