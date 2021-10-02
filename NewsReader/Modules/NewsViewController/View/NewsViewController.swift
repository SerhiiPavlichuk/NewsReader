//
//  NewsViewController.swift
//  NewsReader
//
//  Created by admin on 01.10.2021.
//

import UIKit
import WebKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: NewsViewModel = NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    func setupTableView() {
        
        let newsTableViewCellIdentifier = String(describing: NewsTableViewCell.self)
        self.tableView.register(UINib(nibName: newsTableViewCellIdentifier, bundle: nil),
                                forCellReuseIdentifier: newsTableViewCellIdentifier)
        self.viewModel.loadTopNews(completion: {
            self.tableView.reloadData()
        })
    }
    
}

extension NewsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = String(describing: NewsTableViewCell.self)
        let newsCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! NewsTableViewCell
        
        let newsInfo = self.viewModel.news[indexPath.row]
        
        if let imagePath = newsInfo.urlToImage {
            let newsImageUrl = imagePath
            newsCell.newsConfigureWith(imageURL: URL(string: newsImageUrl),
                                       newsName: newsInfo.title, description: newsInfo.description, autor: newsInfo.author, source: newsInfo.source?.name)
        }
        
        return newsCell
    }
    
}

extension NewsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let identifier = String(describing: OpenNewsInWebViewController.self)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let openNewsViewController = storyboard.instantiateViewController(identifier: identifier) as? OpenNewsInWebViewController {
            
            openNewsViewController.viewModel.news = self.viewModel.news[indexPath.row]
            
            self.navigationController?.pushViewController(openNewsViewController, animated: true)
        }
    }
}

