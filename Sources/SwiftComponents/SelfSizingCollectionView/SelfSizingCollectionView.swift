//
//  SelfSizingCollectionView.swift
//  
//
//  Created by 杉山優悟 on 2021/02/25.
//

import UIKit

public final class SelfSizingCollectionView: UICollectionView {
    public override var intrinsicContentSize: CGSize {
        return contentSize
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        if bounds.size != intrinsicContentSize {
            invalidateIntrinsicContentSize()
        }
    }
}
