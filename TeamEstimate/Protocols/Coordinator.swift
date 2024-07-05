//
//  Coordinator.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 04/07/24.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var parentCoordinator: Coordinator? { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
    func finish()
    func childDidFinish(_ child: Coordinator)
}

extension Coordinator {
    func finish() {
        childCoordinators.removeAll()
        parentCoordinator?.childDidFinish(self)
    }
    
    func childDidFinish(_ child: Coordinator) {
        guard let index = childCoordinators.firstIndex(where: { $0 === child }) else { return }
        childCoordinators.remove(at: index)
    }
}
