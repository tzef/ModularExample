//
//  RefreshController.swift
//  ModuleUI
//

import UIKit

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

    public func searchStatusChanged(_ status: SearchStatus) {
        switch status {
        case .wait:
            break
        case .searching:
            refreshControl.beginRefreshing()
        case .done, .fail:
            refreshControl.endRefreshing()
        }
    }
}
