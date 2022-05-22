//
//  UITableViewCell+ReuseIdentifier.swift
//  ModuleDetails
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
