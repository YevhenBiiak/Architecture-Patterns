//
//  MainView_MVVM.swift
//  Architecture Patterns
//
//  Created by Yevhen Biiak on 11.01.2023.
//

import UIKit

class MainViewController_MVVM: UIViewController {
    
    var rootView: MainView!
    var assembler: MainAssembler_MVVM!
    var viewModel: MainViewModel_MVVM!
    
    // MARK: Life Cycle and overridden methods
    
    override func loadView() {
        assembler.assembly(self)
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        viewModel.username.bind { [weak self] username in
            self?.rootView.usernameLabel.text = username
        }
    }
    
    @objc private func logoutButtonTapped() {
        viewModel.logout()
    }
}
