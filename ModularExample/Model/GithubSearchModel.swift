//
//  GithubSearchModel.swift
//  ModularExample
//

import Foundation

struct GithubSearchModel {
    var total: Int
    var items: [Item]

    struct Item {
        var id: Int
        var name: String
        var description: String
        var score: Int
    }
}
