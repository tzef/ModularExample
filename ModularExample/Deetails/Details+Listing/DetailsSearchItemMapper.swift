//
//  DetailsSearchItemMapper.swift
//  ModularExample
//

import ModuleDetails
import ModuleListing

protocol DetailsSearchItemMapper {
    func toDetailsSearchItemModel (
        from item: ListingItemDisplaying
    ) -> ModuleDetails.SearchItemDisplaying
}
