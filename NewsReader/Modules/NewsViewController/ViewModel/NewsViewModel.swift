//
//  NewsViewModel.swift
//  NewsReader
//
//  Created by admin on 01.10.2021.
//

import Foundation

class NewsViewModel {
    
    var news: [News] = []

    
    func loadTopNews(completion: @escaping(() -> ())) {
         NetworkManager.shared.requestTopCounryNews(completion: { news in
             self.news = news
             completion()
         })
    }
    func saveNewsRealm(_ news: News, completion: @escaping(() -> ())) {

         
         DataManager.shared.saveNews(news, completion: completion)
     }

       func loadSearchResult(newsSearch: String, completion: @escaping(() -> ())) {
           NetworkManager.shared.searchNews(for: newsSearch, completion: { newsResult in
               self.news = newsResult ?? []
               completion()
           })
       }
}
