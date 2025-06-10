//
//  OnboardingPasswordViewModelTests.swift
//  SwiftChatTests
//
//  Created by Lucas Bighi on 09/06/25.
//

import XCTest
@testable import SwiftChat

final class OnboardingPasswordViewModelTests: XCTestCase {
    func testInvalidPassword() {
        let sut = makeSUT()
        sut.password = "abc"
        sut.validatePassword()
        XCTAssertFalse(sut.isValidPassowrd)
    }
    
    func testValidEmail() {
        let sut = makeSUT()
        sut.password = "abc123"
        sut.validatePassword()
        XCTAssertTrue(sut.isValidPassowrd)
    }
    
    private func makeSUT() -> OnboardingPasswordViewModel {
        let repo = OnboardingPasswordRepository()
        let coordinator = OnboardingCoordinator()
        return OnboardingPasswordViewModel(coordinator: coordinator, repository: repo)
    }
}
