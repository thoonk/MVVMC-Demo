//
//  AppCoordinator.swift
//  MVVMC-Demo
//
//  Created by thoonk on 2023/01/11.
//

import Foundation
import UIKit

class AppCoordinator: BaseCoordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        if let isLogined = Defaults.shared.getIsLogined() {
            if isLogined == true {
                mainFlow()
            } else {
                loginFlow()
            }
        } else {
            loginFlow()
        }
    }
    
    func loginFlow() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        loginCoordinator.delegate = self
        store(coordinator: loginCoordinator)
        loginCoordinator.start()
    }
    
    func mainFlow() {
        let mainCoordinator = MainCoordinator(navigationController: navigationController)
        mainCoordinator.delegate = self
        store(coordinator: mainCoordinator)
        mainCoordinator.start()
    }
}

extension AppCoordinator: LoginCoordinatorDelegate {
    func didFinishLogin(coordinator: Coordinator) {
        free(coordinator: coordinator)
        mainFlow()
    }
}

extension AppCoordinator: MainCoordinatorDelegate {
    func didFinishMain(coordinator: Coordinator) {
        free(coordinator: coordinator)
        loginFlow()
    }
}

