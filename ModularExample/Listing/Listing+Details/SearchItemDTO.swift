//
//  SearchModelDTO.swift
//  ModularExample
//

import ModuleDetails
import ModuleListing

struct SearchItemDTO: ModuleDetails.SearchItemDisplaying {
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

    init(representable: ModuleListing.ListingItemDisplaying) {
        self.id = representable.id
        self.name = representable.name
        self.owner = representable.owner
        self.fullName = representable.fullName
        self.description = representable.description
        self.language = representable.language
        self.forks = representable.forks
        self.watchers = representable.watchers
        self.openIssues = representable.openIssues
        self.url = representable.url
        self.homePage = representable.homePage
        self.license = representable.license
        self.createdAt = representable.createdAt
        self.updatedAt = representable.updatedAt
    }
}
