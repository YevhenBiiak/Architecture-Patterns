//
//  LoginAssembler_MVVM.swift
//  Architecture Patterns
//
//  Created by Yevhen Biiak on 11.01.2023.
//

protocol LoginAssembler_MVVM {
    func assembly(_ view: LoginViewController_MVVM)
}

class LoginAssemblerImpl_MVVM: LoginAssembler_MVVM {
    
    func assembly(_ view: LoginViewController_MVVM) {
        
        let router = LoginRouterImpl_MVVM(view: view)
        let viewModel = LoginViewModelImpl_MVVM(router: router)
        
        view.rootView = LoginView()
        view.viewModel = viewModel
    }
}
