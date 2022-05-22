//
//  JSONDecoder+DateStrategy.swift
//  ModuleCore
//

import Foundation

public extension JSONDecoder {
    convenience init(dateStrategy: DateDecodingStrategy) {
        self.init()
        dateDecodingStrategy = dateStrategy
    }
}
