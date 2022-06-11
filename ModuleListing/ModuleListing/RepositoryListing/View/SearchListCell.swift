//
//  SearchListCell.swift
//  ModuleListing
//

import UIKit
import ModuleDesignSystem

final class SearchListCell: UITableViewCell {
    private lazy var titleLabel = DesignSystem.TitleLabel()

    private lazy var descriptionLabel: UILabel = {
        let label = DesignSystem.SubTitleLabel()
        label.numberOfLines = 3
        return label
    }()

    private lazy var footerLabel = DesignSystem.SubTitleLabel()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            titleLabel,
            descriptionLabel,
            footerLabel,
            DesignSystem.HorizontalDivider()
        ])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 8, left: 8, bottom: 8, right: 8)
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with viewModel: SearchListCellViewModel) {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        footerLabel.text = viewModel.footer
    }

    private func setupView() {
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
