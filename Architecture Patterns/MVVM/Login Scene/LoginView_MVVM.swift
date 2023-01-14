//
//  LoginView_MVVM.swift
//  Architecture Patterns
//
//  Created by Yevhen Biiak on 11.01.2023.
//

import UIKit

class LoginViewController_MVVM: UIViewController {
    
    var rootView: LoginView!
    var assembler: LoginAssembler_MVVM!
    var viewModel: LoginViewModel_MVVM!
    
    // MARK: Life Cycle and overridden methods
    
    override func loadView() {
        assembler.assembly(self)
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        rootView.usernameTextField.delegate = self
        rootView.passwordTextField.delegate = self
        
        rootView.usernameTextField.returnKeyType  = .next
        rootView.passwordTextField.returnKeyType  = .done
        
        viewModel.loginStatus.bind { [weak self] status in
            self?.rootView.loginStatusLabel.text = status
        }
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
        
        viewModel.login(username: username, password: password)
    }
}

// MARK: - UITextFieldDelegate

extension LoginViewController_MVVM: UITextFieldDelegate {
    
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
