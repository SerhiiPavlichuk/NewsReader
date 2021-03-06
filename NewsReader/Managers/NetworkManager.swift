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
    
    func requestTopCounryNewsUs(completion: @escaping(([News]) -> ())){
        
        let url = Constants.NewsNetwork.baseNewsPath + Constants.NewsNetwork.topHeadlines + Constants.NewsNetwork.topNewForCountryUs + Constants.NewsNetwork.apiKey
        
        AF.request(url)
            .validate()
            .responseDecodable(of: PopularNewsResult.self) { (response) in
                guard let news = response.value else { return }
                let  newsList = news.news ?? []
                completion(newsList)
            }
    }
    
    func requestTopCounryNewsUa(completion: @escaping(([News]) -> ())){
        
        let url = Constants.NewsNetwork.baseNewsPath + Constants.NewsNetwork.topHeadlines + Constants.NewsNetwork.topNewForCountryUa + Constants.NewsNetwork.apiKey
        
        AF.request(url)
            .validate()
            .responseDecodable(of: PopularNewsResult.self) { (response) in
                guard let news = response.value else { return }
                let  newsList = news.news ?? []
                completion(newsList)
            }
    }
    
    func requestTopCounryNewsRu(completion: @escaping(([News]) -> ())){
        
        let url = Constants.NewsNetwork.baseNewsPath + Constants.NewsNetwork.topHeadlines + Constants.NewsNetwork.topNewForCountryRu + Constants.NewsNetwork.apiKey
        
        AF.request(url)
            .validate()
            .responseDecodable(of: PopularNewsResult.self) { (response) in
                guard let news = response.value else { return }
                let  newsList = news.news ?? []
                completion(newsList)
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

