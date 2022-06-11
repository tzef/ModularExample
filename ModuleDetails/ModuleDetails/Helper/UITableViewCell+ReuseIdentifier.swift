//
//  UITableViewCell+ReuseIdentifier.swift
//  ModuleDetails
//

import UIKit

public extension UITableViewCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}

