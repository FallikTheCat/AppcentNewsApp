//
//  NewsWebView.swift
//  AppcentNews
//
//  Created by Baturay Koç on 17.03.2021.
//

import SwiftUI

struct NewsWebView: View {
    
    var url = ""
    
    init(url: String) {
        self.url = url
    }
    
    var body: some View {
        NewsWebViewModel(url: url)
            .navigationBarTitle("News Source", displayMode: .inline)
    }
}

struct NewsWebView_Previews: PreviewProvider {
    static var previews: some View {
        NewsWebView(url: "https://www.journaldugeek.com/2021/03/17/nft-elon-musk-annule-lenchere-de-son-clip-musical/")
    }
}
