//
//  ContentView.swift
//  iOSLearningApp
//
//  Created by Chioma Amanda Mmegwa  on 05/10/2022.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = NewsListViewModel(networkManager: NetworkManager())
    var body: some View {
        TabView {
            NavigationView {
                switch viewModel.state {
                case .loading:
                    Text(Constants.loading)
                case .results:
                     homeContent
                case .error:
                    Text(viewModel.stateError?.localizedDescription ?? Constants.oops)
                case .empty:
                    Text(Constants.noResults)
                default:
                    Text(Constants.holdOn)
                }
            }
            .onAppear {
                viewModel.send(event: .onAppear)
            }
            .tabItem {
                Image(systemName: Constants.Image.tabHome)
                Text(Constants.tabTitleHome)
            }
            Text(Constants.placeholder)
                .tabItem {
                    Image(systemName: Constants.Image.tabSearch)
                    Text(Constants.tabTitleSearch)
                }
            Text(Constants.placeholder)
                .tabItem {
                    Image(systemName: Constants.Image.tabSaved)
                    Text(Constants.tabTitleSaved)
                }
            Text(Constants.placeholder)
                .tabItem {
                    Image(systemName: Constants.Image.tabProfile)
                    Text(Constants.tabTitleProfile)
                }
        }
    }
    private var homeContent: some View {
        VStack(alignment: .leading) {
            header
            Spacer()
            trendingNewsList
            popularNewsHeader
            popularNews
                .padding(.top, 10)
                .background(Color(UIColor.systemGray6))
            Spacer()
        }
        .ignoresSafeArea()
    }
    private var header: some View {
        NavigationBar(navigationTitle:
                        Constants.navNewsTitle,
                      leftIcon: Constants.Image.navBarMoreIcon,
                      rightIcon1:
                        Constants.empty,
                      rightIcon2:
                        Constants.empty)
            .padding(.top, 40)
    }

    private var trendingNewsList: some View {
        GeometryReader { geo in
            ScrollView(
                .horizontal,
                showsIndicators: false
            ) {
                HStack(spacing: 20) {
                    ForEach(viewModel.news.trendingNews) { news in
                        NavigationLink(destination: DetailView(news: news)) {
                        TrendingNews(newsTitle: news.title)
                            .frame(width: geo.size.width * 0.85)
                            .background(AsyncImage(url: URL(string: news.image)) { image in
                                image
                                    .resizable()
                            } placeholder: {
                                Color.gray
                                ProgressView()
                            })
                            .cornerRadius(20)
                    }
                    }
                }
                .padding(.horizontal)
            }
        }
        .frame(height: 195)
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
        ScrollView {
            ForEach(viewModel.news.popularNews) { popular in
                NavigationLink(destination: DetailView(news: popular)) {
                    PopularNews(newsImage:
                                    popular.image,
                                newsTitle:
                                    popular.title,
                                newsOutlet:
                                    popular.source.name)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
