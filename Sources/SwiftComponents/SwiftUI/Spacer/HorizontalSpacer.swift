//
// Created on 2020/02/21
// Copyright © 2020年, yugo.sugiyama. All rights reserved.
//

import SwiftUI

public struct HorizontalSpacer: View {
    var width: Int

    public init(width: Int) {
        self.width = width
    }

    public var body: some View {
        Spacer().frame(width: CGFloat(width))
    }
}
