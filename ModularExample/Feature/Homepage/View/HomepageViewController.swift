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

    private let viewModel: HomepageViewModel
    private var githubSearchModel: GithubSearchModel? {
        didSet {
            tableView.reloadData()
        }
    }

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
        viewModel.search()
    }

    private func setupView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func setupBinded() {
        viewModel.onSearchLoaded = { [weak self] result in
            self?.githubSearchModel = result
        }
    }
}

extension HomepageViewController: UITableViewDelegate {

}

extension HomepageViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        let count = githubSearchModel?.total ?? 0
        return count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard
            let item = githubSearchModel?.items[safe: indexPath.row],
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
