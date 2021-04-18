*** Settings ***
Library   SeleniumLibrary
Library   JSONLibrary
Library   OperatingSystem
Resource  ../PageObjects/MobelPage.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/LoginPage.robot
Resource  ../PageObjects/WishlistPage.robot
Resource  ../library/CommonKeywords.robot

*** Keywords ***
Add first listed product in Mobel Section to the Wishlist
    Go to Mobel Menu from Home Page
    sleep  5  # Just to be sure that the elements loaded to page properly. I don't like to use this kind of sleeps in the coding, but i couldn't manage 'wait until element appears' keywords. For now.
    Add first item to wishlist

Remove the product from wishlist
    Go to Wishlist from Home Page
    Remove first item listed in Wishlist Page

# Check the product removed from wishlist

