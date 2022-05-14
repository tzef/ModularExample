//
//  RepositoryDetailsViewModel.swift
//  ModularExample
//

import Foundation

final class RepositoryDetailsViewModel {
    private let item: GithubSearchModel.Item

    init(item: GithubSearchModel.Item) {
        self.item = item
    }

    var title: String {
        item.fullName
    }
}
