*** Settings ***
Library  SeleniumLibrary
Resource  ../library/CommonKeywords.robot

*** Keywords ***

Add item to wishlist
    ${firstProductHeart}  Get xpaths from the JSON file for Mobel Page
    Click element  ${firstProductHeart}