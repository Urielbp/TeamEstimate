//
//  CardList.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 03/07/24.
//

import UIKit

protocol CardListViewModel {
    var cards: [String] { get }
}

class CardList: UIViewController, ViewCode {
    
    var viewModel: CardListViewModel
    
    // TODO: add property wrapper for lazy var translatesAutoresizingMaskIntoConstraints
    lazy var cardList: UITableView = {
        let v = UITableView(frame: .zero)
        
        v.register(ModeSelectionRow.self, forCellReuseIdentifier: ModeSelectionRow.reuseIdentifier)
        v.dataSource = self
        v.delegate = self
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    init(viewModel: CardListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardList: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ModeSelectionRow.reuseIdentifier) as? ModeSelectionRow else { return UITableViewCell() }
        cell.text.text = viewModel.cards[indexPath.row]
        return cell
    }
}

extension CardList: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CardDetailView()
        vc.displayLabel.text = viewModel.cards[indexPath.row]
        navigationController?.present(vc, animated: true)
    }
}
