//
//  Array+Safe.swift
//  ModuleListing
//

extension Array {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
