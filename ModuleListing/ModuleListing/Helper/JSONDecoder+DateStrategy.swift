//
//  JSONDecoder+DateStrategy.swift
//  ModuleListing
//

import Foundation

extension JSONDecoder {
    convenience init(dateStrategy: DateDecodingStrategy) {
        self.init()
        dateDecodingStrategy = dateStrategy
    }
}
