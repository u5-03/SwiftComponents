// 
// Created on 2020/02/09
// Copyright © 2020年, yugo.sugiyama. All rights reserved.
//

import SwiftUI

public struct SquareButton: View {

    @State var text: String
    @State var width: CGFloat
    @State var handler: (() -> Void)

    public var body: some View {
        Button(action: {
            self.handler()
        }, label: {
            Text(text)
                .fontWeight(.bold)
                .foregroundColor(Color(.white))
                .padding()
                .frame(maxWidth: width * 0.8)
                .background(Color(.systemBlue))
        })
    }
}

struct SquareButton_Previews: PreviewProvider {
    static var previews: some View {
        SquareButton(text: "Sign Up", width: 300) {
            print("Button tapped!")
        }
    }
}
