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
                homeContent
            }
            .tabItem {
                Image(uiImage: Constants.Image.tabHome)
                Text(Constants.tabTitleHome)
            }
            SearchView()
                .tabItem {
                    Image(uiImage: Constants.Image.tabSearch)
                    Text(Constants.tabTitleSearch)
                }
            Text(Constants.placeholder)
                .tabItem {
                    Image(uiImage: Constants.Image.tabSaved)
                    Text(Constants.tabTitleSaved)
                }
            Text(Constants.placeholder)
                .tabItem {
                    Image(uiImage: Constants.Image.tabProfile)
                    Text(Constants.tabTitleProfile)
                }
        }
    }
    private var header: some View {
        NavigationBar(navigationTitle:
                        Constants.navNewsTitle,
                      rightIcon1:
                        Constants.Image.navRightSearchIcon,
                      rightIcon2:
                        Constants.Image.navRightNotificationIcon)
            .padding(.top, 40)
    }
    private var homeContent: some View {
        VStack(alignment: .leading) {
            header
            navigationLink
            popularNewsHeader
            popularNews
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
    private var navigationLink: some View {
        NavigationLink(destination: DetailView()) {
            trendingNews
        }
    }
    private var trendingNews: some View {
        TrendingNews(newsTitle: Constants.trendingNewsTitle)
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
                    newsTitle:
                        Constants.popularNewsTitle,
                    newsOutlet:
                        Constants.popularNewsOutlet)
        .background(Color(UIColor.systemGray6))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
