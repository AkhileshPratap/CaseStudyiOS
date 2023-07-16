//
//  SignupTests.swift
//  CaseStudyiOSTests
//
//  Created by AkhileshSingh on 14/07/23.
//

import XCTest

@testable import CaseStudyiOS

final class SignupTests: XCTestCase {

    func test_input_is_notValid_Email() {
        let sut = SignupViewModel()
        let expectation = XCTestExpectation()

        sut.emailId = "akhilesh@gmail"
        sut.validatePage()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(sut.isValidEmail, false)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func test_input_is_Valid_Email() {
        let sut = SignupViewModel()
        let expectation = XCTestExpectation()

        sut.emailId = "akhilesh@gmail.com"
        sut.validatePage()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(sut.isValidEmail, true)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func test_input_having2CharactersOrLess_is_notValid_Name() {
        let sut = SignupViewModel()
        let expectation = XCTestExpectation()

        sut.name = "ak"
        sut.validatePage()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(sut.isValidName, false)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func test_input_having_specialCharacter_is_notValid_Name() {
        let sut = SignupViewModel()
        let expectation = XCTestExpectation()

        sut.name = "akhilesh@"
        sut.validatePage()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(sut.isValidName, false)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func test_input_is_Valid_Name() {
        let sut = SignupViewModel()
        let expectation = XCTestExpectation()

        sut.name = "akhilesh"
        sut.validatePage()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(sut.isValidName, true)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func test_input_password_is_notValid() {
        let sut = SignupViewModel()
        let expectation = XCTestExpectation()

        sut.password = "akhilesh"
        sut.validatePage()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(sut.isValidPassword, false)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func test_input_notHavingSpecialCdharacter_is_notValid_Password() {
        let sut = SignupViewModel()
        let expectation = XCTestExpectation()

        sut.password = "Akhilesh1234"
        sut.validatePage()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(sut.isValidPassword, false)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func test_input_notHavingNumericCdharacter_is_notValid_Password() {
        let sut = SignupViewModel()
        let expectation = XCTestExpectation()

        sut.password = "Akhilesh@"
        sut.validatePage()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(sut.isValidPassword, false)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func test_input_notHavingCapitalCdharacter_is_notValid_Password() {
        let sut = SignupViewModel()
        let expectation = XCTestExpectation()

        sut.password = "akhilesh@1234"
        sut.validatePage()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(sut.isValidPassword, false)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func test_input_password_is_Valid() {
        let sut = SignupViewModel()
        let expectation = XCTestExpectation()

        sut.password = "Akhilesh@1234"
        sut.validatePage()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(sut.isValidPassword, true)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

}
