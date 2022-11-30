//
//  DetailView.swift
//  iOSLearningApp
//
//  Created by Chioma Amanda Mmegwa  on 09/10/2022.
//

import SwiftUI

struct DetailView: View {
    var news: News
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
            newsDetail
                .padding()
                .navigationBarTitleDisplayMode(.inline)
                .edgesIgnoringSafeArea(.bottom)
                .navigationBarBackButtonHidden(true)
                        .navigationBarItems(leading:
                            Button(action: {
                                self.presentationMode.wrappedValue.dismiss()
                            }) {
                                HStack {
                                    Image(systemName: Constants.Image.backArrow)
                                    Text(Constants.navDetailTitle)
                                }
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .bold))
                        })
    }

    private var newsDetail: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 25) {
                imageReader
                newsTitle
                newsOutlet
                newsSummary
            }
        }
    }

    private var imageReader: some View {
        GeometryReader { geo in
            AsyncImage(url: URL(string: news.image)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width, height: geo.size.height)
                        .cornerRadius(12)
            } placeholder: {
                ProgressView()
                    .padding(.leading, 30)
                    .tint(.red)
            }
        }
        .frame(height: 330)
    }

    private var newsTitle: some View {
        NewsTitle(newsTitle: news.title,
                  font: .system(size: 22, weight: .semibold))
            .lineSpacing(10)
    }

    private var newsOutlet: some View {
        NewsOutlet(newsOutlet: news.source.name,
                   readTime: Constants.popularNewsReadTime)
        .foregroundColor(.gray)
        .font(.system(size: 15, weight: .semibold))
    }

    private var newsSummary: some View {
        Text(news.content)
            .lineSpacing(10)
            .foregroundColor(Color(UIColor.gray))
            .font(.system(size: 18, weight: .medium))
    }
}
