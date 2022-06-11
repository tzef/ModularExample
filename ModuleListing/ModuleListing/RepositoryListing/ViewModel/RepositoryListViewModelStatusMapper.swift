//
//  RepositoryListViewModelStatusMapper.swift
//  ModuleListing
//

import ModuleUI

protocol RepositoryListViewModelStatusMapper {
    func toRefreshControllerIsRefreshing(
        from status: SearchStatus
    ) -> Bool
}
