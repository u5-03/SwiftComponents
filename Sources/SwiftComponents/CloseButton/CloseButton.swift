// 
// Created on 2020/02/21
// Copyright © 2020年, yugo.sugiyama. All rights reserved.
//

import SwiftUI

public struct CloseButton: View {
    public var action: (() -> Void)

    public init(action: @escaping (() -> Void)) {
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Image(systemName: "xmark")
                .foregroundColor(Color(.label))
                .frame(width: 30, height: 30, alignment: .center)
                .padding()
        }
    }
}
