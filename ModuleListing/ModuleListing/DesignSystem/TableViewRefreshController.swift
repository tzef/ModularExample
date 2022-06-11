//
//  TableViewRefreshController.swift
//  ModuleListing
//

import UIKit

class TableViewRefreshController: NSObject {
    let tableView: UITableView
    var onRefresh: (() -> Void)?

    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
    }

    func isRefreshingChanged(_ isRefreshing: Bool) {}
}
