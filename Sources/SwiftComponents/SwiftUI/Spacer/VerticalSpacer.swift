// 
// Created on 2020/02/21
// Copyright © 2020年, yugo.sugiyama. All rights reserved.
//

import SwiftUI

public struct VerticalSpacer: View {
    var height: Int

    public init(height: Int) {
        self.height = height
    }

    public var body: some View {
        Spacer().frame(height: CGFloat(height))
    }
}
