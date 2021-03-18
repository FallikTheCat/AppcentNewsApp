//
//  NewsAPIGet.swift
//  AppcentNews
//
//  Created by Baturay Koç on 17.03.2021.
//

import SwiftUI
import SwiftyJSON

class NewsAPIGet: ObservableObject {
    
    @Published var newsData = [NewsDataModel]()
    @Published var searchKey = ""
    @Published var page = 1
    @Published var paginationActive = false
    
    init() {
        mainResults()
    }
    
    func mainResults() {
            
        let source = "http://newsapi.org/v2/top-headlines?country=us&category=business&page=\(page)&apiKey=45c2cab3da4a498b9c4c09e89ee180e2"
        
        let url = URL(string: source)!
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) { (data, _, error) in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            
            let json = try! JSON(data: data!)
            
            for i in json["articles"] {
                let title = i.1["title"].stringValue
                let description = i.1["description"].stringValue
                let url = i.1["url"].stringValue
                let image = i.1["urlToImage"].stringValue
                let date = i.1["publishedAt"].stringValue
                let author = i.1["author"].stringValue
                let id = i.1["publishedAt"].stringValue
                
                DispatchQueue.main.async {
                    self.newsData.append(NewsDataModel(id: id, newsTitle: title, newsDesc: description, newsUrl: url, newsImage: image, newsDate: date, newsAuthor: author))
                    if self.newsData.count >= 20 {
                        self.paginationActive = true
                    }
                }
            }
        }.resume()
    }
    
    func search() {
        
        if searchKey == "" {
            
            self.newsData = []
            
            mainResults()
            
        } else {
        
            self.newsData = []
            
            let source = "https://newsapi.org/v2/everything?q=\(searchKey)&page=\(page)&apiKey=45c2cab3da4a498b9c4c09e89ee180e2"
            
            let url = URL(string: source)!
            
            let session = URLSession(configuration: .default)
        
            session.dataTask(with: url) { (data, _, error) in
                if error != nil {
                    print((error?.localizedDescription)!)
                    return
                }
                
                let json = try! JSON(data: data!)
                
                for i in json["articles"] {
                    let title = i.1["title"].stringValue
                    let description = i.1["description"].stringValue
                    let url = i.1["url"].stringValue
                    let image = i.1["urlToImage"].stringValue
                    let date = i.1["publishedAt"].stringValue
                    let author = i.1["author"].stringValue
                    let id = i.1["publishedAt"].stringValue
                    
                    DispatchQueue.main.async {
                        self.newsData.append(NewsDataModel(id: id, newsTitle: title, newsDesc: description, newsUrl: url, newsImage: image, newsDate: date, newsAuthor: author))
                        if self.newsData.count >= 20 {
                            self.paginationActive = true
                        }
                    }
                }
            }.resume()
        }
    }
    
}
