//
//  OnboardingUsernameView.swift
//  SwiftChat
//
//  Created by Lucas Bighi on 09/06/25.
//

import SwiftUI

struct OnboardingUsernameView<ViewModel: OnboardingUsernameViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            TextField("Username", text: $viewModel.username)
                .keyboardType(.default)
                .textContentType(.username)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)
                .onChange(of: viewModel.username) { _, _ in
                    viewModel.validateUsername()
                }
            
            Button {
                Task {
                    await viewModel.checkUsernameIsUsed()
                }
            } label: {
                Text("Check username")
            }
            .disabled(!viewModel.isValidUsername)
            .buttonStyle(CustomButtonStyle.primary(isLoading: $viewModel.isCheckingUsername))
            
            Spacer()
            
            Button("Avançar", action: viewModel.goToPassword)
                .disabled(!viewModel.isUsernameUsed)
                .buttonStyle(CustomButtonStyle.primary())
        }
        .padding()
    }
}

#Preview {
    OnboardingUsernameFactory.make(coordinator: .init())
}
