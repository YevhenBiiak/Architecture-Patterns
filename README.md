# Architecture-Patterns

<p align=center>
  <img width=35% src="https://user-images.githubusercontent.com/80542175/226586604-ea4a236a-3419-45d7-b8a2-cdc409fa6769.png"/>
  <img width=35% src="https://user-images.githubusercontent.com/80542175/226586601-f94aeb46-82a0-4f09-b429-c7203d13478b.png"/>
</p>

### Description

This project is a simple app that consists of a login and main screens. The login scene allows users to input a username and password, and if the combination is valid, the user is presented with the main scene. The main scene simply displays the username and a logout button.

## The Goal

The main goal of this project was to learn the difference in data passing and routing between screens using three different architectural patterns (`MVC`, `MVP`, `MVVM`) through a simple app example with two screens.

## Testing

The app has been thoroughly tested using `XCTest`. The testing includes unit tests and UI tests. 
- Unit tests are written for Presenters of `MVP` and ViewModels of `MVVM` using the Test Double unit testing concept. For example, a test case was written to verify that the router method representing the main screen is called after the "Login" button is pressed.
- UI tests were also written to test the app's user interface and overall behavior. For example, a test case was written to ensure that after entering valid login credentials and tapping the "Login" button, the app transitions to the main screen.

## Used Frameworks

- `UIKit`: app UI
- `XCTest`: Unit Testing and UI Testing

## Used Technology Stack

- `Swift`
- `XCode`
- Model-View-Controller (`MVC`) architecture pattern
- Model-View-Presenter (`MVP`) architecture pattern
- Model-View-ViewModel (`MVVM`) architecture pattern

<details>
  <summary><h2>VIDEO DEMO</h2></summary><br>
  <video src="https://user-images.githubusercontent.com/80542175/226585917-9d3397d2-4df3-4eb0-8cf6-d8f8a7a28df8.mov">
</details>
