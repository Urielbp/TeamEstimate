//
//  TShirtGameCoordinator.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 04/07/24.
//

import UIKit

class TShirtGameCoordinator: Coordinator {
    
    // MARK: - Internal Properties
    
    var childCoordinators = [Coordinator]()
    weak var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    
    // MARK: - Initialization
    
    init(navigationController: UINavigationController, parentCoordinator: Coordinator) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }
    
    // MARK: - Coordinator lifecycle
    
    func start() {
        let vm = TShirtCardsViewModel()
        let vc = TShirtCardViewController(cardListViewModel: vm, cardListCoordinator: self, coordinator: self)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}

// MARK: - CardListCoordinator

extension TShirtGameCoordinator: CardListCoordinator {
    func startCardDetail(text: String) {
        let coordinator = CardDetailCoordinator(navigationController: navigationController, parentCoordinator: self, text: text)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}

