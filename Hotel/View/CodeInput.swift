//
//  CodeInput.swift
//  Hotel
//
//  Created by Владислав Склюев on 25.12.2023.
//

import SwiftUI
import UIKit

public enum CodeInputState {
    case active(isSecure: Bool)
    case empty
    case incorrect
}

public struct CodeInput: View {
    
    
    private let numbers: [Int]
    private let state: CodeInputState
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    public var body: some View {
        ForEach(numbers.indices) { number in
            VStack(spacing: 20) {
                inputData(number)
                line
            }
            .padding(.top, 16)
            .padding(.horizontal, 6)
        }
    }
    public init(numbers: [Int], state: CodeInputState) {
        self.numbers = numbers
        self.state = state
    }
}

private extension CodeInput {
    
    var ellipse: some View {
        Circle().frame(width: 20, height: 20).foregroundStyle(.red)
    }
}

private extension CodeInput {
    
    var line: some View {
        Rectangle().frame(height: 2).foregroundStyle(lineColor).cornerRadius(20)
    }

    var lineColor: Color {
        switch state {
        case.active:
            return Color.black
        case.empty:
            return Color.blue
        case.incorrect:
            return Color.red
        }
    }
}

private extension CodeInput {
    @ViewBuilder
    func inputData(_ number: Int) -> some View {
        switch state {
        case.active(let isSecure):
            if isSecure {
                ellipse
            } else {
                text(number)
            }
        case.empty, .incorrect:
            EmptyView()
        }
    }
}

private extension CodeInput {
    
    func text(_ number: Int) -> some View {
        Text("\(number)").kerning(0.22).foregroundStyle(.secondary).font(.title)
    }
}

//#Preview {
//    CodeInput(numbers: [1, 2, 3], state: .active(isSecure: false))
//}
