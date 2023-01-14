//
//  ArchitecturePatternsUITests.swift
//  ArchitecturePatternsUITests
//
//  Created by Yevhen Biiak on 11.01.2023.
//

import XCTest

// Naming Structure: test_Unitofwork_StateUnderTest_ExpectedBehavior
// Naming Structure: test_[struct]_[ui component]_[expected result]
// Testing Structure: Given, When, Then

final class ArchitecturePatternsUITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
    }

    func test_LoginScreen_loginButton_shouldReceiveWarningWhenSignInWithEmptyTextFields() {
        // Given
        let usernameField = app.textFields["Username"]
        let passwordField = app.secureTextFields["Password"]
        let loginButton = app.buttons["Login"]
        
        // When
        usernameField.tap()
        usernameField.typeText("")
        
        passwordField.tap()
        passwordField.typeText("")
        
        loginButton.tap()
        
        // Then
        
        XCTAssert(app.staticTexts["The Name and Password fields cannot be empty"].exists)
    }
    
    func test_LoginScreen_loginButton_shouldSignInWithTestUsernameAndPassword() {
        // Given
        let usernameField = app.textFields["Username"]
        let passwordField = app.secureTextFields["Password"]
        let loginButton = app.buttons["Login"]
        
        // When
        usernameField.tap()
        usernameField.typeText("Admin")
        
        passwordField.tap()
        passwordField.typeText("Admin")
        
        loginButton.tap()
        
        // Then
        XCTAssertTrue(app.buttons["Log Out"].staticTexts["Log Out"].exists)
    }
    
    func test_LoginScreen_nextAndDoneButtonsOnKeyboard_shouldSignInWithTestUsernameAndPassword() {
        // Given
        let usernameField = app.textFields["Username"]
        let passwordField = app.secureTextFields["Password"]
        
        // When
        usernameField.tap()
        usernameField.typeText("Admin")
        app.buttons["Next:"].tap()
        
        passwordField.tap()
        passwordField.typeText("Admin")
        
        app.buttons["Done"].tap()
        
        // Then
        XCTAssertTrue(app.buttons["Log Out"].staticTexts["Log Out"].exists)
    }
    
    func test_MainScreen_usernameLabel_shouldDisplayUsernameAfterSignIn() {
        // Given
        let username = "Admin"
        let password = "Admin"
        let usernameField = app.textFields["Username"]
        let passwordField = app.secureTextFields["Password"]
        let loginButton = app.buttons["Login"]
        
        // When
        usernameField.tap()
        usernameField.typeText(username)
        
        passwordField.tap()
        passwordField.typeText(password)
        
        loginButton.tap()
        
        // Then
        XCTAssertTrue(app.staticTexts[username].waitForExistence(timeout: 1))
    }
    
    func test_MainScreen_logoutButton_shoulReturnToSignInScreenWithEmptyTextFields() {
        // Given
        let usernameField = app.textFields["Username"]
        let passwordField = app.secureTextFields["Password"]
        let loginButton = app.buttons["Login"]
        
        // When
        usernameField.tap()
        usernameField.typeText("Admin")
        
        passwordField.tap()
        passwordField.typeText("Admin")
        
        loginButton.tap()
        
        XCTAssertTrue(app.buttons["Log Out"].waitForExistence(timeout: 1))
        let logoutButton = app.buttons["Log Out"]
        logoutButton.tap()
        
        XCTAssertTrue(loginButton.waitForExistence(timeout: 1))
        
        // Then
        let usernameText = usernameField.value as? String
        let passwordText = passwordField.value as? String
    
        XCTAssert(usernameText == usernameField.placeholderValue)
        XCTAssert(passwordText == passwordField.placeholderValue)
    }
}
