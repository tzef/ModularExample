//
//  GithubSearchResponse+DomainModel.swift
//  ModularExample
//

import Foundation

extension GithubSearchResponse {
    var searchModel: GithubSearchModel {
        GithubSearchModel(
            total: totalCount,
            items: items.map {
                GithubSearchModel.Item(
                    id: $0.id,
                    fullName: $0.fullName,
                    description: $0.description,
                    forks: $0.forks,
                    watchers: $0.watchers
                )
            }
        )
    }
}
