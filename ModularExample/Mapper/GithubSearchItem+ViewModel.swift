//
//  GithubSearchItem+ViewModel.swift
//  ModularExample
//

import Foundation

extension GithubSearchModel.Item {
    var searchListCellViewModel: SearchListCellViewModel {
        let watchers = SharedNumberFormatter.shared.format(watchers)
        let forks = SharedNumberFormatter.shared.format(forks)
        return SearchListCellViewModel(
            title: fullName,
            description: description,
            footer: "watchers: \(watchers), forks: \(forks)"
        )
    }
}
