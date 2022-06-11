//
//  UITableViewCell+ReuseIdentifier.swift
//  ModuleListing
//

import UIKit

public extension UITableViewCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}

