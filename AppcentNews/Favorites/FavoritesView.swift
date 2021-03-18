//
//  FavoritesView.swift
//  AppcentNews
//
//  Created by Baturay Koç on 17.03.2021.
//

import SwiftUI

struct FavoritesView: View {
    
    var favoritesData: [NewsDataModel] = FavoritesViewModel().encodeFav()
    
    //init()
    
    var body: some View {
        NavigationView {
            VStack{
                List {
                    ForEach(favoritesData.indices, id: \.self) { i in
                        NavigationLink(destination: NewsDetailView(title: favoritesData[i].newsTitle, description: favoritesData[i].newsDesc, url: favoritesData[i].newsUrl, image: favoritesData[i].newsImage, date: favoritesData[i].newsDate, author: favoritesData[i].newsAuthor)) {
                            HStack{
                                
                                VStack(spacing: 4){
                                    Text("\(favoritesData[i].newsTitle)").bold().frame(maxWidth: .infinity, alignment: .leading)
                                    Text("\(favoritesData[i].newsDesc)").frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Favorites"))
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
