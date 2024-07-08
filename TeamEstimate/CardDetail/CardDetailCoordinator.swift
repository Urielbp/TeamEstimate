//
//  CardDetailCoordinator.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 04/07/24.
//

import UIKit

class CardDetailCoordinator: Coordinator {
    
    // MARK: - Internal Properties
    
    var childCoordinators = [Coordinator]()
    weak var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    
    // MARK: - Private Properties
    
    private var text: String
    
    // MARK: - Initializer
    
    init(navigationController: UINavigationController,
         parentCoordinator: Coordinator,
         text: String) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
        self.text = text
    }
    
    // MARK: - Coordinator
    
    func start() {
        let vc = CardDetailViewController(coordinator: self)
        vc.displayLabel.text = text
        navigationController.present(vc, animated: true)
    }
}
