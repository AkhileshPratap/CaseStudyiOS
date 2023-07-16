//
//  ActivityLoader.swift
//  CaseStudyiOS
//
//  Created by AkhileshSingh on 17/07/23.
//

import SwiftUI

struct ActivityLoader: View {
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
        }
    }
}

struct ActivityLoader_Previews: PreviewProvider {
    static var previews: some View {
        ActivityLoader()
    }
}
