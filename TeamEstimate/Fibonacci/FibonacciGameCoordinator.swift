//
//  FibonacciGameCoordinator.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 04/07/24.
//

import UIKit

class FibonacciGameCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    weak var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, parentCoordinator: Coordinator) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }
    
    func start() {
        let vc = FibonacciCardsViewController(viewModel: FibonacciCardsViewModel())
        vc.cardListcoordinator = self
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}

extension FibonacciGameCoordinator: CardListCoordinator {
    func startCardDetail(text: String) {
        let coordinator = CardDetailCoordinator(navigationController: navigationController, parentCoordinator: self, text: text)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}
