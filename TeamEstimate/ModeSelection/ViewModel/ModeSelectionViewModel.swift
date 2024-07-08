//
//  ModeSelectionViewModel.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 08/07/24.
//

import Foundation

class ModeSelectionViewModel {
    
    // MARK: - Enums
    
    enum Mode: Int, CaseIterable {
        case tShirt
        case fibonacci
        
        var description: String {
            switch self {
            case .tShirt:
                return "T-Shirt"
            case .fibonacci:
                return "Fibonacci"
            }
        }
    }
    
    // MARK: - Internal Properties
    
    lazy var modes: [String] = {
        Mode.allCases.map { $0.description }
    }()
}
