//
//  DesignSystem.swift
//  ModuleDetails
//

import UIKit

final class DesignSystem {
    private static let shared = DesignSystem()
    private init() {}

    private var factory: DesignSystemFactory!
    static func setup(factory: DesignSystemFactory) {
        DesignSystem.shared.factory = factory
    }

    static func TitleLabel() -> UILabel {
        DesignSystem.shared.factory.makeTitleLabel()
    }

    static func SubTitleLabel() -> UILabel {
        DesignSystem.shared.factory.makeSubTitleLabel()
    }

    static func HorizontalDivider() -> UIView {
        DesignSystem.shared.factory.makeHorizontalDivider()
    }
}
