//
//  ActivityLoader.swift
//  CaseStudyiOS
//
//  Created by AkhileshSingh on 17/07/23.
//

import SwiftUI

struct CSActivityLoader: View {
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
        }
    }
}

struct CSActivityLoader_Previews: PreviewProvider {
    static var previews: some View {
        CSActivityLoader()
    }
}
