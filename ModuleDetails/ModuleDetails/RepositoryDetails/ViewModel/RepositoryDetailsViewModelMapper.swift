//
//  RepositoryDetailsViewModelMapper.swift
//  ModuleDetails
//

protocol RepositoryDetailsViewModelMapper {
    func toLabelValueCellViewModel(
        from model: RepositoryDetailsViewModel.CellViewModel
    ) -> LabelValueCellViewModel
}
