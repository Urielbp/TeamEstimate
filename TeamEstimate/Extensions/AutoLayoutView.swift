//
//  AutoLayoutView.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 08/07/24.
//

import UIKit

@propertyWrapper
struct AutoLayoutView<T: UIView> {
    var wrappedValue: T {
        didSet {
            wrappedValue.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
        wrappedValue.translatesAutoresizingMaskIntoConstraints = false
    }
}
