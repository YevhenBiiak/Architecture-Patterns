//
//  LoginConfigurator_MVP.swift
//  Architecture Patterns
//
//  Created by Yevhen Biiak on 11.01.2023.
//

protocol LoginConfigurator_MVP {
    func configure(view: LoginViewController_MVP)
}

class LoginConfiguratorImpl_MVP: LoginConfigurator_MVP {
    
    func configure(view: LoginViewController_MVP) {
        
        let router = LoginRouterImpl_MVP(view: view)
        let presenter = LoginPresenterImpl_MVP(view: view, router: router)
        
        view.rootView = LoginView()
        view.presenter = presenter
    }
}
