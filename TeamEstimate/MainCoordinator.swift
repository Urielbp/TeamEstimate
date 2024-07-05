//
//  MainCoordinator.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 04/07/24.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    weak var parentCoordinator: Coordinator?
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ModeSelectionViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
}

extension MainCoordinator {
    func startFibonacci() {
        let coordinator = FibonacciGameCoordinator(navigationController: navigationController, parentCoordinator: self)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
    func startTShirt() {
        let coordinator = TShirtGameCoordinator(navigationController: navigationController, parentCoordinator: self)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}
