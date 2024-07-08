//
//  FibonacciCardsViewModel.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 03/07/24.
//

import Foundation

class FibonacciCardsViewModel: CardListViewModel {
    private let numberOfCards = 10
    
    private func calculateFibonacci(n: Int) -> Int {
        guard n != 0 else { return  0 }
        guard n != 1 else { return  1 }
        return calculateFibonacci(n: n - 1) + calculateFibonacci(n: n - 2)
    }
    
    lazy var cards: [String] = {
        var sequence = (0...numberOfCards).map { calculateFibonacci(n: $0) }
        sequence.remove(at: 1)

        return sequence.map { "\($0)" }
    }()
}
