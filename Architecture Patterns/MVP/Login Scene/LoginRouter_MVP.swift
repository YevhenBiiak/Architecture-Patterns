//
//  LoginRouter_MVP.swift
//  Architecture Patterns
//
//  Created by Yevhen Biiak on 11.01.2023.
//

class LoginRouterImpl_MVP: LoginRouter_MVP {
    
    private weak var view: LoginViewController_MVP?
    
    init(view: LoginViewController_MVP?) {
        self.view = view
    }
    
    func presentMainScene(with user: User) {
        let mainViewController = MainViewController_MVP()
        mainViewController.configurator = MainConfiguratorImpl_MVP(user: user)
        
        mainViewController.modalPresentationStyle = .fullScreen
        view?.present(mainViewController, animated: true)
    }
}
