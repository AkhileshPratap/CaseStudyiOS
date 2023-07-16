//
//  NewsListView.swift
//  CaseStudyiOS
//
//  Created by AkhileshSingh on 16/07/23.
//

import SwiftUI
import Combine

struct NewsListView: View {
    //iSNKnWtdEJJgwP1l0dcYFXpz7fwhAS4J
    //    6sjYeLgyjZRG1uCL

    @ObservedObject var viewModel: NewsListViewModel

    init(viewModel: NewsListViewModel = NewsListViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
            Group {
                if viewModel.loadingStatus == .loading {
                    ActivityLoader()
                } else {
                    listBody
                }
            }
        .navigationTitle("News")
        .onAppear {
        }
    }

    var listBody: some View {
        List {
            Section(header: Text("Emailed")) {
                ForEach($viewModel.emailedResults) { item in
                    if let image = item.media.first?.mediaMetadata.first?.url {
                        NewsRowView(imageName: image, text: item.title)
                    }
                }
            }
            Section(header: Text("Shared")) {
                ForEach($viewModel.sharedResults) { item in
                    if let image = item.media.first?.mediaMetadata.first?.url {
                        NewsRowView(imageName: image, text: item.title)
                    }
                }
            }
            Section(header: Text("Viewed")) {
                ForEach($viewModel.viewedResults) { item in
                    if let image = item.media.first?.mediaMetadata.first?.url {
                        NewsRowView(imageName: image, text: item.title)
                    }
                }
            }
        }
        .listStyle(.insetGrouped)
        .refreshable {
            print("pulled to referesh")
            viewModel.downloadData()
            viewModel.loadingStatus = .loading
        }

    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
