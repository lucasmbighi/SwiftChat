//
//  PrimaryButtonStyle.swift
//  SwiftChat
//
//  Created by Lucas Bighi on 11/06/25.
//

import SwiftUI

extension CustomButtonStyle {
    static func primary(isLoading: Binding<Bool> = .constant(false)) -> CustomButtonStyle {
        CustomButtonStyle(
            foregroundColor: .white,
            backgroundColor: .blue,
            isLoading: isLoading
        )
    }
}

#Preview {
    VStack {
        Button("Primary", action: { })
            .buttonStyle(CustomButtonStyle.primary(isLoading: .constant(false)))
        
        Button("Primary", action: { })
            .buttonStyle(CustomButtonStyle.primary(isLoading: .constant(true)))
    }
}
