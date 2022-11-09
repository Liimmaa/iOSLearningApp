//
//  DetailView.swift
//  iOSLearningApp
//
//  Created by Chioma Amanda Mmegwa  on 09/10/2022.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        VStack {
            header
            newsDetail
        }
        .padding()
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
    private var header: some View {
        NavigationBar(navigationTitle:
                        Constants.navDetailTitle,
                      rightIcon1:
                        Constants.Image.navRightSaveIcon,
                      rightIcon2:
                        Constants.Image.navRightBookmarkIcon)
            .padding(.top, 25)
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
            Image(uiImage: R.image.warzone()!)
                .resizable()
                .scaledToFill()
                .frame(width: geo.size.width, height: geo.size.height)
                .cornerRadius(12)
        }
        .scaledToFill()
        .clipped()
    }
    private var newsTitle: some View {
        NewsTitle(newsTitle: Constants.trendingNewsTitle,
                  font: .system(size: 22, weight: .semibold))
            .lineSpacing(10)
    }
    private var newsOutlet: some View {
        NewsOutlet(newsOutlet: Constants.popularNewsOutlet,
                   readTime: Constants.popularNewsReadTime)
        .foregroundColor(.gray)
        .font(.system(size: 15, weight: .semibold))
    }
    private var newsSummary: some View {
        Text(Constants.newsContent)
            .lineSpacing(10)
            .foregroundColor(Color(UIColor.gray))
            .font(.system(size: 18, weight: .medium))
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
