//
//  ViewController.swift
//  ModularExample
//

import UIKit

final class HomepageViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            SearchListCell.self,
            forCellReuseIdentifier: SearchListCell.reuseIdentifier
        )
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.systemGroupedBackground
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("next", for: .normal)
        button.addTarget(self, action: #selector(loadNextPage), for: .touchUpInside)
        button.backgroundColor = UIColor.systemGroupedBackground
        button.setTitleColor(UIColor.label, for: .normal)
        button.setTitleColor(UIColor.tertiaryLabel, for: .disabled)
        return button
    }()

    private let viewModel: HomepageViewModel

    init(viewModel: HomepageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBinded()
        search()
    }

    private func setupView() {
        view.addSubview(statusLabel)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            statusLabel.heightAnchor.constraint(equalToConstant: 44)
        ])

        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: statusLabel.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    private func setupBinded() {
        viewModel.onSearchLoaded = { [weak self] result in
            print("search results count \(result?.total ?? 0)")
            self?.tableView.reloadData()
        }
        viewModel.onStatusChanged = { [weak self] status in
            switch status {
            case .wait:
                self?.statusLabel.text = nil
            case let .searching(keyword):
                self?.statusLabel.text = "Searching \(keyword)"
            case .done:
                self?.statusLabel.text = "DONE"
            case let .fail(message):
                self?.statusLabel.text = "ERROR: \(message)"
            }
            self?.nextButton.isEnabled = status.enableLoadNextPage
        }
    }

    private func search() {
        viewModel.search(keyword: "swift")
    }

    @objc private func loadNextPage() {
        viewModel.loadNextPage()
    }
}

extension HomepageViewController: UITableViewDelegate {

}

extension HomepageViewController: UITableViewDataSource {
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
            let item = viewModel.itemAt(indexPath.row),
            let cell = tableView.dequeueReusableCell(
                withIdentifier: SearchListCell.reuseIdentifier,
                for: indexPath
            ) as? SearchListCell
        else {
            return UITableViewCell()
        }

        cell.configure(with: item)
        return cell
    }
}
