//
//  CardDetailCoordinator.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 04/07/24.
//

import UIKit

class CardDetailCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    weak var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    var text: String
    
    init(navigationController: UINavigationController,
         parentCoordinator: Coordinator,
         text: String) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
        self.text = text
    }
    
    func start() {
        let vc = CardDetailViewController()
        vc.coordinator = self
        vc.displayLabel.text = text
        navigationController.present(vc, animated: true)
    }
}
