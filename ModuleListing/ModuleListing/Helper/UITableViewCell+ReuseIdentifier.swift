//
//  UITableViewCell+ReuseIdentifier.swift
//  ModuleListing
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
