//
//  ModeSelectionViewController.swift
//  TeamEstimate
//
//  Created by Uriel Barbosa Pinheiro on 03/07/24.
//

import UIKit

class ModeSelectionViewController: UIViewController, ViewCode {
    
    // MARK: - Private Properties
    
    private weak var coordinator: MainCoordinator?
    private var viewModel: ModeSelectionViewModel
    
    @AutoLayoutView
    private var modesList: UITableView = {
        let v = UITableView(frame: .zero)
        v.register(CellRow.self, forCellReuseIdentifier: CellRow.reuseIdentifier)
        
        return v
    }()
    
    // MARK: - Initialization
    
    init(coordinator: MainCoordinator, viewModel: ModeSelectionViewModel) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupConstraints()
        setupDelegates()
    }
    
    // MARK: - Setup Methods
    
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
    
    func setupDelegates() {
        modesList.dataSource = self
        modesList.delegate = self
    }
    
    func setupView() {
        view.backgroundColor = UIColor.background
        modesList.backgroundColor = UIColor.background
        setLargeTitleColor(UIColor.text)
        title = String(localized: "Game modes")
    }
}

// MARK: - UITableViewDataSource

extension ModeSelectionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.modes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellRow.reuseIdentifier) as? CellRow else { return UITableViewCell() }
        cell.contentLabel.text = viewModel.modes[indexPath.row]
        cell.contentLabel.textColor = UIColor.text
        cell.contentView.backgroundColor = UIColor.background
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ModeSelectionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let gameMode = ModeSelectionViewModel.Mode(rawValue: indexPath.row) else { return }
        
        coordinator?.startGameMode(gameMode)
    }
}

