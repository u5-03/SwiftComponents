//
// Created on 2021/01/20
// Copyright © 2020年, yugo.sugiyama. All rights reserved.
//

import UIKit
import SwiftUI

public enum SpacerType {
    case width(width: CGFloat)
    case height(height: CGFloat)
}

public struct SpacerView: View {
    var type: SpacerType

    public init(type: SpacerType) {
        self.type = type
    }

    public var body: some View {
        switch type {
        case .width(let width):
            Spacer().frame(width: width)
        case .height(let height):
            Spacer().frame(height: height)
        }
    }
}
