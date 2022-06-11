//
//  ListingSearchStatusMapper.swift
//  ModularExample
//

import ModuleSearch
import ModuleListing

final class ListingSearchStatusMapper: SearchControllerStatusMapper {
    func toSearchControllerStatus(
        from status: ModuleListing.SearchStatus
    ) -> SearchControllerStatus {
        switch status {
        case .wait:
            return .wait
        case .searching:
            return .searching
        case .done:
            return .done
        case .fail(let message):
            return .fail(message: message)
        }
    }
}
