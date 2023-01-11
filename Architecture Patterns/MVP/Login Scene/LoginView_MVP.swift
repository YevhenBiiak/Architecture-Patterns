//
//  LoginView_MVP.swift
//  Architecture Patterns
//
//  Created by Yevhen Biiak on 11.01.2023.
//

import UIKit

class LoginViewController_MVP: UIViewController, LoginView_MVP {
    
    var rootView: LoginView!
    var presenter: LoginPresenter_MVP!
    var configurator: LoginConfigurator_MVP!
    
    // MARK: Life Cycle and overridden methods

    override func loadView() {
        configurator.configure(view: self)
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        rootView.usernameTextField.text = ""
        rootView.passwordTextField.text = ""
        rootView.loginStatusLabel.text = ""
    }
    
    // MARK: LoginView_MVP
    
    func display(loginStatus: String) {
        rootView.loginStatusLabel.text = loginStatus
    }
    
    // MARK: Actions

    @objc private func loginButtonTapped(_ sender: UIButton) {
        let username = rootView.usernameTextField.text ?? ""
        let password = rootView.passwordTextField.text ?? ""
        
        presenter.login(username: username, password: password)
    }
}
