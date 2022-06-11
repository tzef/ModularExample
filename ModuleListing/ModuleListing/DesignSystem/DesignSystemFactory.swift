//
//  DesignSystemFactory.swift
//  ModuleListing
//

import UIKit

protocol DesignSystemFactory {
    func makeTitleLabel() -> UILabel
    func makeSubTitleLabel() -> UILabel
    func makeHorizontalDivider() -> UIView
    func makeTableViewRefreshController() -> TableViewRefreshController
}
