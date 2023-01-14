//
//  LoginViewController_MVC.swift
//  Architecture Patterns
//
//  Created by Yevhen Biiak on 11.01.2023.
//

import UIKit

class LoginViewController_MVC: UIViewController {
    
    private var db: DataBase!
    private var rootView: LoginView!
    
    // MARK: Life Cycle and overridden methods

    override func loadView() {
        db = DataBase()
        rootView = LoginView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        rootView.usernameTextField.delegate = self
        rootView.passwordTextField.delegate = self
        
        rootView.usernameTextField.returnKeyType  = .next
        rootView.passwordTextField.returnKeyType  = .done
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        rootView.usernameTextField.text = ""
        rootView.passwordTextField.text = ""
        rootView.loginStatusLabel.text = ""
    }
    
    // MARK: Actions

    @objc private func loginButtonTapped(_ sender: UIButton) {
        let username = rootView.usernameTextField.text ?? ""
        let password = rootView.passwordTextField.text ?? ""
        
        guard !username.isEmpty, !password.isEmpty else {
            let status = "The Name and Password fields cannot be empty"
            rootView.loginStatusLabel.text = status
            return
        }
        
        if db.users.contains(where: { $0.username == username && $0.password == password }) {
            
            let user = User(username: username, password: password)
            presentMainScene(with: user)
            
        } else {
            
            let status = "For logging use: \nusername: \(db.users.first!.username) \npassword: \(db.users.first!.password)"
            rootView.loginStatusLabel.text = status
        }
    }
    
    private func presentMainScene(with user: User) {
        
        let mainViewController = MainViewController_MVC()
        mainViewController.user = user
        mainViewController.modalPresentationStyle = .fullScreen
        
        present(mainViewController, animated: true)
    }
}

// MARK: - UITextFieldDelegate

extension LoginViewController_MVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case rootView.usernameTextField:
            rootView.passwordTextField.becomeFirstResponder()
        case rootView.passwordTextField:
            rootView.passwordTextField.resignFirstResponder()
            rootView.loginButton.sendActions(for: .touchUpInside)
        default:
            break
        }
        
        return true
    }
}
