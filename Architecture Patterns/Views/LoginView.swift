//
//  LoginView.swift
//  Architecture Patterns
//
//  Created by Yevhen Biiak on 11.01.2023.
//

import UIKit

class LoginView: UIView {
    
    let loginStatusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.text = "LOGIN"
        return label
    }()
    
    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.placeholder = "Username"
        
        textField.backgroundColor = .tertiarySystemBackground
        textField.layer.cornerRadius = 8
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        
        textField.backgroundColor = .tertiarySystemBackground
        textField.layer.cornerRadius = 8
        return textField
    }()
    
    let loginButton: UIButton = {
        var config: UIButton.Configuration = .filled()
        config.baseBackgroundColor = UIColor(rgb: 0x6AC1C1)
        config.baseForegroundColor = .white
        config.buttonSize = .large
        config.cornerStyle = .medium
        config.title = "Login"
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 30
        stack.distribution = .fillEqually
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubviews()
        
        let gradientLayer = self.layer as! CAGradientLayer
        gradientLayer.colors = [UIColor(rgb: 0xE2729B).cgColor, UIColor(rgb: 0x4057DE).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class var layerClass: AnyClass {
        CAGradientLayer.self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        endEditing(true)
    }
    
    private func addSubviews() {
        addSubview(loginStatusLabel)
        addSubview(titleLabel)
        addSubview(stackView)
        
        [usernameTextField, passwordTextField, loginButton].forEach { stackView.addArrangedSubview($0) }
        
        loginStatusLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        loginStatusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        loginStatusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        loginStatusLabel.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: loginStatusLabel.bottomAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 32).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -32).isActive = true
        
        stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 200).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    }
}
