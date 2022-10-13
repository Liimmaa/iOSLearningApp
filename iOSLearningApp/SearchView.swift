//
//  SearchView.swift
//  iOSLearningApp
//
//  Created by Chioma Amanda Mmegwa  on 09/10/2022.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            header
            searchBar
                .padding()
            searchOptionsView
            popularNewsHeader
            popularNews
        }
    }
    var header: some View {
        NavigationBar(navigationTitle: "NEWS", rightIcon2: "bell")
    }
    var popularNewsHeader: some View {
        HStack {
            Text("Popular News")
            Spacer()
            Text("Show More")
                .foregroundColor(.gray)
        }
        .font(.headline)
        .padding()
    }
    var popularNews: some View {
        PopularNews(newsImage: "people",
                    newsTitle: "The 'Lucky Country' is Facing A Crucial Test",
                    newsOutlet: "By BBC News")
        .background(Color(UIColor.systemGray6))
    }
    var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass").foregroundColor(.gray)
            TextField("Search", text: $searchText)
                .font(Font.system(size: 21))
        }
        .padding(15)
        .background(Color(UIColor.systemGray5))
        .cornerRadius(10)
    }
    var searchOptionsView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(0..<5) {_ in
                    RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(Color.gray, lineWidth: 1)
                        .frame(width: 130, height: 55)
                        .overlay(Text("All"))
                        .font(.body)
                }
            }
            .padding()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
