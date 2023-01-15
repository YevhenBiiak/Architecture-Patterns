//
//  LoginRouter_MVP_Spy.swift
//  ArchitecturePatternsTests
//
//  Created by Yevhen Biiak on 15.01.2023.
//

@testable import Architecture_Patterns

class LoginRouter_MVP_Spy: LoginRouter_MVP {
    var user: User = User(username: "", password: "")
    
    func presentMainScene(with user: User) {
        self.user = user
    }
}
