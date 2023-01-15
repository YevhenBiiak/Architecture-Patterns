//
//  LoginPresenter_MVP_Tests.swift
//  ArchitecturePatternsTests
//
//  Created by Yevhen Biiak on 15.01.2023.
//

import XCTest
@testable import Architecture_Patterns

final class LoginPresenter_MVP_Tests: XCTestCase {
    
    let loginView = LoginView_MVP_Spy()
    let loginRouter = LoginRouter_MVP_Spy()
    
    var sut: LoginPresenterImpl_MVP!

    override func setUpWithError() throws {
        sut = LoginPresenterImpl_MVP(view: loginView, router: loginRouter)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_viewDidLoad_shouldDisplayEmptyLoginStatus() {
        // When
        sut.viewDidLoad()
        
        // Then
        XCTAssertTrue(loginView.loginStatus.isEmpty)
    }
    
    func test_login_withEmptyParameters_shouldDisplayNoEmptyLoginStatus() {
        // Given
        let emptyText = ""
        
        // When
        sut.login(username: emptyText, password: emptyText)
        
        // Then
        XCTAssertFalse(loginView.loginStatus.isEmpty)
    }
    
    func test_login_withNoRegisteredUser_shouldDisplayNoEmptyLoginStatus() {
        // Given
        let username = "John"
        let password = "12345"
        
        // When
        sut.login(username: username, password: password)
        
        // Then
        XCTAssertFalse(loginView.loginStatus.isEmpty)
    }
    
    func test_login_withRegisteredUser_shouldNavigateToTheMainScreen() {
        // Given
        let username = "Admin"
        let password = "Admin"
        
        // When
        sut.login(username: username, password: password)
        
        // Then
        XCTAssertEqual(loginRouter.user.username, username)
        XCTAssertEqual(loginRouter.user.password, password)
    }
}
