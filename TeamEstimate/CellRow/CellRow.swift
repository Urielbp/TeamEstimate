//
//  CellRow.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 03/07/24.
//

import UIKit

class CellRow: UITableViewCell, ReuseIdentifier, ViewCode {
    
    // MARK: - Internal Properties
    
    lazy var contentLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = UIFont.preferredFont(forTextStyle: .body)
        v.adjustsFontForContentSizeCategory = true
        
        return v
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Methods
    
    func setupHierarchy() {
        contentView.addSubview(contentLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            contentLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            contentLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}
