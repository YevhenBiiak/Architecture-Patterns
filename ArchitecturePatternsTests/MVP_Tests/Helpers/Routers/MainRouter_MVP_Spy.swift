//
//  MainRouter_MVP_Spy.swift
//  ArchitecturePatternsTests
//
//  Created by Yevhen Biiak on 15.01.2023.
//

@testable import Architecture_Patterns

class MainRouter_MVP_Spy: MainRouter_MVP {
    var dismissCalled: Bool = false
    
    func dismiss() {
        dismissCalled = true
    }
}
