//
//  UIFactory.swift
//  ModuleSearch
//

import ModuleDesignSystem

public final class UIFactory {
    private init() {}

    public static func searchController(
        designSystemFactory: DesignSystemFactory
    ) -> SearchController & SearchControllerService {
        DesignSystem.setup(factory: designSystemFactory)
        return GithubSearchController()
    }
}
