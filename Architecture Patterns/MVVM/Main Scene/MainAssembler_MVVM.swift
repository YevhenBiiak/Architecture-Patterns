//
//  MainAssembler_MVVM.swift
//  Architecture Patterns
//
//  Created by Yevhen Biiak on 11.01.2023.
//

protocol MainAssembler_MVVM {
    func assembly(_ view: MainViewController_MVVM)
}

class MainAssemblerImpl_MVVM: MainAssembler_MVVM {
    
    private var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func assembly(_ view: MainViewController_MVVM) {
        
        let router = MainRouterImpl_MVVM(view: view)
        let viewModel = MainViewModelImpl_MVVM(router: router, user: user)
        
        view.rootView = MainView()
        view.viewModel = viewModel
    }
}
