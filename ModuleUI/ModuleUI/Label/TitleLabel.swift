//
//  TitleLabel.swift
//  ModuleUI
//

import UIKit

public class TitleLabel: UILabel {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        textColor = UIColor.label
        numberOfLines = 0
    }
}
