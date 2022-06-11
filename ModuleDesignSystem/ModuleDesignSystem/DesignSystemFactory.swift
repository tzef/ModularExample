//
//  DesignSystemFactory.swift
//  ModuleDesignSystem
//

import UIKit

public protocol DesignSystemFactory {
    func makeTitleLabel() -> UILabel
    func makeSubTitleLabel() -> UILabel
    func makeHorizontalDivider() -> UIView
    func makeTableViewRefreshController(tableView: UITableView) -> TableViewRefreshController
}
