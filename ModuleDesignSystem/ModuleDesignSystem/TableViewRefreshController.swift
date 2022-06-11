//
//  TableViewRefreshController.swift
//  ModuleDesignSystem
//

import UIKit

public class TableViewRefreshController: NSObject {
    private let tableView: UITableView
    public var onRefresh: (() -> Void)?

    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
    }

    public func isRefreshingChanged(_ isRefreshing: Bool) {}
}
