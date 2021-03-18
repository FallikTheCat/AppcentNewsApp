//
//  NewsListView.swift
//  AppcentNews
//
//  Created by Baturay Koç on 17.03.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsListView: View {
    
    @ObservedObject var newsData: NewsAPIGet
    
    var body: some View {
        GeometryReader{
            geometry in
            NavigationView {
                VStack{
                    
                    ZStack{
                        Rectangle()
                            .fill(Color.gray.opacity(0.5))
                            .frame(width: geometry.size.width * 0.95, height: 35)
                            .cornerRadius(8)
                        HStack{
                            Image(systemName: "magnifyingglass")
                            TextField("Search For Anything", text: $newsData.searchKey)
                                .frame(maxWidth: .infinity)
                            Spacer()
                            if newsData.searchKey != "" {
                                Button(action: {
                                    newsData.paginationActive = false
                                    newsData.page = 1
                                    newsData.searchKey = ""
                                    newsData.mainResults()
                                }) {
                                    Image(systemName: "x.circle.fill").foregroundColor(.black)
                                }
                            }
                        }
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                    }.onChange(of: newsData.searchKey, perform: { value in
                        newsData.page = 1
                        newsData.paginationActive = false
                        newsData.search()
                    })
                    
                    List(newsData.newsData) { i in
                        NavigationLink(destination: NewsDetailView(title: i.newsTitle, description: i.newsDesc, url: i.newsUrl, image: i.newsImage, date: i.newsDate, author: i.newsAuthor)) {
                            HStack(spacing: 16){
                                
                                VStack(alignment: .leading, spacing: 4){
                                    Text(i.newsTitle).bold().lineLimit(2)
                                    Text(i.newsDesc).lineLimit(2)
                                }
                                
                                if i.newsImage != "" {
                                    WebImage(url: URL(string: i.newsImage)!, options: .highPriority, context: nil).resizable().frame(width: 75, height: 75).cornerRadius(16)
                                }
                            }.onAppear {
                                if i.newsTitle == newsData.newsData.last?.newsTitle && newsData.page < 2 && newsData.paginationActive == true {
                                    newsData.page += 1
                                    newsData.mainResults()
                                }
                        }
                        }
                    }
                    
                }
                .navigationBarTitle(Text("News"))
            }
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView(newsData: NewsAPIGet())
    }
}
