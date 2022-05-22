//
//  GithubSearchModelItem+ModuleDetails.swift
//  ModuleListing
//

import Foundation
import ModuleDetails

extension ModuleListing.GithubSearchModel.Item {
    var modelForModuleDetails: ModuleDetails.GithubSearchModel.Item {
        ModuleDetails.GithubSearchModel.Item(
            id: self.id,
            name: self.name,
            owner: self.owner,
            fullName: self.fullName,
            description: self.description,
            language: self.language,
            forks: self.forks,
            watchers: self.watchers,
            openIssues: self.openIssues,
            url: self.url,
            homePage: self.homePage,
            license: self.license,
            createdAt: self.createdAt,
            updatedAt: self.updatedAt
        )
    }
}

