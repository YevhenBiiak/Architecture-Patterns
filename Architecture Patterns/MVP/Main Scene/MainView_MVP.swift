//
//  MainView_MVP.swift
//  Architecture Patterns
//
//  Created by Yevhen Biiak on 11.01.2023.
//

import UIKit

class MainViewController_MVP: UIViewController, MainView_MVP {
    
    var rootView: MainView!
    var presenter: MainPresenter_MVP!
    var configurator: MainConfigurator_MVP!
    
    // MARK: Life Cycle and overridden methods
    
    override func loadView() {
        configurator.configure(view: self)
        view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        presenter.viewDidLoad()
    }
    
    // MARK: MainView_MVP
    
    func display(username: String) {
        rootView.usernameLabel.text = username
    }
    
    @objc private func logoutButtonTapped() {
        presenter.logout()
    }
}
