//
//  HalfModalViewController.swift
//  ReptyShare
//
//  Created by 杉山優悟 on 2021/01/02.
//  Copyright © 2021 yugo.sugiyama. All rights reserved.
//

import UIKit
import SwiftUI
import SwiftExtensions

public protocol DismissibleProtocol {
    var dismissView: (() -> Void)? { get set }
}

public protocol DismissibleView: UIView, DismissibleProtocol {}
public protocol DismissibleViewController: UIViewController, DismissibleProtocol {}

public enum HalfModalContentType {
    case view(view: DismissibleView)
    case viewController(viewController: DismissibleViewController)
}

public final class HalfModalViewController: UIActivityViewController {
    private let halfModalContentType: HalfModalContentType

    public required init(halfModalContentType: HalfModalContentType) {
        self.halfModalContentType = halfModalContentType
        super.init(activityItems: [], applicationActivities: nil)
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        let subViews = self.view.subviews
        for view in subViews {
            view.removeFromSuperview()
        }
        switch halfModalContentType {
        case .viewController(let viewController):
            addChild(viewController)
            view.addAutoSubview(viewController.view)
            NSLayoutConstraint.activate(viewController.view.constrainEdges(to: view))
            viewController.didMove(toParent: self)
            var mutatingViewController = viewController
            mutatingViewController.dismissView = { [weak self] in
                self?.dismiss(animated: true)
            }
        case .view(let contentView):
            view.addAutoSubview(contentView)
            NSLayoutConstraint.activate(contentView.constrainEdges(to: view))
            var mutatingView = contentView
            mutatingView.dismissView = { [weak self] in
                self?.dismiss(animated: true)
            }
        }
    }
}
