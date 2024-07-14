//
//  NewsListView.swift
//  CaseStudyiOS
//
//  Created by AkhileshSingh on 16/07/23.
//

import SwiftUI
import Combine

struct NewsListView: View {
    @ObservedObject var viewModel: NewsListViewModel

    init(viewModel: NewsListViewModel = NewsListViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
            Group {
                if viewModel.loadingStatus == .loading {
                    CSActivityLoader()
                } else {
                    newsList
                }
            }
            .navigationTitle(Constant.news)
        .onAppear {
        }
    }

    var newsList: some View {
        List {
            if !$viewModel.emailedResults.isEmpty {
                Section(header: Text(Constant.emailed)) {
                    ForEach($viewModel.emailedResults) { item in
                        if let image = item.media.first?.mediaMetadata.first?.url {
                            NewsRowView(imageName: image, text: item.title)
                        }
                    }
                }
            }
            if !$viewModel.sharedResults.isEmpty {
                Section(header: Text(Constant.shared)) {
                    ForEach($viewModel.sharedResults) { item in
                        if let image = item.media.first?.mediaMetadata.first?.url {
                            NewsRowView(imageName: image, text: item.title)
                        }
                    }
                }
            }

            if !$viewModel.viewedResults.isEmpty {
                Section(header: Text(Constant.viewed)) {
                    ForEach($viewModel.viewedResults) { item in
                        if let image = item.media.first?.mediaMetadata.first?.url {
                            NewsRowView(imageName: image, text: item.title)
                        }
                    }
                }
            }
        }
        .listStyle(.insetGrouped)
        .refreshable {
            viewModel.downloadData()
        }

    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
