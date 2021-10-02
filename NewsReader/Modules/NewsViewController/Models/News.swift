import Foundation

struct News : Codable {
    var source : Source?
    var author : String?
    let title : String?
    let description : String?
    let url : String?
    let urlToImage : String?
    var publishedAt : String?
    var content : String?
    
    enum CodingKeys: String, CodingKey {
        
        case source = "source"
        case author = "author"
        case title = "title"
        case description = "description"
        case url = "url"
        case urlToImage = "urlToImage"
        case publishedAt = "publishedAt"
        case content = "content"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        source = try values.decodeIfPresent(Source.self, forKey: .source)
        author = try values.decodeIfPresent(String.self, forKey: .author)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        urlToImage = try values.decodeIfPresent(String.self, forKey: .urlToImage)
        publishedAt = try values.decodeIfPresent(String.self, forKey: .publishedAt)
        content = try values.decodeIfPresent(String.self, forKey: .content)
    }
    init(from newsRealm: NewsRealm) {
        self.title = newsRealm.title
        self.urlToImage = newsRealm.urlToImage
        self.url = newsRealm.url
        self.description = newsRealm.newsDescription
        
    }
}
