//
//  ModeSelectionView.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 03/07/24.
//

import UIKit

class ModeSelectionView: UIViewController, ViewCode {
    enum Modes: Int, CaseIterable {
        case tShirt
        case fibonacci
        
        var description: String {
            switch self {
            case .tShirt:
                "T-Shirt"
            case .fibonacci:
                "Fibonacci"
            }
        }
    }
    
    lazy var modes: [String] = {
        return Modes.allCases.map { $0.description }
    }()
    
    // TODO: add property wrapper for lazy var translatesAutoresizingMaskIntoConstraints
    lazy var modesList: UIView = {
        let v = UITableView(frame: .zero)
        
        v.register(ModeSelectionRow.self, forCellReuseIdentifier: ModeSelectionRow.reuseIdentifier)
        v.dataSource = self
        v.delegate = self
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
    
    func setupHierarchy() {
        view.addSubview(modesList)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            modesList.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            modesList.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            modesList.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            modesList.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        title = "Mode Selection"
    }
}

extension ModeSelectionView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ModeSelectionRow.reuseIdentifier) as? ModeSelectionRow else { return UITableViewCell() }
        cell.text.text = modes[indexPath.row]
        return cell
    }
}

extension ModeSelectionView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case Modes.tShirt.rawValue:
            let vc = TShirtCardView(viewModel: TShirtCardsViewModel())
            navigationController?.pushViewController(vc, animated: true)
        case Modes.fibonacci.rawValue:
            let vc = FibonacciCardsView(viewModel: FibonacciCardsViewModel())
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}
