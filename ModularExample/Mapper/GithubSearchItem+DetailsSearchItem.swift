//
//  GithubSearchItem+DetailsSearchItem.swift
//  ModularExample
//

import ModuleDetails
import ModuleListing

extension GithubSearchModel.Item {
    var detailsSearchItemModel: SearchItemModel {
        SearchItemModel(
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

