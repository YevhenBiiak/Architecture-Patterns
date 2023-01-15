//
//  MainView_MVP_Spy.swift
//  ArchitecturePatternsTests
//
//  Created by Yevhen Biiak on 15.01.2023.
//

@testable import Architecture_Patterns

class MainView_MVP_Spy: MainView_MVP {
    var username: String!
    
    func display(username: String) {
        self.username = username
    }
}
