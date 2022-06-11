//
//  DesignSystemFactory.swift
//  ModuleUI
//

import UIKit
import ModuleDesignSystem

public final class DesignSystemFactory: ModuleDesignSystem.DesignSystemFactory {
    public init() {}

    public func makeTitleLabel() -> UILabel {
        TitleLabel()
    }

    public func makeSubTitleLabel() -> UILabel {
        SubTitleLabel()
    }

    public func makeHorizontalDivider() -> UIView {
        HorizontalDivider()
    }

    public func makeTableViewRefreshController(tableView: UITableView) -> TableViewRefreshController {
        RefreshController(tableView: tableView)
    }
}
