//
//  ContentView.swift
//  CaseStudyiOS
//
//  Created by AkhileshSingh on 14/07/23.
//

import SwiftUI

struct SignupView: View {
    @ObservedObject private var viewModel: SignupViewModel

    init(viewModel: SignupViewModel = SignupViewModel()) {
        self.viewModel = viewModel
    }

    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Spacer()
                CSTextField(placeholder: Constant.email,
                                enteredText: $viewModel.emailId,
                                showError: $viewModel.isValidEmail,
                                errorText: Validation.emailError)

                CSTextField(placeholder: Constant.name,
                                enteredText: $viewModel.name,
                                showError: $viewModel.isValidName,
                                errorText: Validation.nameError)

                CSTextField(placeholder: Constant.password,
                                enteredText: $viewModel.password,
                                showError: $viewModel.isValidPassword,
                            errorText: Validation.passwordError)

                Spacer()
                CSButton(title: Constant.createAccount) {
                    viewModel.validatePage()
                    path.append("News")
                }
                .navigationDestination(for: String.self) { view in
                    if view == "News" {
                        NewsListView()
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .navigationTitle(Constant.signup)

        }

    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
