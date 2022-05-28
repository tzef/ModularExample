//
//  JSONDecoder+DateStrategy.swift
//  ModuleCore
//

import Foundation

extension JSONDecoder {
    convenience init(dateStrategy: DateDecodingStrategy) {
        self.init()
        dateDecodingStrategy = dateStrategy
    }
}
