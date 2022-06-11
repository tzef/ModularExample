//
//  ListingSearchModelItemMapper.swift
//  ModularExample
//

import ModuleDetails
import ModuleListing

final class ListingSearchModelItemMapper: DetailsSearchItemMapper {
    func toDetailsSearchItemModel (
        from item: GithubSearchModel.Item
    ) -> ModuleDetails.SearchItemModel {
        SearchItemModel(
            id: item.id,
            name: item.name,
            owner: item.owner,
            fullName: item.fullName,
            description: item.description,
            language: item.language,
            forks: item.forks,
            watchers: item.watchers,
            openIssues: item.openIssues,
            url: item.url,
            homePage: item.homePage,
            license: item.license,
            createdAt: item.createdAt,
            updatedAt: item.updatedAt
        )
    }
}
