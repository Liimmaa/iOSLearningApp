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
    var header: some View {
        NavigationBar(navigationTitle: "DETAIL", rightIcon1: "square.and.arrow.up", rightIcon2: "bookmark")
            .padding(.top, 25)
    }
    var newsDetail: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 25) {
                imageReader
                newsTitle
                newsOutlet
                newsSummary
            }
        }
    }
    var imageReader: some View {
        GeometryReader { geo in
            Image("warzone")
                .resizable()
                .scaledToFill()
                .frame(width: geo.size.width, height: geo.size.height)
                .cornerRadius(12)
        }
        .scaledToFill()
        .clipped()
    }
    var newsTitle: some View {
        NewsTitle(newsTitle: "Russia Claims Nearly 1,000 Ukrainians Have Surrendered At Azovstal",
                  font: .system(size: 22, weight: .semibold))
            .lineSpacing(10)
    }
    var newsOutlet: some View {
        NewsOutlet(newsOutlet: "BBC NEWS", readTime: "1 min read")
        .foregroundColor(.gray)
        .font(.system(size: 15, weight: .semibold))
    }
    var newsSummary: some View {
        Text("Our live coverage of the war in Ukraine has moved here. The Soviet victory flag from World War II is beginning to appear across occupied parts of ")
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
