//
//  TabBarView.swift
//  CombineUIKitSwiftUI
//
//  Created by KOSIGN on 29/11/23.
//

import SwiftUI

struct TabBarView: View {
    weak var navigationController: UINavigationController?
    
    @State private var selection : String = "home"
    
    var body: some View {
        TabView(selection: $selection) {
            Color.red
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Color.blue
              .tabItem {
                Image(systemName: "heart")
                Text("Favorite")
              }

            Color.orange
              .tabItem {
                Image(systemName: "person")
                Text("Profile")
              }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
