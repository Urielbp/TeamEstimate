//
//  FibonacciCardsView.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 03/07/24.
//

import UIKit

class FibonacciCardsView: CardList {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        cardList.delegate = self
        title = "Fibonacci"
    }
}
