//
//  CustomTextField.swift
//  CaseStudyiOS
//
//  Created by AkhileshSingh on 14/07/23.
//

import SwiftUI

struct CSTextField: View {
    @State var placeholder: String
    @Binding var enteredText: String
    @Binding var showError: Bool
    @State var errorText: String

    var body: some View {

        VStack {
            TextField(placeholder, text: $enteredText)
                .foregroundColor(.black)
                .font(.title2)
                .frame(maxWidth: .infinity)
                .autocapitalization(.none)
            if !showError {
                Text(errorText)
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.footnote)
            }
            Divider().background(Color.black)
        }

    }
}

struct CSTextField_Previews: PreviewProvider {
    @State static var value: String = ""
    @State static var show: Bool = false
    @State static var error: String = ""
    static var previews: some View {

        CSTextField(placeholder: "Name", enteredText: $value, showError: $show, errorText: error)
            .background(Color.orange)
    }
}
