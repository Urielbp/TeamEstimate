//
//  ViewCode.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 03/07/24.
//

import Foundation

protocol ViewCode {
    func setupHierarchy()
    func setupConstraints()
}

extension ViewCode {
    func setup() {
        setupHierarchy()
        setupConstraints()
    }
}