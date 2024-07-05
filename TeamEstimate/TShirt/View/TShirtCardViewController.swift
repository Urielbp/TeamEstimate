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
}
