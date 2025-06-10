//
//  OnboardingEmailViewModelTests.swift
//  SwiftChatTests
//
//  Created by Lucas Bighi on 09/06/25.
//

import XCTest
@testable import SwiftChat

final class OnboardingEmailViewModelTests: XCTestCase {
    func testInvalidEmail() {
        let sut = makeSUT()
        sut.email = "invalid"
        sut.validateEmail()
        XCTAssertFalse(sut.isValidEmail)
    }
    
    func testValidEmail() {
        let sut = makeSUT()
        sut.email = "user@email.com"
        sut.validateEmail()
        XCTAssertTrue(sut.isValidEmail)
    }
    
    private func makeSUT() -> OnboardingEmailViewModel {
        let repo = OnboardingEmailRepository()
        let coordinator = OnboardingCoordinator()
        return OnboardingEmailViewModel(coordinator: coordinator, repository: repo)
    }
}
