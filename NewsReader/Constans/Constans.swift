//
//  Constans.swift
//  NewsReader
//
//  Created by admin on 01.10.2021.
//

import Foundation

struct Constants {
    
    struct NewsNetwork {
        
        static let apiKey = "&apiKey=1fec75c1e9d4443594e6c477efd84d02"
        static let baseNewsPath = "https://newsapi.org/v2/"
        static let topHeadlines = "top-headlines?"
        static let topNewForCountryUs = "country=us"
        static let topNewForCountryUa = "country=ua"
        static let topNewForCountryRu = "country=ru"
        static let search = "everything?"
        static let category = "category"
      
    }
    
    struct UI {
        
        static let favoriteAnimation = "like"
        static let defaultCellIdentifier = "cell"
    }
}
