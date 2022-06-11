//
//  RepositoryListViewModelItemMapper.swift
//  ModuleListing
//

protocol RepositoryListViewModelItemMapper {
    func toSearchListCellViewModel(
        from model: GithubSearchModel.Item
    ) -> SearchListCellViewModel
}
