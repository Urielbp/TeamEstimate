//
//  CardListViewController.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 03/07/24.
//

import UIKit

class CardListViewController: UIViewController, ViewCode {
    
    var viewModel: CardListViewModel
    weak var cardListcoordinator: CardListCoordinator?
    
    // TODO: add property wrapper for lazy var translatesAutoresizingMaskIntoConstraints
    lazy var cardList: UITableView = {
        let v = UITableView(frame: .zero)
        
        v.register(CellRow.self, forCellReuseIdentifier: CellRow.reuseIdentifier)
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

extension CardListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellRow.reuseIdentifier) as? CellRow else { return UITableViewCell() }
        cell.text.text = viewModel.cards[indexPath.row]
        return cell
    }
}

extension CardListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cardListcoordinator?.startCardDetail(text: viewModel.cards[indexPath.row])
    }
}
