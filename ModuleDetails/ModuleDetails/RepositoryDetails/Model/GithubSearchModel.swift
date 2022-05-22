//
//  GithubSearchModel.swift
//  ModuleDetails
//

import Foundation

public struct GithubSearchModel {
    var total: Int
    var items: [Item]

    public struct Item {
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

        public init(
            id: Int,
            name: String,
            owner: String,
            fullName: String,
            description: String,
            language: String,
            forks: Int,
            watchers: Int,
            openIssues: Int,
            url: String,
            homePage: String,
            license: String,
            createdAt: Date?,
            updatedAt: Date?
        ) {
            self.id = id
            self.name = name
            self.owner = owner
            self.fullName = fullName
            self.description = description
            self.language = language
            self.forks = forks
            self.watchers = watchers
            self.openIssues = openIssues
            self.url = url
            self.homePage = homePage
            self.license = license
            self.createdAt = createdAt
            self.updatedAt = updatedAt
        }

    }
}
