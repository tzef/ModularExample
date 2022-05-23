//
//  Array+Safe.swift
//  ModuleCore
//

public extension Array {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
