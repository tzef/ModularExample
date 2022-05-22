//
//  Array+Safe.swift
//  ModuleCore
//

import Foundation

public extension Array {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
