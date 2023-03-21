//
//  MainView.swift
//  Architecture Patterns
//
//  Created by Yevhen Biiak on 11.01.2023.
//

import UIKit

class MainView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.text = "WELCOME BACK"
        return label
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let logoutButton: UIButton = {
        var config: UIButton.Configuration = .filled()
        config.baseBackgroundColor = .red
        config.baseForegroundColor = .white
        config.buttonSize = .large
        config.cornerStyle = .medium
        config.title = "Log Out"
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .systemGroupedBackground
        addSubviews()
        
        let gradientLayer = self.layer as! CAGradientLayer
        gradientLayer.colors = [UIColor(rgb: 0xCAF2EF).cgColor, UIColor(rgb: 0xF2BBF1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class var layerClass: AnyClass {
        CAGradientLayer.self
    }
    
    private func addSubviews() {
        self.addSubview(titleLabel)
        self.addSubview(usernameLabel)
        self.addSubview(logoutButton)
        
        
        titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        logoutButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        logoutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        logoutButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -80).isActive = true
        
        usernameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        usernameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
