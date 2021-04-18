*** Settings ***
Library  SeleniumLibrary
Resource  ../library/CommonKeywords.robot

*** Keywords ***
Get wishlist product count
    sleep  5
    ${productCountPath}  Get xpaths from the JSON file for Wishlist Page
    ${productCount}  Get text  ${productCountPath}
    [return]  ${productCount}

Remove first item listed in Wishlist Page
    sleep  5
    ${RemoveProduct}  Get xpaths from the JSON file for Wishlist Product
    Click Element  ${RemoveProduct}