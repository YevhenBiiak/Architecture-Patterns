//
//  LoginScreen_UITests.swift
//  ArchitecturePatternsUITests
//
//  Created by Yevhen Biiak on 11.01.2023.
//

import XCTest

final class LoginScreen_UITests: XCTestCase {
    
    var app: XCUIApplication!
    
    var usernameField: XCUIElement { app.textFields["Username"] }
    var passwordField: XCUIElement { app.secureTextFields["Password"] }
    var loginButton:   XCUIElement { app.buttons["Login"] }
    var logoutButton:  XCUIElement { app.buttons["Log Out"] }

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func test_LoginScreen_loginButton_shouldReceiveWarningWhenSignInWithEmptyTextFields() {
        // Given
        let emptyText = ""
        
        // When
        signInWith(username: emptyText, password: emptyText, waitForExistenceLogoutButton: false)
        
        // Then
        XCTAssert(app.staticTexts["The Name and Password fields cannot be empty"].exists)
    }
    
    func test_LoginScreen_loginButton_shouldSignInWithTestUsernameAndPassword() {
        // Given
        let testUsername = "Admin"
        let testPassword = "Admin"
        
        // When
        signInWith(username: testUsername, password: testPassword)
        
        // Then
        XCTAssertTrue(logoutButton.exists)
    }
    
    func test_LoginScreen_nextAndDoneButtonsOnKeyboard_shouldSignInWithTestUsernameAndPassword() {
        // Given
        let testUsername = "Admin"
        let testPassword = "Admin"
        
        // When
        usernameField.tap()
        usernameField.typeText(testUsername)
        app.buttons["Next:"].tap()
        
        passwordField.tap()
        passwordField.typeText(testPassword)
        app.buttons["Done"].tap()
        
        // Then
        XCTAssertTrue(logoutButton.exists)
    }
}

// MARK: - Helper methods

extension LoginScreen_UITests {
    
    func signInWith(username: String, password: String, waitForExistenceLogoutButton: Bool = true) {
        
        usernameField.tap()
        usernameField.typeText(username)
        
        passwordField.tap()
        passwordField.typeText(password)
        
        loginButton.tap()
        
        if waitForExistenceLogoutButton {
            XCTAssertTrue(logoutButton.waitForExistence(timeout: 1))
        }
    }
}
