//
//  CardDetailView.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 03/07/24.
//

import UIKit

class CardDetailView: UIViewController, ViewCode {
    
    // TODO: add property wrapper for lazy var translatesAutoresizingMaskIntoConstraints
    lazy var displayLabel: UILabel = {
        let v = UILabel(frame: .zero)
        
        v.font = UIFont.systemFont(ofSize: 64)
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
    
    lazy var frontCardView: UIView = {
        let v = UIView(frame: .zero)
        
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
    
    lazy var backCardView: UIView = {
        let v = UIImageView(image: UIImage.back1)
        v.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapCard))
        tapGestureRecognizer.numberOfTouchesRequired = 1
        
        v.addGestureRecognizer(tapGestureRecognizer)
        
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
    
    lazy var backCardTipLabel: UILabel = {
        let v = UILabel(frame: .zero)
        v.text = "Tap to show card"
        // TODO: make accessible
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
    
    @objc func didTapCard() {
        UIView.animate(withDuration: 0.3) {
            self.backCardView.alpha = 0
            self.frontCardView.alpha = 1
        }
    }
    
    func setupHierarchy() {
        frontCardView.addSubview(displayLabel)
        view.addSubview(backCardView)
        backCardView.addSubview(backCardTipLabel)
        view.addSubview(frontCardView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            displayLabel.centerXAnchor.constraint(equalTo: frontCardView.centerXAnchor),
            displayLabel.centerYAnchor.constraint(equalTo: frontCardView.centerYAnchor),
            
            backCardView.heightAnchor.constraint(equalTo: view.heightAnchor),
            backCardView.widthAnchor.constraint(equalTo: view.widthAnchor),
            backCardTipLabel.centerXAnchor.constraint(equalTo: backCardView.centerXAnchor),
            backCardTipLabel.centerYAnchor.constraint(equalTo: backCardView.bottomAnchor, constant: -48),
            
            frontCardView.heightAnchor.constraint(equalTo: view.heightAnchor),
            frontCardView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.backgroundColor = .white
        self.backCardView.alpha = 1
        self.frontCardView.alpha = 0
    }
}
