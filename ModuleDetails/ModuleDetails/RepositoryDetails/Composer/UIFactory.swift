//
//  UIFactory.swift
//  ModuleDetails
//

public final class UIFactory {
    private init() {}

    public static func repositoryDetailsViewController(
        item: GithubSearchModel.Item
    ) -> RepositoryDetailsViewController {
        let viewModel = RepositoryDetailsViewModel(
            item: item
        )
        let viewController = RepositoryDetailsViewController(
            viewModel: viewModel
        )
        return viewController
    }
}
