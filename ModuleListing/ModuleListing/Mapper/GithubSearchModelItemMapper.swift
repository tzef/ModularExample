//
//  GithubSearchModelItemMapper.swift
//  ModuleListing
//

final class GithubSearchModelItemMapper: RepositoryListViewModelItemMapper {
    func toSearchListCellViewModel(
        from model: GithubSearchModel.Item
    ) -> SearchListCellViewModel {
        let watchers = SharedNumberFormatter.shared.format(model.watchers)
        let forks = SharedNumberFormatter.shared.format(model.forks)
        return SearchListCellViewModel(
            title: model.fullName,
            description: model.description,
            footer: "watchers: \(watchers), forks: \(forks)"
        )
    }
}
