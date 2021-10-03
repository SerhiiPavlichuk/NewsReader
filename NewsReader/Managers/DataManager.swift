//
//  DataManager.swift
//  NewsReader
//
//  Created by admin on 02.10.2021.
//

import Foundation
import RealmSwift

struct DataManager {
    
    let realm = try? Realm()

    static let shared = DataManager()

    private init() { }
    
    func saveNews(_ news: News, completion: @escaping(() -> ())) {
        
        let newsRealm = NewsRealm()
        
        newsRealm.title = news.title ?? ""
        newsRealm.urlToImage = news.urlToImage ?? ""
        newsRealm.url = news.url ?? ""
        newsRealm.newsDescription = news.description ?? ""
    
        try? realm?.write {
            realm?.add(newsRealm)
        }
        completion()
    }
    func getAllNews(completion: ([News])->()) {
        
        var newsRealm = [NewsRealm]()
        guard let newsResult = realm?.objects(NewsRealm.self) else { return }
        for news in newsResult {
            newsRealm.append(news)
        }
        
        completion(convertToNewsList(newsRealm: newsRealm))
    }
    
    private func convertToNewsList(newsRealm: [NewsRealm]) -> [News] {

        var news = [News]()
        for newsRealm in newsRealm {
            let newsFromRealm = News(from: newsRealm)
            news.append(newsFromRealm)
        }
        return news
    }
}
