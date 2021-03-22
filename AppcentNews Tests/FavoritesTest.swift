//
//  FavoritesAddTest.swift
//  AppcentNews Tests
//
//  Created by Baturay Koç on 22.03.2021.
//

import XCTest
@testable import AppcentNews

class FavoritesTest: XCTestCase {
    var favorites: FavoritesViewModel!
    
    override func setUp() {
        favorites = .init()
    }
    
    func test_add_fav() {
        favorites.addToFav(title: "Title", desc: "Desc", url: "https://www.journaldugeek.com/2021/03/17/nft-elon-musk-annule-lenchere-de-son-clip-musical/", image: "https://www.journaldugeek.com/content/uploads/2021/03/capture-decran-2021-03-16-091206.png", date: "22.03.2021", author: "Baturay")
        
        XCTAssertEqual(favorites.alertText, "Successfully added to favorites!")
        
    }
    
    func test_remove_fav() {
        favorites.removeFromFavs(title: "Title", desc: "Desc", url: "https://www.journaldugeek.com/2021/03/17/nft-elon-musk-annule-lenchere-de-son-clip-musical/", image: "https://www.journaldugeek.com/content/uploads/2021/03/capture-decran-2021-03-16-091206.png", date: "22.03.2021", author: "Baturay")
        
        XCTAssertEqual(favorites.alertText, "Successfully removed from favorites!")
    }
    
}
