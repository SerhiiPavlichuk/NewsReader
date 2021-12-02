//
//  NewsViewModel.swift
//  NewsReader
//
//  Created by admin on 01.10.2021.
//

import Foundation

class NewsViewModel {
    
    var usNews: [News] = []
    var uaNews: [News] = []
    var ruNews: [News] = []
    
    
    func loadTopUsNews(completion: @escaping(() -> ())) {
        NetworkManager.shared.requestTopCounryNewsUs(completion: { news in
            self.usNews = news
            completion()
        })
    }
    
    func loadTopUaNews(completion: @escaping(() -> ())) {
        NetworkManager.shared.requestTopCounryNewsUa(completion: { news in
            self.uaNews = news
            completion()
        })
    }
    
    func loadTopRuNews(completion: @escaping(() -> ())) {
        NetworkManager.shared.requestTopCounryNewsRu(completion: { news in
            self.ruNews = news
            completion()
        })
    }
    
    func saveNewsRealm(_ news: News, completion: @escaping(() -> ())) {
        
        
        DataManager.shared.saveNews(news, completion: completion)
    }
    
    func loadSearchResult(newsSearch: String, completion: @escaping(() -> ())) {
        NetworkManager.shared.searchNews(for: newsSearch, completion: { newsResult in
            self.usNews = newsResult ?? []
            completion()
        })
    }
}
