//
//  CSTextFieldModifier.swift
//  CaseStudyiOS
//
//  Created by AkhileshSingh on 14/07/23.
//

import SwiftUI

struct CSTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.gray)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
//            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 10)
//            .padding()
    }
}
