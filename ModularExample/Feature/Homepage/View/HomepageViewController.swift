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

    private let githubSearchService = GithubSearchService()
    private var githubSearchModel: GithubSearchModel? {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        loadData()
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

    private func loadData() {
        githubSearchService.search(keyword: "swift") { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let success):
                self.githubSearchModel = success
            case .failure:
                self.githubSearchModel = nil
            }
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
