//
//  HorizontalDivider.swift
//

import UIKit

final class HorizontalDivider: UIView {
    var height: CGFloat = 1 {
        didSet {
            layer.cornerRadius = height / 2
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundColor = UIColor.systemGroupedBackground
    }

    override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: height)
    }
}
