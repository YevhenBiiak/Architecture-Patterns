//
//  LoginRouter_MVVM.swift
//  Architecture Patterns
//
//  Created by Yevhen Biiak on 11.01.2023.
//

class LoginRouterImpl_MVVM: LoginRouter_MVVM {
    
    private weak var view: LoginViewController_MVVM?
    
    init(view: LoginViewController_MVVM) {
        self.view = view
    }
    
    func presentMainScene(with user: User) {
        let mainViewController = MainViewController_MVVM()
        mainViewController.assembler = MainAssemblerImpl_MVVM(user: user)
        
        mainViewController.modalPresentationStyle = .fullScreen
        view?.present(mainViewController, animated: true)
    }
}
