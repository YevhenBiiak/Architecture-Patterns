//
//  MainViewModel_MVVM.swift
//  Architecture Patterns
//
//  Created by Yevhen Biiak on 11.01.2023.
//

protocol MainViewModel_MVVM {
    var username: Binding<String> { get }
    func logout()
}

protocol MainRouter_MVVM {
    func dismiss()
}

class MainViewModelImpl_MVVM: MainViewModel_MVVM {
    
    var username: Binding<String>
    
    private let router: MainRouterImpl_MVVM
    private var user: User {
        didSet { username.value = user.username }
    }
    
    init(router: MainRouterImpl_MVVM, user: User) {
        self.router = router
        self.user = user
        self.username = Binding(user.username)
    }
    
    func logout() {
        router.dismiss()
    }
}
