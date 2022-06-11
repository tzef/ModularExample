//
//  TableViewRefreshController.swift
//  ModuleDesignSystem
//

import UIKit

open class TableViewRefreshController: NSObject {
    private let tableView: UITableView
    public var onRefresh: (() -> Void)?

    public init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
    }

    open func isRefreshingChanged(_ isRefreshing: Bool) {}
}
