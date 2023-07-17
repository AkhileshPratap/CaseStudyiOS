//
//  StringConstants.swift
//  CaseStudyiOS
//
//  Created by AkhileshSingh on 16/07/23.
//

import Foundation
import SwiftUI

struct Validation {
    static let emailError = String(localized: "email_validation_error", comment: "email error")
    static let nameError = String(localized: "name_validation_error", comment: "name error")
    static let passwordError = String(localized: "password_validation_error", comment: "password error")
}

struct Constant {
    static let email = String(localized: "email", comment: "email")
    static let name = String(localized: "name", comment: "name")
    static let password = String(localized: "password", comment: "password")
    static let createAccount = String(localized: "create_account", comment: "create account")
    static let signup = String(localized: "signup_title", comment: "signup")

    static let emailed = String(localized: "emailed", comment: "emailed")
    static let shared = String(localized: "shared", comment: "shared")
    static let viewed = String(localized: "viewed", comment: "viewed")

    static let news = String(localized: "news_title", comment: "news")
}

struct RegexConstant {
    static let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,100}"
    static let name = "[A-Z0-9a-z]{3,}"
    static let password = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$"
}

struct SavedKeys {
    static let key = "cMVrJ0PoXFdIZPKDPI4xsxjmUILRqnaY"
}

struct BaseURL {
    static let news = "api.nytimes.com"
}
