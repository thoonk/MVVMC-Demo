//
//  Coordinator.swift
//  MVVMC-Demo
//
//  Created by thoonk on 2023/01/11.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinator: [Coordinator] { get set }
    func start()
}

extension Coordinator {
    func store(coordinator: Coordinator) {
        childCoordinator.append(coordinator)
    }
    
    func free(coordinator: Coordinator) {
        childCoordinator = childCoordinator.filter { $0 !== coordinator }
    }
}
