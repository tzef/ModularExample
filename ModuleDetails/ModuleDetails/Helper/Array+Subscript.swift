//
//  Array+Safe.swift
//  ModuleDetails
//

extension Array {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
