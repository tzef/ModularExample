//
//  RefreshController.swift
//  ModularExample
//

import UIKit

final class RefreshController: NSObject {
    var onRefresh: (() -> Void)?

    var searchStatus: HomepageViewModel.SearchStatus = .wait {
        didSet {
            switch searchStatus {
            case .wait:
                break
            case .searching:
                refreshControl.beginRefreshing()
            case .done, .fail:
                refreshControl.endRefreshing()
            }
        }
    }

    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()

    init(tableView: UITableView) {
        super.init()
        tableView.refreshControl = refreshControl
    }

    @objc func refresh() {
        onRefresh?()
    }
}
