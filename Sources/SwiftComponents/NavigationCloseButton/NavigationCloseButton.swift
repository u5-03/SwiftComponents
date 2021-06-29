//
//  NavigationCloseButton.swift
//  
//
//  Created by 杉山優悟 on 2021/02/04.
//

import UIKit

public final class NavigationCloseButton: UIButton {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupInitial()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupInitial()
    }

    private func setupInitial() {
        setImage(UIImage(systemName: "xmark"), for: .normal)
        tintColor = .label
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 30),
            heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}

public extension UIViewController {
    func setCloseButton() {
        let closeButton = NavigationCloseButton()
        let leftNavigationItem = UIBarButtonItem(customView: closeButton)
        navigationItem.leftBarButtonItem = leftNavigationItem
        closeButton.addAction(.init(handler: { [weak self] _ in
            self?.dismiss(animated: true)
        }), for: .touchUpInside)
    }
}
