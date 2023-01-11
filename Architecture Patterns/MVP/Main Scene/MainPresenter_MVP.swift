//
//  MainPresenter_MVP.swift
//  Architecture Patterns
//
//  Created by Yevhen Biiak on 11.01.2023.
//

protocol MainPresenter_MVP {
    func viewDidLoad()
    func logout()
}

protocol MainView_MVP: AnyObject {
    func display(username: String)
}

protocol MainRouter_MVP {
    func dismiss()
}

class MainPresenterImpl_MVP: MainPresenter_MVP {
    
    private weak var view: MainView_MVP?
    private var router: MainRouter_MVP
    private var user: User
    
    init(view: MainView_MVP?, router: MainRouter_MVP, user: User) {
        self.view = view
        self.router = router
        self.user = user
    }
    
    func viewDidLoad() {
        view?.display(username: user.username)
    }
    
    func logout() {
        router.dismiss()
    }
}
