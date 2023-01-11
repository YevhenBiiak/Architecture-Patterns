//
//  MainRouter_MVP.swift
//  Architecture Patterns
//
//  Created by Yevhen Biiak on 11.01.2023.
//

class MainRouterImpl_MVP: MainRouter_MVP {
    
    private weak var view: MainViewController_MVP?
    
    init(view: MainViewController_MVP?) {
        self.view = view
    }
    
    func dismiss() {
        view?.dismiss(animated: true)
    }
}
