//
//  LoginViewModel_MVVM_Tests.swift
//  ArchitecturePatternsTests
//
//  Created by Yevhen Biiak on 15.01.2023.
//

import XCTest
@testable import Architecture_Patterns

final class LoginViewModel_MVVM_Tests: XCTestCase {
    
    var loginView: LoginView_MVVM_Spy!
    let loginRouter = LoginRouter_MVVM_Spy()
    
    var sut: LoginViewModelImpl_MVVM!
    
    override func setUpWithError() throws {
        sut = LoginViewModelImpl_MVVM(router: loginRouter)
        loginView = LoginView_MVVM_Spy(viewModel: sut)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_init_shouldDisplayEmptyLoginStatus() {
        // Given
        let loginView: LoginView_MVVM_Spy
        
        // When
        loginView = LoginView_MVVM_Spy(viewModel: sut)
        
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
