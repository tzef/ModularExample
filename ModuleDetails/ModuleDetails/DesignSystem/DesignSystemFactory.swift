//
//  DesignSystemFactory.swift
//  ModuleDetails
//

import UIKit

protocol DesignSystemFactory {
    func makeTitleLabel() -> UILabel
    func makeSubTitleLabel() -> UILabel
    func makeHorizontalDivider() -> UIView
}

