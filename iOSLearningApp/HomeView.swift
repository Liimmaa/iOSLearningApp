//
//  ContentView.swift
//  iOSLearningApp
//
//  Created by Chioma Amanda Mmegwa  on 05/10/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            NavigationView {
                VStack(alignment: .leading) {
                    header
                    navigationLink
                    popularNewsHeader
                    popularNews
                }
                .navigationBarHidden(true)
                .ignoresSafeArea()
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            Text("Saved")
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("Saved")
                }
            Text("Profile")
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
    var header: some View {
        NavigationBar(navigationTitle: "NEWS", rightIcon1: "magnifyingglass", rightIcon2: "bell")
            .padding(.top, 40)
    }
    var navigationLink: some View {
        NavigationLink(destination: DetailView()) {
            trendingNews
        }
    }
    var trendingNews: some View {
        TrendingNews(newsTitle: "Russia Claims Nearly 1000 Ukrainians Have Surrendered to Azovstal")
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
                    newsOutlet: "By BBC News",
                    readTime: "1 min read")
        .background(Color(UIColor.systemGray6))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
