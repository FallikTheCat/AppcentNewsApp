//
//  AddToFavorites.swift
//  AppcentNews
//
//  Created by Baturay Koç on 17.03.2021.
//

import SwiftUI

class FavoritesViewModel {
    
    @AppStorage("favorites", store: UserDefaults(suiteName: "group.com.FallikTheCat.AppcentNews"))
    var favorites: Data = Data()
    
    func addToFav(title: String, desc: String, url: String, image: String, date: String, author: String) {
        
        guard let decodeData = try? JSONDecoder().decode([NewsDataModel].self, from: favorites)
        else {
            var dataArray: [NewsDataModel] = []
            
            let data = NewsDataModel(id: date, newsTitle: title, newsDesc: desc, newsUrl: url, newsImage: image, newsDate: date, newsAuthor: author)
            dataArray.append(data)
            guard let favData = try? JSONEncoder().encode(data) else {print("encode"); return}
            self.favorites = favData
            print("\(data) ama elsete")
            return
        }
        var dataArray: [NewsDataModel] = decodeData
        
        let data = NewsDataModel(id: date, newsTitle: title, newsDesc: desc, newsUrl: url, newsImage: image, newsDate: date, newsAuthor: author)
        dataArray.append(data)
        guard let favData = try? JSONEncoder().encode(data) else {print("encode"); return}
        self.favorites = favData
        print("\(data)")
    }
    
    func encodeFav() -> [NewsDataModel] {
        guard let decodeData = try? JSONDecoder().decode([NewsDataModel].self, from: favorites) else {
            print("sıkıntı")
            let dataArray: [NewsDataModel] = []
            return dataArray
        }
        let dataArray: [NewsDataModel] = decodeData
        return dataArray
    }
}
