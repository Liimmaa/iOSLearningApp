//
//  PopularNews.swift
//  iOSLearningApp
//
//  Created by Chioma Amanda Mmegwa  on 06/10/2022.
//

import SwiftUI

struct PopularNews: View {
    var newsImage: String
    var newsTitle: String
    var newsOutlet: String
    var readTime: String?
    var body: some View {
        ScrollView {
            ForEach(0..<10) {_ in
                popularNewsWidget
            }
        }
    }
    var popularNewsWidget: some View {
        VStack(spacing: 20) {
            HStack {
                Image(newsImage)
                    .resizable()
                    .frame(width: 80, height: 80, alignment: .leading)
                    .scaledToFit()
                    .cornerRadius(10.0)
                newsTitleRow
            }
            .padding(10)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.horizontal)
        }
    }
    var newsTitleRow: some View {
        VStack(alignment: .leading, spacing: 20) {
            NewsTitle(newsTitle: newsTitle, font: .system(size: 18, weight: .semibold))
            NewsOutlet(newsOutlet: newsOutlet, readTime: readTime)
            .foregroundColor(.gray)
            .font(.system(size: 15, weight: .semibold))
        }
        .padding()
    }
}

struct NewsOutlet: View {
    var newsOutlet: String
    var readTime: String?
    var body: some View {
        HStack {
            Text("By \(newsOutlet)")
            Spacer()
            if let readTime = readTime {
                Text(readTime)
            }
        }
    }
}

struct PopularNews_Previews: PreviewProvider {
    static var previews: some View {
        PopularNews(newsImage: "people",
                    newsTitle: "The 'Lucky Country' is Facing A Crucial Test",
                    newsOutlet: "By BBC News",
                    readTime: "1 min read")
    }
}
