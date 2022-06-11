//
//  DetailsSearchItemMapper.swift
//  ModularExample
//

import ModuleDetails
import ModuleListing

protocol DetailsSearchItemMapper {
    func toDetailsSearchItemModel (
        from item: GithubSearchModel.Item
    ) -> ModuleDetails.SearchItemModel
}
