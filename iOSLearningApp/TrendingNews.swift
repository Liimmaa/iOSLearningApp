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
        trendingNewsWidget
    }
    private var trendingNewsWidget: some View {
        VStack(
            alignment: .leading,
            spacing: 20
        ) {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.gray.opacity(0.3))
                .frame(width: 150, height: 40, alignment: Alignment.top)
                .overlay(Text(Constants.trendingNews))
                .padding(.bottom, 10)
                .font(.headline)
            NewsTitle(newsTitle: newsTitle,
                      font: .system(size: 22, weight: .bold))
            HStack(alignment: .center) {
                Spacer()
                Text(Constants.learnMore)
                Image(systemName: Constants.Image.rightArrow)
                    .foregroundColor(Color.white)
            }
            .font(.headline)
        }
        .padding()
        .foregroundColor(.white)
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
            .lineLimit(2)
    }
}

struct TrendingNews_Previews: PreviewProvider {
    static var previews: some View {
        TrendingNews(newsTitle: Constants.trendingNewsTitle)
    }
}
