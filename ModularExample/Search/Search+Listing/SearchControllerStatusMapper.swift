//
//  SearchControllerStatusMapper.swift
//  ModularExample
//

import ModuleSearch
import ModuleListing

protocol SearchControllerStatusMapper {
    func toSearchControllerStatus(
        from status: ModuleListing.SearchStatus
    ) -> SearchControllerStatus
}
