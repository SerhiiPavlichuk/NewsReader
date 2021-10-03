//
//  ReadLaterViewModel.swift
//  NewsReader
//
//  Created by admin on 02.10.2021.
//

import Foundation
import RealmSwift

class ReadLaterViewModel {
    
    let realm = try? Realm()
    var news: [NewsRealm] = []
    
    func getNews() -> [NewsRealm] {
        
        var news = [NewsRealm]()
        guard let newsResult = realm?.objects(NewsRealm.self) else { return [] }
        for item in newsResult {
            news.append(item)
        }
        return news
    }
    
  
}
