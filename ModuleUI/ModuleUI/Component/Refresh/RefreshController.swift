//
//  RefreshController.swift
//  ModuleUI
//

import UIKit
import ModuleDesignSystem

final class RefreshController: TableViewRefreshController {
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()

    override init(tableView: UITableView) {
        super.init(tableView: tableView)
        tableView.refreshControl = refreshControl
    }

    @objc func refresh() {
        onRefresh?()
    }

    override func isRefreshingChanged(_ isRefreshing: Bool) {
        if isRefreshing {
            refreshControl.beginRefreshing()
        } else {
            refreshControl.endRefreshing()
        }
    }
}
