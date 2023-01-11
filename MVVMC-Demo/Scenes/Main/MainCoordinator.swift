//
//  MainCoordinator.swift
//  MVVMC-Demo
//
//  Created by thoonk on 2023/01/11.
//

import UIKit

protocol MainCoordinatorDelegate: AnyObject {
    func didFinishMain(coordinator: Coordinator)
}

final class MainCoordinator: BaseCoordinator {
    lazy var mainController: MainViewController = {
        let controller = MainViewController()
        let viewModel = MainViewModel()
//        viewModel.delegate = self
//        controller.viewModel = viewModel
        
        return controller
    }()
    
    weak var delegate: MainCoordinatorDelegate?
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        navigationController.setViewControllers([mainController], animated: true)
    }
}
