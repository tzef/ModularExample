//
//  ViewController.swift
//  ModularExample
//

import UIKit

final class RepositoryListViewController: UIViewController {
    private lazy var githubSearchController: GithubSearchController = {
        let githubSearchController = GithubSearchController(navigationItem: navigationItem)
        return githubSearchController
    }()

    private lazy var refreshController: RefreshController = {
        let refreshController = RefreshController(tableView: tableView)
        refreshController.onRefresh = { [weak self] in
            guard let self = self else {
                return
            }
            self.viewModel.search(keyword: self.githubSearchController.keyword)
        }
        return refreshController
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
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
        return tableView
    }()

    private let viewModel: RepositoryListViewModel

    init(viewModel: RepositoryListViewModel) {
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

    private func setupBinded() {
        githubSearchController.onKeywordSearched = { [weak self] keyword in
            self?.viewModel.search(keyword: keyword)
        }
        viewModel.onSearchLoaded = { [weak self] result in
            self?.tableView.reloadData()
        }
        viewModel.onStatusChangedObservers.append(contentsOf: [
            githubSearchController.searchStatusChanged(_:),
            refreshController.searchStatusChanged(_:)
        ])
    }
}

extension RepositoryListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let _ = viewModel.cellViewModelAt(indexPath.row) else {
            assertionFailure(
                "ViewModel for index \(indexPath.row) shouldn't be empty"
            )
            return
        }
        let vc = RepositoryDetailsViewController(viewModel: RepositoryDetailsViewModel())
        show(vc, sender: nil)
    }
}

extension RepositoryListViewController: UITableViewDataSource {
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
                    "Should be able to create `SearchListCell`"
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
                    "Should be able to create `LoadingCell`"
                )
                return UITableViewCell()
            }
            cell.configure()
            viewModel.onStatusChangedObservers.append(
                cell.searchStatusChanged(_:)
            )
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
