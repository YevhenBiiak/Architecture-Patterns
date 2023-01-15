//
//  MainViewModel_MVVM_Tests.swift
//  ArchitecturePatternsTests
//
//  Created by Yevhen Biiak on 15.01.2023.
//

import XCTest
@testable import Architecture_Patterns

class MainView_MVVM_Spy {
    var username: String!
    var viewModel: MainViewModel_MVVM
    
    init(viewModel: MainViewModel_MVVM) {
        self.viewModel = viewModel
        viewModel.username.bind { [weak self] username in
            self?.username = username
        }
    }
}

class MainRouter_MVVM_Spy: MainRouter_MVVM {
    var dismissCalled: Bool = false
    
    func dismiss() {
        dismissCalled = true
    }
}

final class MainViewModel_MVVM_Tests: XCTestCase {

    var user: User!
    var mainView: MainView_MVVM_Spy!
    let mainRouter = MainRouter_MVVM_Spy()
    
    var sut: MainViewModelImpl_MVVM!

    override func setUpWithError() throws {
        user = User(username: UUID().uuidString, password: UUID().uuidString)
        sut = MainViewModelImpl_MVVM(router: mainRouter, user: user)
        mainView = MainView_MVVM_Spy(viewModel: sut)
    }

    override func tearDownWithError() throws {
        mainView = nil
        sut = nil
    }
    
    func test_init_shouldDisplayUsername() {
        // When
        user = User(username: UUID().uuidString, password: UUID().uuidString)
        sut = MainViewModelImpl_MVVM(router: mainRouter, user: user)
        mainView = MainView_MVVM_Spy(viewModel: sut)
        
        // Then
        XCTAssertEqual(mainView.username, user.username)
    }

    func test_logout_shouldDismissCurrentViewController() {
        // When
        sut.logout()
        
        // Then
        XCTAssertTrue(mainRouter.dismissCalled)
    }
}
