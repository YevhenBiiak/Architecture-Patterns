//
//  LoginView_MVVM_Spy.swift
//  ArchitecturePatternsTests
//
//  Created by Yevhen Biiak on 15.01.2023.
//

@testable import Architecture_Patterns

class LoginView_MVVM_Spy {
    
    var loginStatus: String!
    var viewModel: LoginViewModel_MVVM
    
    init(viewModel: LoginViewModel_MVVM) {
        self.viewModel = viewModel
        self.viewModel.loginStatus.bind { [weak self] status in
            self?.loginStatus = status
        }
    }
}
