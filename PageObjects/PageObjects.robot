*** Settings ***
Library   SeleniumLibrary
Library   JSONLibrary
Library   OperatingSystem
Resource  ../PageObjects/MobelPage.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/WishlistPage.robot

*** Keywords ***
Login to website
    Go to My Account
    Login

Add first listed product in Mobel Section to the Wishlist
    Go to Mobel Menu from Home Page
    sleep  5  # Just to be sure that the elements loaded to page properly. I don't like to use this kind of sleeps in code, but i couldn't manage 'wait until element appears' keywords. For now.
    Add item to wishlist

Remove the product from wishlist
    Go to Wishlist from Home Page
    Remove first item listed in Wishlist Page
    sleep  5  # give some time for assertion


