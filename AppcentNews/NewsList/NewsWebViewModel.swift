//
//  NewsWebViewModel.swift
//  AppcentNews
//
//  Created by Baturay Koç on 17.03.2021.
//

import SwiftUI
import WebKit

struct NewsWebViewModel: UIViewRepresentable {
    
    var url: String
    
    func makeUIView(context: UIViewRepresentableContext<NewsWebViewModel>) -> WKWebView {
        
        let view = WKWebView()
        view.load(URLRequest(url: URL(string: url)!))
        return view
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<NewsWebViewModel>) {
        
    }
}
