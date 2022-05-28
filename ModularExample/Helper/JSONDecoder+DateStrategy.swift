//
//  JSONDecoder+DateStrategy.swift
//  ModularExample
//

import Foundation

extension JSONDecoder {
    convenience init(dateStrategy: DateDecodingStrategy) {
        self.init()
        dateDecodingStrategy = dateStrategy
    }
}
