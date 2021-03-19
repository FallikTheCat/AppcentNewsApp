//
//  AddToFavorites.swift
//  AppcentNews
//
//  Created by Baturay Koç on 17.03.2021.
//

import SwiftUI

class FavoritesViewModel: ObservableObject {
    
    @AppStorage("favorites") var favorites: Data = Data()
    
    @Published var favoritesData: [NewsDataModel] = []
    @Published var alertText: String = ""
    
    init() {
        getFavs()
    }
    
    func addToFav(title: String, desc: String, url: String, image: String, date: String, author: String) {
        
        guard let decodeData = try? JSONDecoder().decode([NewsDataModel].self, from: favorites)
        else {
            let dataArray: [NewsDataModel] = []
            guard let favData = try? JSONEncoder().encode(dataArray) else {
                alertText = "There has been an error while trying to add this news to favorites :("
                return
            }
            self.favorites = favData
            addToFav(title: title, desc: desc, url: url, image: image, date: date, author: author)
            return
        }
        
        var dataArray: [NewsDataModel] = decodeData
        
        let data = NewsDataModel(id: date, newsTitle: title, newsDesc: desc, newsUrl: url, newsImage: image, newsDate: date, newsAuthor: author)
        dataArray.append(data)
        guard let favData = try? JSONEncoder().encode(dataArray) else {
            alertText = "There has been an error while trying to add this news to favorites :("
            return
        }
        self.favorites = favData
        alertText = "Successfully added to favorites!"
        getFavs()
    }
    
    func getFavs() {
        guard let decodeData = try? JSONDecoder().decode([NewsDataModel].self, from: favorites) else {
            let dataArray: [NewsDataModel] = []
            favoritesData = dataArray
            return
        }
        let dataArray: [NewsDataModel] = decodeData
        favoritesData = dataArray
    }
    
    func checkContains(url: String) -> Bool {
        guard let decodeData = try? JSONDecoder().decode([NewsDataModel].self, from: favorites) else {
            return false
        }
        
        let dataArray: [NewsDataModel] = decodeData
        var contains = false
        for i in dataArray  {
            if i.newsUrl.contains(url) {
                contains = true
            }
        }
        return contains
    }
    
    func removeFromFavs(title: String, desc: String, url: String, image: String, date: String, author: String) {
        
        guard let decodeData = try? JSONDecoder().decode([NewsDataModel].self, from: favorites) else {
            alertText = "There has been an error while trying to remove this news from favorites :("
            return
        }
        
        var dataArray: [NewsDataModel] = decodeData
        let indexOfNews = dataArray.firstIndex(of: NewsDataModel(id: date, newsTitle: title, newsDesc: desc, newsUrl: url, newsImage: image, newsDate: date, newsAuthor: author))!
        dataArray.remove(at: indexOfNews)
        guard let favData = try? JSONEncoder().encode(dataArray) else {
            alertText = "There has been an error while trying to remove this news from favorites :("
            return
        }
        self.favorites = favData
        alertText = "Successfully removed from favorites!"
        getFavs()
        
    }
}
