//
//  MainConfigurator_MVP.swift
//  Architecture Patterns
//
//  Created by Yevhen Biiak on 11.01.2023.
//

protocol MainConfigurator_MVP {
    func configure(view: MainViewController_MVP)
}

class MainConfiguratorImpl_MVP: MainConfigurator_MVP {
    
    private var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func configure(view: MainViewController_MVP) {
        
        let router = MainRouterImpl_MVP(view: view)
        let presenter = MainPresenterImpl_MVP(view: view, router: router, user: user)
        
        view.rootView = MainView()
        view.presenter = presenter
    }
}
