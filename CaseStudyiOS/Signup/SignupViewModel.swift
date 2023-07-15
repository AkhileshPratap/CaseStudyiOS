//
//  SignupViewModel.swift
//  CaseStudyiOS
//
//  Created by AkhileshSingh on 14/07/23.
//

import Foundation
import Combine

final class SignupViewModel: ObservableObject {

    @Published var emailId = ""
    @Published var name = ""
    @Published var password = ""

    @Published var isValidEmail: Bool = true
    @Published var isValidName: Bool = true
    @Published var isValidPassword: Bool = true

        @Published var hasPassedValidation = false

    private var cancellables = Set<AnyCancellable>()

    func validatePage() {
        //

        validateEmailId
            .receive(on: RunLoop.main)
            .assign(to: \.isValidEmail, on: self)
            .store(in: &cancellables)

        validateName
            .receive(on: RunLoop.main)
            .assign(to: \.isValidName, on: self)
            .store(in: &cancellables)

        validatePassword
            .receive(on: RunLoop.main)
            .assign(to: \.isValidPassword, on: self)
            .store(in: &cancellables)

        hasPassedAllValidation
            .receive(on: RunLoop.main)
            .assign(to: \.hasPassedValidation, on: self)
            .store(in: &cancellables)
    }
}

private extension SignupViewModel {

    var validateEmailId: AnyPublisher<Bool, Never> {
        $emailId
            .map { email in
                let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,100}")
                let value = emailPredicate.evaluate(with: email)
                return value
            }
            .eraseToAnyPublisher()
    }

    var validateName: AnyPublisher<Bool, Never> {
        $name
            .map { name in
                let namePredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z]{3,}")
                let value = namePredicate.evaluate(with: name)
                return value
            }
            .eraseToAnyPublisher()
    }

    var validatePassword: AnyPublisher<Bool, Never> {
        $password
            .map { password in
                let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$")
                let value = passwordPredicate.evaluate(with: password)
                return value
            }
            .eraseToAnyPublisher()
    }

    var hasPassedAllValidation: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest3(
            validateName,
            validateEmailId,
            validatePassword)
        .map { isNameValid, isEmailValid, isPasswordValid in
            return isNameValid && isEmailValid && isPasswordValid
        }
        .eraseToAnyPublisher()
    }
}