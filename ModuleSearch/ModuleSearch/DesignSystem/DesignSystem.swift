//
//  DesignSystem.swift
//  ModuleSearch
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
}
