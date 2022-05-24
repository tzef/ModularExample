//
//  RefreshController.swift
//  ModuleUI
//

import UIKit

public enum RefreshControllerStatus {
    case refreshing
    case none
}

public final class RefreshController: NSObject {
    public var onRefresh: (() -> Void)?

    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()

    public init(tableView: UITableView) {
        super.init()
        tableView.refreshControl = refreshControl
    }

    @objc func refresh() {
        onRefresh?()
    }

    public func searchStatusChanged(_ status: RefreshControllerStatus) {
        switch status {
        case .refreshing:
            refreshControl.beginRefreshing()
        case .none:
            refreshControl.endRefreshing()
        }
    }
}
