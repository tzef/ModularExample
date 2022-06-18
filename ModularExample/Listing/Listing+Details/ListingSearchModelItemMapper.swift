//
//  ListingSearchModelItemMapper.swift
//  ModularExample
//

import ModuleDetails
import ModuleListing

final class ListingSearchModelItemMapper: DetailsSearchItemMapper {
    func toDetailsSearchItemModel (
        from item: ListingItemDisplaying
    ) -> ModuleDetails.SearchItemDisplaying {
        SearchItemDTO(representable: item)
    }
}
