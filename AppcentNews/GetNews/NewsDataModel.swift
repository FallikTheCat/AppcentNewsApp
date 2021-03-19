//
//  NewsDataModel.swift
//  AppcentNews
//
//  Created by Baturay Koç on 17.03.2021.
//

import SwiftUI

struct NewsDataModel: Identifiable, Codable, Equatable {
    var id: String
    var newsTitle: String
    var newsDesc: String
    var newsUrl: String
    var newsImage: String
    var newsDate: String
    var newsAuthor: String
}
