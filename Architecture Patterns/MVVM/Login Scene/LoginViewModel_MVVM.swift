//
//  LoginViewModel_MVVM.swift
//  Architecture Patterns
//
//  Created by Yevhen Biiak on 11.01.2023.
//

protocol LoginViewModel_MVVM {
    var loginStatus: Binding<String> { get }
    func login(username: String, password: String)
}

protocol LoginRouter_MVVM {
    func presentMainScene(with user: User)
}

class LoginViewModelImpl_MVVM: LoginViewModel_MVVM {
    
    var loginStatus: Binding<String>
    
    private var db: DataBase
    private var router: LoginRouter_MVVM
    
    init(router: LoginRouter_MVVM, db: DataBase = DataBase()) {
        self.db = db
        self.router = router
        self.loginStatus = Binding("")
    }
    
    func login(username: String, password: String) {
        guard !username.isEmpty, !password.isEmpty else {
            loginStatus.value = "The Name and Password fields cannot be empty"
            return
        }
        
        if db.users.contains(where: { $0.username == username && $0.password == password }) {
            
            let user = User(username: username, password: password)
            router.presentMainScene(with: user)
        } else {
            
            loginStatus.value = "For logging use: \nusername: \(db.users.first!.username) \npassword: \(db.users.first!.password)"
        }
    }
}
