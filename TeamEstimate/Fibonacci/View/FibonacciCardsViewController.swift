//
//  FibonacciCardsViewController.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 03/07/24.
//

import UIKit

class FibonacciCardsViewController: CardListViewController {
    
    weak var coordinator: FibonacciGameCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        title = "Fibonacci"
    }
    
    deinit {
        coordinator?.finish()
    }
}
