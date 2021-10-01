//
//  NewsTableViewCell.swift
//  NewsReader
//
//  Created by admin on 01.10.2021.
//

import UIKit
import SDWebImage

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet var newsImageView: UIImageView!
    @IBOutlet weak var newsNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var autorLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.view.layer.cornerRadius = 24
       
    }
    
    
    func newsConfigureWith(imageURL: URL?, newsName: String?, description: String?, autor: String?, source: String?) {
        self.newsNameLabel.text = newsName
        self.descriptionLabel.text = description
        self.newsImageView.sd_setImage(with: imageURL, completed: nil)
        self.autorLabel.text = autor
        self.sourceLabel.text = source
       
    }
}
