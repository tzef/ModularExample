//
//  LoadingCell.swift
//  ModuleListing
//

import UIKit

final class LoadingCell: UITableViewCell {
    private lazy var errorIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "xmark.octagon.fill"))
        imageView.tintColor = .red
        imageView.isHidden = true
        return imageView
    }()

    private lazy var loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        return indicator
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure() {
        guard !loadingIndicator.isAnimating else {
            return
        }
        loadingIndicator.startAnimating()
        errorIcon.isHidden = true
    }

    func searchStatusChanged(_ status: SearchStatus) {
        guard case .fail = status else {
            return
        }
        errorIcon.isHidden = false
    }

    private func setupView() {
        contentView.addSubview(loadingIndicator)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        contentView.addSubview(errorIcon)
        errorIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            errorIcon.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            errorIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
