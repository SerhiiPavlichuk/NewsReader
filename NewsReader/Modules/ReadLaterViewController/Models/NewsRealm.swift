//
//  NewsRealm.swift
//  NewsReader
//
//  Created by admin on 02.10.2021.
//

import Foundation
import RealmSwift

class NewsRealm: Object {
    
    @objc dynamic var title = ""
    @objc dynamic var urlToImage = ""
    @objc dynamic var url = ""
    @objc dynamic var newsDescription = ""

}
