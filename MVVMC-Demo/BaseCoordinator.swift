//
//  BaseCoordinator.swift
//  MVVMC-Demo
//
//  Created by thoonk on 2023/01/11.
//

import Foundation

class BaseCoordinator: Coordinator {
    var childCoordinator: [Coordinator] = []
    
    func start() {}
}
