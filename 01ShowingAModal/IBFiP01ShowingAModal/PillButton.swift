//
//  PillButton.swift
//  IBFiP01ShowingAModal
//
//  Created by John Stricker on 12/1/16.
//  Copyright © 2016 Raizlabs. All rights reserved.
//

import Anchorage
import UIKit

/// An oval button with a solid white line border and raizlabs red background
final class PillButton: UIButton {
    init(title: String) {
        super.init(frame: CGRect.zero)
        configureButton(withTitle: title)
    }

    @available(*, unavailable) init() {
        fatalError("this is a xibless class utilizing anchorage for autolayout, use init(title:) instead")
    }
    
    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("this is a xibless class utilizing anchorage for autolayout, use init(title:) instead")
    }

    @available(*, unavailable) convenience init(type buttonType: UIButtonType) {
        fatalError("this is a xibless class utilizing anchorage for autolayout, use init(title:) instead")
    }
}

// MARK: - UIButton Overrides
extension PillButton {
    override var isEnabled: Bool {
        didSet {
            backgroundColor = isEnabled ? Appearance.backgroundColor : Appearance.backgroundColor.semiTransparent
        }
    }

    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? Appearance.highlightedBackgroundColor : Appearance.backgroundColor
        }
    }
}

// MARK: - Button Configuration
private extension PillButton {
    enum Appearance {
        static let backgroundColor = UIColor.App.raizlabsRed
        static let borderColor = UIColor.App.raizlabsRed.cgColor
        static let font = UIFont.App(type: .helvetica, ofSize: 20)
        static let fontColor = UIColor.white
        static let highlightedBackgroundColor = UIColor.red
        static let size = CGSize(width: 240, height: 60)
    }

    func configureButton(withTitle title: String) {
        setTitle(title, for: .normal)

        layer.borderWidth = 1
        layer.borderColor = Appearance.borderColor
        layer.cornerRadius = Appearance.size.height / 2.0
        clipsToBounds = true

        setTitleColor(Appearance.fontColor, for: .normal)
        setTitleColor(Appearance.fontColor.semiTransparent, for: .disabled)
        backgroundColor = Appearance.backgroundColor
        titleLabel?.font = Appearance.font

        // Layout
        heightAnchor == Appearance.size.height
        widthAnchor == Appearance.size.width
    }
}