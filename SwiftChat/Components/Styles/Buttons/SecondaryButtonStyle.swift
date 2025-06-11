//
//  SecondaryButtonStyle.swift
//  SwiftChat
//
//  Created by Lucas Bighi on 11/06/25.
//

import SwiftUI

extension CustomButtonStyle {
    static func secondary(isLoading: Binding<Bool> = .constant(false)) -> CustomButtonStyle {
        CustomButtonStyle(
            foregroundColor: .blue,
            borderColor: .blue,
            isLoading: isLoading
        )
    }
}

#Preview {
    VStack {
        Button("Secondary", action: { })
            .buttonStyle(CustomButtonStyle.secondary(isLoading: .constant(false)))
        
        Button("Secondary", action: { })
            .buttonStyle(CustomButtonStyle.secondary(isLoading: .constant(true)))
    }
}
