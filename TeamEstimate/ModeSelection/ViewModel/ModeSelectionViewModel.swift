//
//  ModeSelectionViewModel.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 08/07/24.
//

import Foundation

class ModeSelectionViewModel {
    
    enum Mode: Int, CaseIterable {
        case tShirt
        case fibonacci
        
        var description: String {
            switch self {
            case .tShirt:
                "T-Shirt"
            case .fibonacci:
                "Fibonacci"
            }
        }
    }
    
    lazy var modes: [String] = {
        return Mode.allCases.map { $0.description }
    }()
}
