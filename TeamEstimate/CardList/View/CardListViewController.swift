//
//  CardListViewController.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 03/07/24.
//
import UIKit

class CardListViewController: UIViewController, ViewCode {
    
    // MARK: - Private Properties
    
    private var viewModel: CardListViewModel
    @AutoLayoutView private var cardList: UITableView = {
        let v = UITableView(frame: .zero)
        v.register(CellRow.self, forCellReuseIdentifier: CellRow.reuseIdentifier)
        return v
    }()
    
    private weak var cardListcoordinator: CardListCoordinator?
    
    // MARK: - Initialization
    
    init(viewModel: CardListViewModel, cardListcoordinator: CardListCoordinator) {
        self.viewModel = viewModel
        self.cardListcoordinator = cardListcoordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Setup
    
    func setupHierarchy() {
        view.addSubview(cardList)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            cardList.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cardList.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cardList.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cardList.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupDelegates() {
        cardList.dataSource = self
        cardList.delegate = self
    }
    
    func setupView() {
        view.backgroundColor = .background
        cardList.backgroundColor = .background
        setLargeTitleColor(.text)
        setNavigationBarTintColor(.main)
    }
}

// MARK: - UITableViewDataSource

extension CardListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellRow.reuseIdentifier) as? CellRow else { return UITableViewCell() }
        cell.contentLabel.text = viewModel.cards[indexPath.row]
        cell.contentLabel.textColor = UIColor.text
        cell.contentView.backgroundColor = UIColor.background
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension CardListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cardListcoordinator?.startCardDetail(text: viewModel.cards[indexPath.row])
    }
}
