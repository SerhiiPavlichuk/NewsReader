//
//  NetworkManager.swift
//  NewsReader
//
//  Created by admin on 01.10.2021.
//

import Foundation
import Alamofire

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    func requestTopCounryNews(completion: @escaping(([News]) -> ())){
        
        let url = Constants.NewsNetwork.baseNewsPath + Constants.NewsNetwork.topHeadlines + Constants.NewsNetwork.topNewForCountry + Constants.NewsNetwork.apiKey
        
        AF.request(url).responseJSON { responce in
            let decoder = JSONDecoder()
            if let data = try? decoder.decode(PopularNewsResult.self, from: responce.data!) {
                let newsList = data.news ?? []
                completion(newsList)
            }
        }
    }
    
    func searchNews(for newsSearch: String, completion: @escaping(([News]?) -> ())) {

        let url = Constants.NewsNetwork.baseNewsPath + Constants.NewsNetwork.search + "q=\(newsSearch)" + Constants.NewsNetwork.apiKey

        AF.request(url).responseJSON { responce in
            let decoder = JSONDecoder()
            if let data = try? decoder.decode(PopularNewsResult.self, from: responce.data!) {
                let newsList = data.news ?? []
                completion(newsList)
            }
        }
    }
}
    
