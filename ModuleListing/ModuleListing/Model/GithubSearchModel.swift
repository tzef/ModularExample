//
//  GithubSearchModel.swift
//  ModuleListing
//

public struct GithubSearchModel {
    var total: Int
    var items: [Item]

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
    }
}
