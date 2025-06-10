//
//  OnboardingCoordinator.swift
//  SwiftChat
//
//  Created by Lucas Bighi on 09/06/25.
//

import SwiftUI

final class OnboardingCoordinator: ObservableObject {
    @State var path = NavigationPath()
    @Published var credentials = UserCredentials()
    
    init() {
        
    }
    
    func start() -> some View {
        NavigationStack(path: $path) {
            OnboardingEmailFactory.make(coordinator: self)
                .navigationDestination(for: String.self) { screen in
                    if screen == "Password" {
                        OnboardingPasswordFactory.make(coordinator: self)
                    }
                }
        }
    }
    
    func goToPassword() {
        path.append("Password")
    }
}
