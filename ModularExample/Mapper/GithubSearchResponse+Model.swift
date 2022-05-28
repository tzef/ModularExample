//
//  SearchResponse+SearchModel.swift
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
                    name: $0.name,
                    description: $0.description,
                    score: $0.score
                )
            }
        )
    }
}
