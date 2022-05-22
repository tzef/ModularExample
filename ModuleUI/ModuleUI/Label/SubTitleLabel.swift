//
//  SubTitleLabel.swift
//  ModuleUI
//

import UIKit

public class SubTitleLabel: UILabel {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
        textColor = UIColor.secondaryLabel
        numberOfLines = 0
    }
}
