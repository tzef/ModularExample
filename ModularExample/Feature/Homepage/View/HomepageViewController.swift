//
//  ViewController.swift
//  ModularExample
//

import UIKit

final class HomepageViewController: UIViewController {
    private lazy var githubSearchController: GithubSearchController = {
        let githubSearchController = GithubSearchController(navigationItem: navigationItem)
        return githubSearchController
    }()

    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(didRefresh), for: .valueChanged)
        return refreshControl
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            SearchListCell.self,
            forCellReuseIdentifier: SearchListCell.reuseIdentifier
        )
        tableView.register(
            LoadingCell.self,
            forCellReuseIdentifier: LoadingCell.reuseIdentifier
        )
        tableView.delegate = self
        tableView.dataSource = self
        tableView.refreshControl = refreshControl
        return tableView
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
        githubSearchController.defaultSearch()
    }

    private func setupView() {
        title = "GitHub Repository Search"
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

    private func setupBinded() {
        githubSearchController.onKeywordSearched = { [weak self] keyword in
            self?.viewModel.search(keyword: keyword)
        }
        viewModel.onSearchLoaded = { [weak self] result in
            self?.tableView.reloadData()
        }
        viewModel.onStatusChanged = { [weak self] status in
            self?.githubSearchController.searchStatus = status
            switch status {
            case .wait:
                break
            case .searching:
                self?.refreshControl.beginRefreshing()
            case .done, .fail:
                self?.refreshControl.endRefreshing()
            }
        }
    }

    @objc private func didRefresh() {
        viewModel.search(keyword: githubSearchController.keyword)
    }
}

extension HomepageViewController: UITableViewDelegate {

}

extension HomepageViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        viewModel.numberOfRows + (viewModel.hasNextPage ? 1 : 0)
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        switch indexPath.row {
        case 0..<viewModel.numberOfRows:
            guard
                let viewModel = viewModel.cellViewModelAt(indexPath.row),
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: SearchListCell.reuseIdentifier,
                    for: indexPath
                ) as? SearchListCell
            else {
                assertionFailure(
                    "Should able to create `SearchListCell`"
                )
                return UITableViewCell()
            }

            cell.configure(with: viewModel)
            return cell
        case viewModel.numberOfRows:
            guard
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: LoadingCell.reuseIdentifier,
                    for: indexPath
                ) as? LoadingCell
            else {
                assertionFailure(
                    "Should able to create `LoadingCell`"
                )
                return UITableViewCell()
            }
            cell.configure()
            viewModel.loadNextPage()
            return cell
        default:
            assertionFailure(
                "index \(indexPath.row) should between 0 to \(viewModel.numberOfRows)"
            )
            return UITableViewCell()
        }
    }
}
