//
//  LoginPresenter_MVP.swift
//  Architecture Patterns
//
//  Created by Yevhen Biiak on 11.01.2023.
//

protocol LoginPresenter_MVP {
    func viewDidLoad()
    func login(username: String, password: String)
}

protocol LoginView_MVP: AnyObject {
    func display(loginStatus: String)
}

protocol LoginRouter_MVP {
    func presentMainScene(with user: User)
}


class LoginPresenterImpl_MVP: LoginPresenter_MVP {
    
    private weak var view: LoginView_MVP?
    private var router: LoginRouter_MVP
    private var db: DataBase
    
    init(view: LoginView_MVP?, router: LoginRouter_MVP, db: DataBase = DataBase()) {
        self.db = db
        self.view = view
        self.router = router
    }
    
    func viewDidLoad() {
        view?.display(loginStatus: "")
    }
    
    func login(username: String, password: String) {
        guard !username.isEmpty, !password.isEmpty else {
            let status = "The Name and Password fields cannot be empty"
            view?.display(loginStatus: status)
            return
        }
        
        if db.users.contains(where: { $0.username == username && $0.password == password }) {
            
            let user = User(username: username, password: password)
            router.presentMainScene(with: user)
        } else {
            
            let status = "For logging use: \nusername: \(db.users.first!.username) \npassword: \(db.users.first!.password)"
            view?.display(loginStatus: status)
        }
    }
}
