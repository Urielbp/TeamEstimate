//
//  ModeSelectionViewController.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 03/07/24.
//

import UIKit

class ModeSelectionViewController: UIViewController, ViewCode {
    
    weak var coordinator: MainCoordinator?
    
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
        
        v.register(CellRow.self, forCellReuseIdentifier: CellRow.reuseIdentifier)
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

extension ModeSelectionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellRow.reuseIdentifier) as? CellRow else { return UITableViewCell() }
        cell.text.text = modes[indexPath.row]
        return cell
    }
}

extension ModeSelectionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case Modes.tShirt.rawValue:
            coordinator?.startTShirt()
        case Modes.fibonacci.rawValue:
            coordinator?.startFibonacci()
        default:
            break
        }
    }
}
