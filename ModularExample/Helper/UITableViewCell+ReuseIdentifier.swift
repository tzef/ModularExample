//
//  UITableViewCell+ReuseIdentifier.swift
//  ModularExample
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
