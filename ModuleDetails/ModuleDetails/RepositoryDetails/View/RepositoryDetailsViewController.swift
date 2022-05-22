//
//  RepositoryDetailsViewController.swift
//  ModuleDetails
//

import UIKit

final class RepositoryDetailsViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.register(
            LabelValueCell.self,
            forCellReuseIdentifier: LabelValueCell.reuseIdentifier
        )
        tableView.dataSource = self
        return tableView
    }()

    private let viewModel: RepositoryDetailsViewModel

    init(viewModel: RepositoryDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        title = viewModel.title
        view.backgroundColor = UIColor.systemBackground
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension RepositoryDetailsViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        viewModel.numberOfRows
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard
            let viewModel = viewModel.cellViewModelAt(indexPath.row),
            let cell = tableView.dequeueReusableCell(
                withIdentifier: LabelValueCell.reuseIdentifier,
                for: indexPath
            ) as? LabelValueCell
        else {
            assertionFailure(
                "Should be able to create `LabelValueCell`"
            )
            return UITableViewCell()
        }

        cell.configure(with: viewModel)
        return cell
    }
}
