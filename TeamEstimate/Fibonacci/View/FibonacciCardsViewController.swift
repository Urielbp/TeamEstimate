//
//  FibonacciCardsViewController.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 03/07/24.
//

import UIKit

class FibonacciCardsViewController: CardListViewController {
    
    // MARK: - Private Properties
    
    private weak var coordinator: FibonacciGameCoordinator?
    
    // MARK: - Initialization
    
    init(cardListViewModel: CardListViewModel, cardListCoordinator: CardListCoordinator, coordinator: FibonacciGameCoordinator) {
        self.coordinator = coordinator
        super.init(viewModel: cardListViewModel, cardListcoordinator: cardListCoordinator)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        title = "Fibonacci"
    }
    
    deinit {
        coordinator?.finish()
    }
}
