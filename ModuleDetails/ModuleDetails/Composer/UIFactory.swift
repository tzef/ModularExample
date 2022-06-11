//
//  UIFactory.swift
//  ModuleDetails
//

import ModuleDesignSystem

public final class UIFactory {
    private init() {}

    public static func repositoryDetailsViewController(
        item: SearchItemModel,
        designSystemFactory: DesignSystemFactory
    ) -> RepositoryDetailsViewController {
        let viewModelMapper = DetailsCellViewModelMapper()
        let viewModel = RepositoryDetailsViewModel(
            item: item,
            viewModelMapper: viewModelMapper
        )
        let viewController = RepositoryDetailsViewController(
            viewModel: viewModel
        )
        DesignSystem.setup(factory: designSystemFactory)
        return viewController
    }
}
