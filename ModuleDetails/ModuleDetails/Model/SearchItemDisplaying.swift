//
//  SearchItemDisplaying.swift
//  ModuleDetails
//

public protocol SearchItemDisplaying {
    var id: Int { get }
    var name: String { get }
    var owner: String { get }
    var fullName: String { get }
    var description: String { get }
    var language: String { get }
    var forks: Int { get }
    var watchers: Int { get }
    var openIssues: Int { get }
    var url: String { get }
    var homePage: String { get }
    var license: String { get }
    var createdAt: Date? { get }
    var updatedAt: Date? { get }
}

extension SearchItemModel: SearchItemDisplaying {}

