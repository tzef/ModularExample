//
//  GithubSearchModel.swift
//  ModuleListing
//

struct GithubSearchModel {
    var total: Int
    var items: [Item]

    struct Item {
        var id: Int
        var name: String
        var owner: String
        var fullName: String
        var description: String
        var language: String
        var forks: Int
        var watchers: Int
        var openIssues: Int
        var url: String
        var homePage: String
        var license: String
        var createdAt: Date?
        var updatedAt: Date?
    }
}
