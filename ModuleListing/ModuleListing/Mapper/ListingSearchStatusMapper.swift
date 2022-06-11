//
//  ListingSearchStatusMapper.swift
//  ModuleListing
//

import ModuleUI

final class ListingSearchStatusMapper: RepositoryListViewModelStatusMapper {
    func toRefreshControllerIsRefreshing(
        from status: SearchStatus
    ) -> Bool {
        switch status {
        case .wait, .done, .fail:
            return false
        case .searching:
            return true
        }
    }
}
