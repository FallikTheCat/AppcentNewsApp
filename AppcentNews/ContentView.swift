//
//  ContentView.swift
//  AppcentNews
//
//  Created by Baturay Koç on 17.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var newsData = NewsAPIGet()
    
    @State private var selected = 0
    
    var body: some View {
        TabView(selection: $selected) {
            NewsListView(newsData: newsData)
                .tabItem {
                    if self.selected == 0 {
                        Image(systemName: "newspaper.fill")
                        Text("News")
                    }else {
                        Image(systemName: "newspaper")
                        Text("News")
                    }
                }.tag(0)
            FavoritesView()
                .tabItem {
                    if self.selected == 1 {
                        Image(systemName: "star.fill")
                        Text("Favorites")
                    }else {
                        Image(systemName: "star")
                        Text("Favorites")
                    }
                }.tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
