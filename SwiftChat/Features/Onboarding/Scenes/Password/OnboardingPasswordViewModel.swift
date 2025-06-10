//
//  OnboardingPasswordViewModel.swift
//  SwiftChat
//
//  Created by Lucas Bighi on 09/06/25.
//

import Foundation

protocol OnboardingPasswordViewModelProtocol: ObservableObject {
    var password: String { get set }
    var isValidPassowrd: Bool { get set }
    
    func validatePassword()
    func createAccount() async
}

final class OnboardingPasswordViewModel: OnboardingPasswordViewModelProtocol {
    private let coordinator: OnboardingCoordinator
    private let repository: OnboardingPasswordRepositable
    
    @Published var password: String = ""
    @Published var isValidPassowrd: Bool = false
    
    init(coordinator: OnboardingCoordinator, repository: OnboardingPasswordRepositable) {
        self.coordinator = coordinator
        self.repository = repository
    }
    
    func validatePassword() {
        isValidPassowrd = password.isValidPassowrd
    }
    
    func createAccount() async {
        coordinator.credentials.password = password
        do {
            try await repository.save(coordinator.credentials)
            // Go to home
        } catch {
            // Show error alert
        }
    }
}
