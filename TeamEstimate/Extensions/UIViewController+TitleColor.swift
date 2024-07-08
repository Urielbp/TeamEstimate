//
//  UIViewController+TitleColor.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 08/07/24.
//

import UIKit

extension UIViewController {
    func setLargeTitleColor(_ color: UIColor) {
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: color]
    }
    
    func setNavigationBarTintColor(_ color: UIColor) {
        navigationController?.navigationBar.tintColor = color
    }
}
