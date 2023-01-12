//
//  LoginCoordinator.swift
//  MVVMC-Demo
//
//  Created by thoonk on 2023/01/12.
//

import UIKit

protocol LoginCoordinatorDelegate: AnyObject {
    func didFinishLogin(coordinator: Coordinator)
}

final class LoginCoordinator: BaseCoordinator {
    lazy var loginController: LoginViewController = {
        let controller = LoginViewController()
        let viewModel = LoginViewModel()
//        viewModel.delegate = self
        controller.viewModel = viewModel
        
        return controller
    }()
    
    weak var delegate: LoginCoordinatorDelegate?
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        navigationController.setViewControllers([loginController], animated: true)
    }
}
