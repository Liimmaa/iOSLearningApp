//
//  SearchView.swift
//  iOSLearningApp
//
//  Created by Chioma Amanda Mmegwa  on 09/10/2022.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = Constants.placeholder
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            header
            searchBar
                .padding()
            ScrollView(.horizontal, showsIndicators: false) {
            searchOptionsView
            }
            popularNewsHeader
            popularNews
        }
    }
    private var header: some View {
        NavigationBar(navigationTitle:
                        Constants.navNewsTitle,
                      rightIcon2:
                        Constants.Image.navRightNotificationIcon)
    }
    private var popularNewsHeader: some View {
        HStack {
            Text(Constants.popularNews)
            Spacer()
            Text(Constants.popularNewsSubtitle)
                .foregroundColor(.gray)
        }
        .font(.headline)
        .padding()
    }
    private var popularNews: some View {
        PopularNews(newsImage:
                        R.image.people()!,
                    newsTitle: Constants.popularNewsTitle,
                    newsOutlet:
                        Constants.popularNewsOutlet)
        .background(Color(UIColor.systemGray6))
    }
    private var searchBar: some View {
        HStack {
            Image(uiImage: Constants.Image.tabSearch).foregroundColor(.gray)
            TextField(Constants.tabTitleSearch,
                      text: $searchText)
                .font(Font.system(size: 21))
        }
        .padding(15)
        .background(Color(UIColor.systemGray5))
        .cornerRadius(10)
    }
    private var searchOptionsView: some View {
            HStack(spacing: 20) {
                ForEach(0..<5) {_ in
                    RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(Color.gray, lineWidth: 1)
                        .frame(width: 130, height: 55)
                        .overlay(Text(Constants.searchOption))
                        .font(.body)
                }
            }
            .padding()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
