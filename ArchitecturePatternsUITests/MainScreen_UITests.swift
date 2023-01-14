//
//  MainScreen_UITests.swift
//  ArchitecturePatternsUITests
//
//  Created by Yevhen Biiak on 14.01.2023.
//

import XCTest

final class MainScreen_UITests: XCTestCase {
    
    var app: XCUIApplication!
    
    var usernameField: XCUIElement { app.textFields["Username"] }
    var passwordField: XCUIElement { app.secureTextFields["Password"] }
    var logoutButton:  XCUIElement { app.buttons["Log Out"] }
    var loginButton:   XCUIElement { app.buttons["Login"] }

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }
    
    func test_MainScreen_usernameLabel_shouldDisplayUsernameAfterSignIn() {
        // Given
        let testUsername = "Admin"
        let testPassword = "Admin"
        
        // When
        signInWith(username: testUsername, password: testPassword)
        
        // Then
        XCTAssertTrue(app.staticTexts[testUsername].waitForExistence(timeout: 1))
    }
    
    func test_MainScreen_logoutButton_shoulReturnToSignInScreenWithEmptyTextFields() {
        // Given
        let testUsername = "Admin"
        let testPassword = "Admin"
        signInWith(username: testUsername, password: testPassword)
        
        // When
        logoutButton.tap()
        
        // Then
        XCTAssertTrue(loginButton.waitForExistence(timeout: 1))
    
        XCTAssertEqual(usernameField.value as? String, usernameField.placeholderValue)
        XCTAssertEqual(passwordField.value as? String, passwordField.placeholderValue)
    }
}

// MARK: - Helper methods

extension MainScreen_UITests {
    
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
