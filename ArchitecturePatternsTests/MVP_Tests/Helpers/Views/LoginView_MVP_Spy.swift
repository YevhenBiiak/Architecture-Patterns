//
//  LoginView_MVP_Spy.swift
//  ArchitecturePatternsTests
//
//  Created by Yevhen Biiak on 15.01.2023.
//

@testable import Architecture_Patterns
 
class LoginView_MVP_Spy: LoginView_MVP {
    var loginStatus = ""
    
    func display(loginStatus: String) {
        self.loginStatus = loginStatus
    }
}
