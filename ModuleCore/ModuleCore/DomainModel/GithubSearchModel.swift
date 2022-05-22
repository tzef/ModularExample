//
//  GithubSearchModel.swift
//  ModuleCore
//

import Foundation

public struct GithubSearchModel {
    public var total: Int
    public var items: [Item]

    public init(total: Int, items: [Item]) {
        self.total = total
        self.items = items
    }

    public struct Item {
        public var id: Int
        public var name: String
        public var owner: String
        public var fullName: String
        public var description: String
        public var language: String
        public var forks: Int
        public var watchers: Int
        public var openIssues: Int
        public var url: String
        public var homePage: String
        public var license: String
        public var createdAt: Date?
        public var updatedAt: Date?

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
