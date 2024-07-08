//
//  ViewCode.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 03/07/24.
//

import UIKit

protocol ViewCode {
    func setupHierarchy()
    func setupConstraints()
    func setupView()
    func setupDelegates()
}

extension ViewCode {
    func setup() {
        setupHierarchy()
        setupConstraints()
        setupView()
        setupDelegates()
    }
    
    func setupView() {
        
    }
    
    func setupDelegates() {
        
    }
}
