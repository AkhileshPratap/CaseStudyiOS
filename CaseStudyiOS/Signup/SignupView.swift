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

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                CSTextField(placeholder: "Email",
                                enteredText: $viewModel.emailId,
                                showError: $viewModel.isValidEmail,
                                errorText: "Enter valid email id")

                CSTextField(placeholder: "Name",
                                enteredText: $viewModel.name,
                                showError: $viewModel.isValidName,
                                errorText: "Enter valid name")

                CSTextField(placeholder: "Password",
                                enteredText: $viewModel.password,
                                showError: $viewModel.isValidPassword,
                                errorText: "Enter valid password")

                Spacer()
                CSButton(title: "Create Account") {
                    viewModel.validatePage()
                    print("button pressed")
                }
                
            }
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .navigationTitle("Signup")

        }

    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
