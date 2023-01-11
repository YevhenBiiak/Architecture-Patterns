//
//  MainViewController_MVC.swift
//  Architecture Patterns
//
//  Created by Yevhen Biiak on 11.01.2023.
//

import UIKit

class MainViewController_MVC: UIViewController {
    
    var user: User!
    
    private var rootView: MainView!
    
    // MARK: Life Cycle and overridden methods
    
    override func loadView() {
        rootView = MainView()
        view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        rootView.usernameLabel.text = user.username
        rootView.logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
    }
    
    @objc private func logoutButtonTapped() {
        dismiss(animated: true)
    }
}
