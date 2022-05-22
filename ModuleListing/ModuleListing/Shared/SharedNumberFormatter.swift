//
//  SharedNumberFormatter.swift
//  ModuleListing
//

import Foundation

final class SharedNumberFormatter {
    static let shared = SharedNumberFormatter()
    private init() {}

    private lazy var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.allowsFloats = false
        formatter.numberStyle = .decimal
        return formatter
    }()

    func format(_ value: Int) -> String {
        let number = NSNumber(value: value)
        return numberFormatter.string(from: number) ?? "\(value)"
    }
}
