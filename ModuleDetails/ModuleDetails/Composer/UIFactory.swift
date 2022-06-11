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
        let viewModel = RepositoryDetailsViewModel(
            item: item
        )
        let viewController = RepositoryDetailsViewController(
            viewModel: viewModel
        )
        DesignSystem.setup(factory: designSystemFactory)
        return viewController
    }
}
