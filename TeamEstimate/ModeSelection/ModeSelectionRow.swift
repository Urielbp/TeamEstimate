//
//  ModeSelectionRow.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 03/07/24.
//

import UIKit

class ModeSelectionRow: UITableViewCell, ReuseIdentifier, ViewCode {
    func setupHierarchy() {
        contentView.addSubview(text)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            text.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            text.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var text: UILabel = {
        let v = UILabel()
        v.text = "Banana"
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
}
