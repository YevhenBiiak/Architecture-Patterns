//
//  LoginRouter_MVVM_Spy.swift
//  ArchitecturePatternsTests
//
//  Created by Yevhen Biiak on 15.01.2023.
//

@testable import Architecture_Patterns

class LoginRouter_MVVM_Spy: LoginRouter_MVVM {
    var user: User!
    
    func presentMainScene(with user: User) {
        self.user = user
    }
}
