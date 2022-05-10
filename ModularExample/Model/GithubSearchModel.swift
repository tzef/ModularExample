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
        var fullName: String
        var description: String
        var forks: Int
        var watchers: Int
    }
}
