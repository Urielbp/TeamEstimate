//
//  CardDetailViewController.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 03/07/24.
//
import UIKit

class CardDetailViewController: UIViewController, ViewCode {
    
    // MARK: - Private properties
    
    private weak var coordinator: CardDetailCoordinator?
    
    private lazy var closeModalButton: UIButton = {
        let v = UIButton(type: .close)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.addTarget(self, action: #selector(close), for: .touchUpInside)
        
        return v
    }()
    
    private lazy var frontCardView: UIView = {
        let v = UIView(frame: .zero)
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
    
    private lazy var backCardView: UIView = {
        let v = UIView(frame: .zero)
        v.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapCard))
        tapGestureRecognizer.numberOfTouchesRequired = 1
        v.addGestureRecognizer(tapGestureRecognizer)
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
    
    @AutoLayoutView
    private var backCardTipLabel: UILabel = {
        let v = UILabel(frame: .zero)
        v.text = String(localized: "Tap to show card")
        
        return v
    }()
    
    // MARK: - Internal properties
    
    @AutoLayoutView
    var displayLabel: UILabel = {
        let v = UILabel(frame: .zero)
        v.font = UIFont.systemFont(ofSize: 64)
        
        return v
    }()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Initializers
    
    init(coordinator: CardDetailCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        coordinator?.finish()
    }
    
    // MARK: - Setup Methods
    
    // Internal
    func setupHierarchy() {
        frontCardView.addSubview(displayLabel)
        view.addSubview(backCardView)
        backCardView.addSubview(backCardTipLabel)
        view.addSubview(frontCardView)
        view.addSubview(closeModalButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            closeModalButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            closeModalButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            
            displayLabel.centerXAnchor.constraint(equalTo: frontCardView.centerXAnchor),
            displayLabel.centerYAnchor.constraint(equalTo: frontCardView.centerYAnchor),
            
            backCardView.topAnchor.constraint(equalTo: view.topAnchor),
            backCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backCardView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            backCardTipLabel.centerXAnchor.constraint(equalTo: backCardView.centerXAnchor),
            backCardTipLabel.centerYAnchor.constraint(equalTo: backCardView.centerYAnchor),
            
            frontCardView.topAnchor.constraint(equalTo: view.topAnchor),
            frontCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            frontCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            frontCardView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func setupView() {
        view.backgroundColor = UIColor.background
        backCardTipLabel.textColor = UIColor.text
        displayLabel.textColor = UIColor.text
        
        backCardView.alpha = 1
        frontCardView.alpha = 0
    }
    
    // MARK: - Action Methods
    
    @objc private func close() {
        dismiss(animated: true)
    }
    
    @objc private func didTapCard() {
        UIView.animate(withDuration: 0.3) {
            self.backCardView.alpha = 0
            self.frontCardView.alpha = 1
        }
    }
}
