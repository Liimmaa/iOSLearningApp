//
//  TrendingNews.swift
//  iOSLearningApp
//
//  Created by Chioma Amanda Mmegwa  on 06/10/2022.
//

import SwiftUI

struct TrendingNews: View {
    var newsTitle: String
    var body: some View {
        trendingNewsList
    }
    var trendingNewsWidget: some View {
        VStack(
            alignment: .leading,
            spacing: 20
        ) {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.gray.opacity(0.3))
                .frame(width: 150, height: 40, alignment: Alignment.top)
                .overlay(Text("Trending News"))
                .padding(.bottom, 10)
                .font(.headline)
            NewsTitle(newsTitle: newsTitle, font: .system(size: 22, weight: .bold))
            HStack {
                Text("Learn More")
                Image(systemName: "arrow.right")
            }
            .font(.headline)
        }
        .padding()
        .foregroundColor(.white)
        .background(Image("warzone"))
        .cornerRadius(20)
    }
    var trendingNewsList: some View {
        GeometryReader { geo in
            ScrollView(
                .horizontal,
                showsIndicators: false
            ) {
                HStack(spacing: 20) {
                    ForEach(0..<10) {_ in
                        trendingNewsWidget
                            .frame(width: geo.size.width * 0.85)
                    }
                }
                .padding(.horizontal)
            }
        }
        .frame(height: 250)
    }
}

struct NewsTitle: View {
    var newsTitle: String
    var font: Font?
    var body: some View {
        Text(newsTitle)
            .font(font)
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.leading)
            .lineLimit(nil)
    }
}

struct TrendingNews_Previews: PreviewProvider {
    static var previews: some View {
        TrendingNews(newsTitle: "Russia Claims Nearly 1000 Ukrainians Have Surrendered to Azovstal")
    }
}
