//
//  MainRouter_MVVM.swift
//  Architecture Patterns
//
//  Created by Yevhen Biiak on 11.01.2023.
//

class MainRouterImpl_MVVM: MainRouter_MVVM {
    
    private weak var view: MainViewController_MVVM?
    
    init(view: MainViewController_MVVM?) {
        self.view = view
    }
    
    func dismiss() {
        view?.dismiss(animated: true)
    }
}
