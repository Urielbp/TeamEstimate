//
//  FibonacciGameCoordinator.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 04/07/24.
//

import UIKit

class FibonacciGameCoordinator: Coordinator {
        
    // MARK: - Internal Properties
    
    weak var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    
    // MARK: - Initialization
    
    init(navigationController: UINavigationController, parentCoordinator: Coordinator) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }
    
    // MARK: - Coordinator lifecycle
    
    func start() {
        let vm = FibonacciCardsViewModel()
        let vc = FibonacciCardsViewController(cardListViewModel: vm, cardListCoordinator: self, coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
}

// MARK: - CardListCoordinator

extension FibonacciGameCoordinator: CardListCoordinator {
    func startCardDetail(text: String) {
        let coordinator = CardDetailCoordinator(navigationController: navigationController, parentCoordinator: self, text: text)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}
