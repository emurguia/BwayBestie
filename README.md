# BwayBestie
An iOS app that makes it easier to enter online lotteries for Broadway tickets.
<div> 
<img src="https://github.com/emurguia/broadway-lottery/blob/gh-pages/assets/Screenshots/1.jpg" width="250">
<img src="https://github.com/emurguia/broadway-lottery/blob/gh-pages/assets/Screenshots/2.jpg" width="250">
<img src="https://github.com/emurguia/broadway-lottery/blob/gh-pages/assets/Screenshots/3.jpg" width="250">
</div> 

## Inspiration
Broadway shows are one of the main attractions of New York City for tourists and locals alike. Many shows have introduced daily online lotteries to give fans an opportunity to win cheap tickets, but keeping track of all the different websites and entry times is frustrating. That's where **BwayBestie** comes in. 

## Features
- Every online lottery for Broadway tickets in one place.
- Enter your information once and BwayBestie will autofill your entry forms every time.
- Get notified when lotteries open so you never forget to enter. 
- Get notified when lotteries close so you can check your results.

## How I built it
BwayBestie is built entirely in Swift and made use of several of APIs, including [SwiftWebVC](https://github.com/meismyles/SwiftWebVC) to display the lottery websites and [SideMenuController](https://github.com/teodorpatras/SideMenuController) to for the navigation. To achieve the autofill of entry forms, BwayBestie injects JavaScript into the SwiftWebVC browser. 
