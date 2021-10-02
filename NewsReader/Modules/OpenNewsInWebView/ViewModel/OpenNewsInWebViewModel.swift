//
//  OpenNewsInWebViewModel.swift
//  NewsReader
//
//  Created by admin on 02.10.2021.
//

import Foundation

class OpenNewsInWebViewModel  {
    
    var news: News? = nil
    
    func saveNewsRealm(_ news: News?, completion: @escaping(() -> ())) {
        
        guard let news = news else {
           
            return
        }
        
        DataManager.shared.saveNews(news, completion: completion)
    }
}
