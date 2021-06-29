//
//  ClearTextField.swift
//  
//
//  Created by Yugo Sugiyama on 2021/01/13.
//

import SwiftUI

public struct ClearTextField: View {
    private var placeholder: String
    private var text: Binding<String>
    private var onEditingChanged: ((Bool) -> Void)
    private var onCommit: (() -> Void)

    public init(placeholder: String = "", text: Binding<String>, onEditingChanged: @escaping ((Bool) -> Void), onCommit: @escaping (() -> Void)) {
        self.placeholder = placeholder
        self.text = text
        self.onEditingChanged = onEditingChanged
        self.onCommit = onCommit
    }

    public var body: some View {
        TextField(placeholder, text: text,
                  onEditingChanged: onEditingChanged,
                  onCommit: onCommit)
            .clearButton(text: text)
            .padding(.all, 4)
            .overlay(
                RoundedRectangle(cornerRadius: 2)
                    .stroke(Color(.systemGray3), lineWidth: 1)
            )
    }
}
