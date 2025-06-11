//
//  CustomButtonStyle.swift
//  SwiftChat
//
//  Created by Lucas Bighi on 11/06/25.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    let foregroundColor: Color
    let backgroundColor: Color?
    let borderColor: Color?
    
    @Binding var isLoading: Bool
    
    init(
        foregroundColor: Color,
        backgroundColor: Color? = nil,
        borderColor: Color? = nil,
        isLoading: Binding<Bool>
    ) {
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self._isLoading = isLoading
    }
    
    func loadingView(_ configuration: Configuration) -> some View {
        ProgressView()
            .tint(foregroundColor)
            .padding()
            .background(background)
    }
    
    func defaultView(_ configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundStyle(foregroundColor)
            .background(background)
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
    
    func makeBody(configuration: Configuration) -> some View {
        if isLoading {
            loadingView(configuration)
        } else {
            defaultView(configuration)
        }
    }
}

extension CustomButtonStyle {
    private var background: some View {
        Group {
            if let borderColor {
                Capsule()
                    .stroke(borderColor, lineWidth: 2)
            } else {
                Capsule()
                    .fill(backgroundColor ?? .clear)
            }
        }
    }
}
