//
//  NavigationBar.swift
//  iOSLearningApp
//
//  Created by Chioma Amanda Mmegwa  on 11/10/2022.
//

import SwiftUI

struct NavigationBar: View {
    var navigationTitle: String
    var rightIcon1: String?
    var rightIcon2: String?
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "line.3.horizontal.decrease")
                Text(navigationTitle)
            }
            .font(.system(size: 20, weight: .bold))
            Spacer()
            HStack(spacing: 20) {
                if let rightIcon1 = rightIcon1 {
                    Image(systemName: rightIcon1)
                }
                if let rightIcon2 = rightIcon2 {
                    Image(systemName: rightIcon2)
                }
            }
            .font(.system(size: 25))
        }
        .padding()
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(navigationTitle: "NEWS", rightIcon1: "magnifyingglass", rightIcon2: "bell")
    }
}
