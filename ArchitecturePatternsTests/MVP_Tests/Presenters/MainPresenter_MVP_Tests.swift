//
//  MainPresenter_MVP_Tests.swift
//  ArchitecturePatternsTests
//
//  Created by Yevhen Biiak on 15.01.2023.
//

import XCTest
@testable import Architecture_Patterns

final class MainPresenter_MVP_Tests: XCTestCase {
    
    var user: User!
    let mainView = MainView_MVP_Spy()
    let mainRouter = MainRouter_MVP_Spy()
    
    var sut: MainPresenterImpl_MVP!

    override func setUpWithError() throws {
        user = User(username: UUID().uuidString, password: UUID().uuidString)
        sut = MainPresenterImpl_MVP(view: mainView, router: mainRouter, user: user)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_viewDidLoad_shouldDisplayUsername() {
        // When
        sut.viewDidLoad()
        
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
