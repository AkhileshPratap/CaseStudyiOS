//
//  NewsRowView.swift
//  CaseStudyiOS
//
//  Created by AkhileshSingh on 16/07/23.
//

import SwiftUI

struct NewsRowView: View {
    @Binding var imageName: String
    @Binding var text: String

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: imageName)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            Text(text)

        }
    }
}

struct NewsRowView_Previews: PreviewProvider {
    @State static var cimage = ""
    @State static var ctext = ""
    static var previews: some View {
        NewsRowView(imageName: $cimage, text: $ctext)
    }
}
