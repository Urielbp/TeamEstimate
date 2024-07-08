//
//  TShirtCardsViewModel.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 03/07/24.
//

import Foundation

class TShirtCardsViewModel: CardListViewModel {
    lazy var cards: [String] = {
        [
            String(localized: "XS"),
            String(localized: "S"),
            String(localized: "M"),
            String(localized: "L"),
            String(localized: "XL")
        ]
    }()
}
