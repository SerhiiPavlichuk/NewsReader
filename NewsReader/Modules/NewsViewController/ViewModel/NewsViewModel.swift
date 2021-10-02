//
//  NewsViewModel.swift
//  NewsReader
//
//  Created by admin on 01.10.2021.
//

import Foundation

class NewsViewModel {
    
    var news: [News] = []
//    var newsforRealm: News?
    
    func loadTopNews(completion: @escaping(() -> ())) {
         NetworkManager.shared.requestTopCounryNews(completion: { news in
             self.news = news
             completion()
         })
    }
}
