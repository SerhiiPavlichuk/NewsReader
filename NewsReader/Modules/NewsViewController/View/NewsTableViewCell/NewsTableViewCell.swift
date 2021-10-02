//
//  NewsTableViewCell.swift
//  NewsReader
//
//  Created by admin on 01.10.2021.
//

import UIKit
import SDWebImage

class NewsTableViewCell: UITableViewCell {
    
    var viewModel: NewsViewModel = NewsViewModel()
    
    @IBOutlet weak var view: UIView!
    @IBOutlet var newsImageView: UIImageView!
    @IBOutlet weak var newsNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var autorLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var readLaterButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.view.layer.cornerRadius = 24
        
//        readLaterButton.addTarget(self, action: #selector(saveNewsButtonPressed), for: .touchUpInside)
/*        the button is implemented in a different place, so as not to waste time, I went further, I will return later.
 I understand that it does not work because news = [News], newsForRealm is emty */
    }

    func newsConfigureWith(imageURL: URL?, newsName: String?, description: String?, autor: String?, source: String?) {
        self.newsNameLabel.text = newsName
        self.descriptionLabel.text = description
        self.newsImageView.sd_setImage(with: imageURL, completed: nil)
        self.autorLabel.text = autor
        self.sourceLabel.text = source
        
    }
//    @objc func saveNewsButtonPressed(){
//
//        self.viewModel.saveNewsRealm(self.viewModel.newsforRealm, completion: {
//
//
//           })
//       }
}
