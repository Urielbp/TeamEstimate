//
//  TShirtCardViewController.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 03/07/24.
//

import UIKit

class TShirtCardViewController: CardListViewController {
    
    weak var coordinator: TShirtGameCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        title = "T-Shirt"
    }
    
    init(cardListViewModel: CardListViewModel, cardListCoordinator: CardListCoordinator, coordinator: TShirtGameCoordinator) {
        self.coordinator = coordinator
        super.init(viewModel: cardListViewModel, cardListcoordinator: cardListCoordinator)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        coordinator?.finish()
    }
}
