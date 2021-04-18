*** Settings ***
Library   SeleniumLibrary
Library   JSONLibrary
Library   OperatingSystem

*** Variables ***


*** Keywords ***
###################### Test Setup ######################
Start Test Case
    [Documentation]
    ${url}  ${browser_type}  Get url and browser type
    ${email}  ${password}  Get user credentials

    # Create and open browser accroding to url & browser type
    Open Browser  ${url}  ${browser_type}
    sleep  5  # wait until login window appears

    Login  ${email}  ${password}

###################### Test Teardown ######################
Finish Test Case
    [Documentation]
    Close Browser

###################### JSON LOCATOR READERS ######################
Read user credentials' locators
    # read the json data
    ${json}=  Get file  ../data/user_credentials.json

    # convert the data to a object
    ${object}=  Evaluate  json.loads(r'''${json}''')
    [return]  ${object}

Read test data
    # read the json data
    ${json}=  Get file  ../data/test_data.json

    # convert the data to a object
    ${object}=  Evaluate  json.loads(r'''${json}''')
    [return]  ${object}

Read object repository locators
    # read the json data
    ${json}=  Get file  ../library/ObjectRepository.json

    # convert the data to a object
    ${object}=  Evaluate  json.loads(r'''${json}''')
    [return]  ${object}

###################### LOGIN ###################### (Here is not a good place for it)
Login
    [Documentation]
    [Arguments]  ${email}  ${password}
    Accept Cookies
    Input Username and Password  ${email}  ${password}

###################### GETTERS FOR PAGE OBJECTS ######################
Get user credentials
    [Documentation]
    ${object}  Read user credentials' locators
    # assign recieved xpath to a variable
    ${email}=  Set Variable  ${object["registerInfo"][0]["email"]}
    ${password}=  Set Variable  ${object["registerInfo"][0]["password"]}
    [return]   ${email}  ${password}

Get url and browser type
    [Documentation]  TBD
    ${object}  Read test data
    # assign recieved xpath to a variable
    ${url}=  Set Variable  ${object["url"]}
    ${browser_type}=  Set Variable  ${object["browserType"]}

    [return]   ${url}  ${browser_type}

Get xpaths from the JSON file for Home Page
    [Documentation]  TBD
    ${object}  Read object repository locators
    # assign recieved xpath to a variable
    ${mobel_xpath}=  Set Variable  ${object["MainPage"][0]["MenuTab"][0]["Mobel"]}

    [return]  ${mobel_xpath}

Get xpaths from the JSON file for Wishlist Icon
    [Documentation]  TBD
    ${object}  Read object repository locators

    # assign recieved xpath to a variable
    ${WishlistIcon}=  Set Variable  ${object["MainPage"][3]["WishlistIcon"]}

    [return]  ${WishlistIcon}

Get xpaths from the JSON file for Wishlist Page
    [Documentation]  TBD
    ${object}  Read object repository locators

    # assign recieved xpath to a variable
    ${WishlistCount}=  Set Variable  ${object["MainPage"][3]["WishlistCount"]}

    [return]  ${WishlistCount}

Get xpaths from the JSON file for Wishlist Product
    [Documentation]  TBD
    ${object}  Read object repository locators

    # assign recieved xpath to a variable
    ${RemoveProduct}=  Set Variable  ${object["WishlistPage"][0]["Product"][0]["RemoveProduct"]}
    [return]  ${RemoveProduct}

Get xpaths from the JSON file for Mobel Page
    [Documentation]  TBD
    ${object}  Read object repository locators

    # assign recieved xpath to a variable
    ${firstProductHeart}=  Set Variable  ${object["MainPage"][1]["MobelPage"][0]["firstProductHeart"]}
    [return]  ${firstProductHeart}

Get xpaths from the JSON file for a Product
    [Documentation]  TBD
    ${object}  Read object repository locators

    # assign recieved xpath to a variable
    ${firstProductHeart}=  Set Variable  ${object["MainPage"][1]["MobelPage"][0]["RemoveProductHeart"]}
    [return]  ${firstProductHeart}

#!! NOT BELONG ANY PAGE, BECAUSE OF IT, THIS BUTTON CANNOT BE CATEGORIZED
Get cookie button
    [Documentation]  TBD
    ${object}  Read object repository locators

    # assign recieved xpath to a variable
    ${Cookie_button}=  Set Variable  ${object["MainPage"][0]["MenuTab"][1]["acceptCookie"]}

    [return]  ${Cookie_button}

Get xpaths of login window from the JSON file for Home Page
    [Documentation]  TBD
    ${object}  Read object repository locators

    ${username}=  Set Variable  ${object["MainPage"][2]["LoginPage"][0]["username"]}
    ${password}=  Set Variable  ${object["MainPage"][2]["LoginPage"][0]["password"]}
    ${recieveMailBox}=  Set Variable  ${object["MainPage"][2]["LoginPage"][0]["recieveMailBox"]}
    ${RegisterButton}=  Set Variable  ${object["MainPage"][2]["LoginPage"][0]["RegisterButton"]}

    [return]  ${username}  ${password}  ${recieveMailBox}  ${RegisterButton}