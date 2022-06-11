//
//  DesignSystem.swift
//  ModuleDesignSystem
//

import UIKit

public final class DesignSystem {
    private static let shared = DesignSystem()
    private init() {}

    private var factory: DesignSystemFactory!
    public static func setup(factory: DesignSystemFactory) {
        DesignSystem.shared.factory = factory
    }

    public static func TitleLabel() -> UILabel {
        DesignSystem.shared.factory.makeTitleLabel()
    }

    public static func SubTitleLabel() -> UILabel {
        DesignSystem.shared.factory.makeSubTitleLabel()
    }

    public static func HorizontalDivider() -> UIView {
        DesignSystem.shared.factory.makeHorizontalDivider()
    }

    public static func RefreshController(tableView: UITableView) -> TableViewRefreshController {
        DesignSystem.shared.factory.makeTableViewRefreshController(tableView: tableView)
    }
}
