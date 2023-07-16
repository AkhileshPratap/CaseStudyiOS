//
//  CSButton.swift
//  CaseStudyiOS
//
//  Created by AkhileshSingh on 14/07/23.
//

import SwiftUI

struct CSButton: View {
    var title: LocalizedStringKey
    var action: (() -> Void)

    var body: some View {
        Button(action: action) {
            Spacer()
            Text(title)
                .font(.title)
                .padding(8)
                .foregroundColor(.white)
            Spacer()
        }
        .background(.blue)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding()
    }
}

struct CSButton_Previews: PreviewProvider {
    @State static var isEnable: Bool = false
    static var previews: some View {

        CSButton(title: "Button", action: {
            print("pressed")
        })
    }
}
