//
// Created on 2020/02/22
// Copyright © 2020年, yugo.sugiyama. All rights reserved.
//

import SwiftUI
import Combine
import SwiftExtensions

public struct LoadingIndicatorView: View {
    @State var isAnimating = false
    let isLoading: Bool
    let animation = Animation.linear(duration: 1).repeatForever(autoreverses: false)

    public init(isLoading: Bool) {
        self.isLoading = isLoading
    }

    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(.black)
                    .opacity(0.01)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .edgesIgnoringSafeArea(.all)
                    .disabled(self.isLoading)
                Circle()
                    .trim(from: 0, to: 0.6)
                    .stroke(AngularGradient(gradient: Gradient(colors: [.gray, .white]), center: .center),
                            style: StrokeStyle(
                                lineWidth: 8,
                                lineCap: .round,
                                dash: [0.1, 16],
                                dashPhase: 8))
                    .frame(width: 48, height: 48)
                    .rotationEffect(.degrees(self.isAnimating ? 360 : 0))
                    .onAppear {
                        withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                            self.isAnimating = true
                        }
                    }
                    .onDisappear {
                        self.isAnimating = false
                    }
            }
            .hidden(self.isLoading)
        }
    }
}

struct LoadingIndicatorView_Preview: PreviewProvider {
    @State static var isLoading = true
    static var previews: some View {
        Group {
            LoadingIndicatorView(isLoading: !isLoading)
            Button(action: {
                isLoading.toggle()
            }, label: {
                Text("Loading switch!")
            })
            EmptyView()
                .colorScheme(.dark)
                .previewDisplayName(device: .iPhoneX)
        }
    }
}
