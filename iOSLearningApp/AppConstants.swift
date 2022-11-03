//
//  AppConstants.swift
//  iOSLearningApp
//
//  Created by Chioma Amanda Mmegwa  on 15/10/2022.
//

import Foundation
import UIKit

struct Constants {
        static let tabTitleHome = "Home"
        static let tabTitleSearch = "Search"
        static let tabTitleSaved = "Saved"
        static let tabTitleProfile = "Profile"
        static let navNewsTitle = "NEWS"
        static let navDetailTitle = "DETAIL"
        static let trendingNews = "Trending News"
        static let trendingNewsTitle = "Russia Claims Nearly 1000 Ukrainians Have Surrendered to Azovstal"
        static let popularNews = "Popular News"
        static let popularNewsSubtitle = "Show More"
        static let popularNewsTitle = "The 'Lucky Country' is Facing A Crucial Test"
        static let popularNewsOutlet = "BBC News"
        static let popularNewsReadTime = "1 min read"
        static let learnMore = "Learn More"
        static let newsContent = "Our live coverage of the war in Ukraine has moved here. The Soviet victory flag from World War II is beginning to appear across occupied parts of "
        static let searchOption = "All"
        static let placeholder = ""

    struct Image {
        static let tabHome = UIImage(systemName: "house")!
        static let tabSearch = UIImage(systemName: "magnifyingglass")!
        static let tabSaved = UIImage(systemName: "bookmark")!
        static let tabProfile = UIImage(systemName: "person")!
        static let rightArrow = UIImage(systemName: "arrow.right")!
        static let navBarMoreIcon = UIImage(systemName: "line.3.horizontal.decrease")!
        static let navRightSearchIcon = UIImage(systemName: "magnifyingglass")!
        static let navRightNotificationIcon = UIImage(systemName: "bell")!
        static let navRightSaveIcon = UIImage(systemName: "square.and.arrow.up")!
        static let navRightBookmarkIcon = UIImage(systemName: "bookmark")!
    }
}

extension UIColor {
    static func rgba(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}
