//
//  FavoritesView.swift
//  AppcentNews
//
//  Created by Baturay Koç on 17.03.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavoritesView: View {
    
    @ObservedObject var favVM: FavoritesViewModel
    
    var body: some View {
        NavigationView {
            VStack{
                
                if favVM.favoritesData == [] {
                    
                    Text("To see the favorite news, add it to the favorites of the news you selected from the news detail page.").padding(.horizontal, 16)
                    
                } else {
                    
                    List(favVM.favoritesData) { i in
                        NavigationLink(destination: NewsDetailView(favVM: favVM, title: i.newsTitle, description: i.newsDesc, url: i.newsUrl, image: i.newsImage, date: i.newsDate, author: i.newsAuthor)) {
                            HStack(spacing: 16){

                                VStack(alignment: .leading, spacing: 4){
                                    Text(i.newsTitle).bold().lineLimit(2)
                                    Text(i.newsDesc).lineLimit(2)
                                }

                                if i.newsImage != "" {
                                    WebImage(url: URL(string: i.newsImage)!, options: .highPriority, context: nil).resizable().frame(width: 75, height: 75).cornerRadius(16)
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
        FavoritesView(favVM: FavoritesViewModel())
    }
}
