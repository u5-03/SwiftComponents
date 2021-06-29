//
//  UIViewWrapperView.swift
//  
//
//  Created by 杉山優悟 on 2021/01/02.
//

import SwiftUI
import UIKit

public protocol UIViewWrappedViewProtocol: UIView {
    associatedtype ContentType: Equatable
    var content: ContentType { get set }
}

public struct UIViewWrappedView<T: UIViewWrappedViewProtocol>: UIViewRepresentable {
    public typealias ContentType = T.ContentType
    public typealias UIViewType = T
    @Binding private var content: ContentType
    private let contentView: UIViewType

    public init(content: Binding<ContentType>, @ViewBuilder contentView: () -> UIViewType) {
        self._content = content
        self.contentView = contentView()
    }

    public func makeUIView(context: Context) -> UIViewType {
        return contentView
    }

    public func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.content = content
    }
}

//struct UIViewWrapperView_Previews: PreviewProvider {
//    static var previews: some View {
//        UIViewWrapperView(content: UIC, content: <#T##() -> _#>)
//    }
//}
