//
//  MainView.swift
//  Architecture Patterns
//
//  Created by Yevhen Biiak on 11.01.2023.
//

import UIKit

class MainView: UIView {
    
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.addSubview(usernameLabel)
        self.addSubview(logoutButton)
        
        logoutButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        logoutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        logoutButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -80).isActive = true
        
        usernameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        usernameLabel.centerYAnchor.constraint(equalTo: self.topAnchor, constant: 300).isActive = true
    }
}
