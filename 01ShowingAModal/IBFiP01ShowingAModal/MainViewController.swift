//
//  MainViewController.swift
//  IBFiP01ShowingAModal
//
//  Created by John Stricker on 11/30/16.
//  Copyright © 2016 Raizlabs. All rights reserved.
//
import Anchorage 
import UIKit

/// This will show the Raizlabs Logo and have a button to present a modal
final class MainViewController: UIViewController {
    
    /// Container used to center contents, all contents of the view controller should be added as a subview to this view
    fileprivate let containerView = UIView()

    /// Image view containing the Raizlabs Logo
    fileprivate let logoImageView = RZLogoImageView()

    /// Button to show modal
    fileprivate let showModalButton = PillButton(title: "Show Me The Modal")
}

// MARK: - View lifecycle
extension MainViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureActions()
        configureView()
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}

// MARK: - Actions
private extension MainViewController {
    func configureActions() {
        showModalButton.addTarget(self, action: #selector(showModalButtonTapped), for: .touchUpInside)
    }

    @objc func showModalButtonTapped() {
        let text = "HERE\nIS\nTHE\nMODAL!"
        let modal = SimpleMessageViewController(withText: text)
        present(modal, animated: true, completion: nil)
    }
}

// MARK: - View Configuration
private extension MainViewController {
    enum Appearance {
        static let logoToButtonSpace = CGFloat(30)
    }

    func configureView() {
        // View Hierarchy
        view?.addSubview(containerView)

        containerView.addSubview(logoImageView)
        containerView.addSubview(showModalButton)

        // Style 
        view?.backgroundColor = UIColor.white

        // Layout

        // The containerView's height is dynamically sized to fit its content (the topAnchor should match the top of the top most item, the bottomAnchor should match the bottom of the bottom most item)
        containerView.horizontalAnchors == view.horizontalAnchors
        containerView.topAnchor == logoImageView.topAnchor
        containerView.bottomAnchor == showModalButton.bottomAnchor
        containerView.centerAnchors == view.centerAnchors

        // The imageview is centered in containerView
        logoImageView.centerXAnchor == containerView.centerXAnchor

        // The button is centered below the logo imageview
        showModalButton.centerXAnchor == logoImageView.centerXAnchor
        showModalButton.topAnchor == logoImageView.bottomAnchor + Appearance.logoToButtonSpace
    }
}
