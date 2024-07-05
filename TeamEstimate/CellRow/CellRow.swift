//
//  CellRow.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 03/07/24.
//

import UIKit

class CellRow: UITableViewCell, ReuseIdentifier, ViewCode {
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
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var text: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
}
