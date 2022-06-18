//
//  UIFactory.swift
//  ModuleDetails
//

import UIKit
import ModuleDesignSystem

public final class UIFactory {
    private init() {}

    public static func repositoryDetailsViewController(
        item: SearchItemDisplaying,
        designSystemFactory: DesignSystemFactory
    ) -> UIViewController {
        let viewModelMapper = DetailsCellViewModelMapper()
        let viewModel = RepositoryDetailsViewModel(
            item: SearchItemModel(representable: item),
            viewModelMapper: viewModelMapper
        )
        let viewController = RepositoryDetailsViewController(
            viewModel: viewModel
        )
        DesignSystem.setup(factory: designSystemFactory)
        return viewController
    }
}
