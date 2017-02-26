//
//  SimpleMessageModalViewController.swift
//  IBFiP01ShowingAModal
//
//  Created by John Stricker on 12/2/16.
//  Copyright © 2016 Raizlabs. All rights reserved.
//

import Anchorage
import UIKit

/// Displays a large centered text message.
final class SimpleMessageModalViewController: ModalViewController {

    fileprivate let messageLabel: UILabel = {
        let label = UILabel()
        label.font =  AppFont.helvetica.size(50)
        label.textColor = AppColor.white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    convenience init(withText text: String) {
        self.init()
        messageLabel.text = text
    }

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

// MARK: - View Configuration
private extension SimpleMessageModalViewController {
    
    func configureView() {
        view.addSubview(messageLabel)
        messageLabel.centerAnchors == view.centerAnchors
    }
}