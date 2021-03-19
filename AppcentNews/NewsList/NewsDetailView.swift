//
//  NewsDetailView.swift
//  AppcentNews
//
//  Created by Baturay Koç on 17.03.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsDetailView: View {
    
    @ObservedObject var favVM = FavoritesViewModel()
    
    var title = ""
    var description = ""
    var url = ""
    var image = ""
    var date = ""
    var author = ""
    
    @State private var showAlert: Bool = false
    
    init(favVM: FavoritesViewModel, title: String, description: String, url: String, image: String, date: String, author: String) {
        self.favVM = favVM
        self.title = title
        self.description = description
        self.url = url
        self.image = image
        self.date = date
        self.author = author
    }
    
    func dateFormat()  -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let stringToDate = dateFormatter.date(from: date)!
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "MM/dd/yyyy"
        let newDate = dateFormatter2.string(from: stringToDate)
        return newDate
    }
    
    var body: some View {
        GeometryReader {
            geometry in
            ZStack(alignment: .bottom){
                ScrollView{
                    VStack{
                        VStack{
                            if image != "" {
                                WebImage(url: URL(string: image)!, options: .highPriority, context: nil)
                                    .resizable()
                                    .frame(width: geometry.size.width * 0.95, height: geometry.size.height / 2.5)
                                    .cornerRadius(16)
                            }
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height / 2, alignment: .center)
                        .padding(.top, 8)

                        VStack(spacing: 4){
                            
                            Text(title)
                                .bold()
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            HStack(spacing: 64){
                                HStack{
                                    Image(systemName: "pencil.circle.fill")
                                    Text(author)
                                        .font(.footnote)
                                }
                                HStack{
                                    Image(systemName: "calendar.circle.fill")
                                    Text(dateFormat())
                                        .font(.footnote)
                                }
                            }.padding()
                            
                            Text(description)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                        }
                        .padding(.top, 16)
                        .padding(.horizontal, 16)
                        
                    }
                }
                NavigationLink(destination: NewsWebView(url: url)) {
                    ZStack {
                        Rectangle()
                            .fill(Color.black.opacity(0.9))
                            .frame(width: geometry.size.width * 0.7, height: 45)
                            .cornerRadius(8)
                        Text("News Source")
                            .font(.title3)
                            .bold()
                            .foregroundColor(.white)
                    }.padding(.bottom, 4)
                }
            }.alert(isPresented: $showAlert) {
                Alert(title: Text(favVM.alertText), dismissButton: .default(Text("Okay!")))
            }
            .navigationBarTitle(Text(title))
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        shareSheet(url: url)
                    }) {
                        Image(systemName: "square.and.arrow.up")
                    }

                    Button(action: {
                        if favVM.checkContains(url: url) == false {
                            favVM.addToFav(title: title, desc: description, url: url, image: image, date: date, author: author)
                            showAlert = true
                        } else {
                            favVM.removeFromFavs(title: title, desc: description, url: url, image: image, date: date, author: author)
                            showAlert = true
                        }
                    }) {
                        if favVM.checkContains(url: url) == false {
                            Image(systemName: "star")
                        } else {
                            Image(systemName: "star.fill")
                        }
                    }
                }
            }
        }
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView(favVM: FavoritesViewModel() ,title: "Title", description: "Desc", url: "https://www.journaldugeek.com/2021/03/17/nft-elon-musk-annule-lenchere-de-son-clip-musical/", image: "https://www.journaldugeek.com/content/uploads/2021/03/capture-decran-2021-03-16-091206.png", date: "17.03.2021", author: "Baturay")
    }
}
