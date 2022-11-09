//
//  NavigationBar.swift
//  iOSLearningApp
//
//  Created by Chioma Amanda Mmegwa  on 11/10/2022.
//

import SwiftUI

struct NavigationBar: View {
    var navigationTitle: String
    var rightIcon1: UIImage?
    var rightIcon2: UIImage?
    var body: some View {
        HStack {
            HStack {
                Image(uiImage: Constants.Image.navBarMoreIcon)
                Text(navigationTitle)
            }
            .font(.system(size: 20, weight: .bold))
            Spacer()
            HStack(spacing: 20) {
                if let rightIcon1 = rightIcon1 {
                    Image(uiImage: rightIcon1)
                }
                if let rightIcon2 = rightIcon2 {
                    Image(uiImage: rightIcon2)
                }
            }
            .font(.system(size: 25))
        }
        .padding()
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(navigationTitle:
                        Constants.navNewsTitle,
                      rightIcon1:
                        Constants.Image.navRightSearchIcon,
                      rightIcon2:
                        Constants.Image.navRightNotificationIcon)
    }
}
