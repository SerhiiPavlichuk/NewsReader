//
//  OpenNewsInWebViewController.swift
//  NewsReader
//
//  Created by admin on 02.10.2021.
//

import UIKit
import WebKit

class OpenNewsInWebViewController: UIViewController, WKUIDelegate {
    
    var viewModel: OpenNewsInWebViewModel = OpenNewsInWebViewModel()
    var webView: WKWebView!
    
    override func loadView() {
        
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
 
        guard let url = viewModel.news?.url else { return }
            let newsUrl = URL(string: url)
        let myRequest = URLRequest(url: newsUrl!)
        webView.load(myRequest)
        
        setupFavoriteButtonUI()
  
    }
    func setupFavoriteButtonUI() {
        let addToFavoriteButtonPressed = UIBarButtonItem(barButtonSystemItem: .save , target: self, action: #selector(addToFavoriteButtonPressed))
            self.navigationItem.rightBarButtonItem = addToFavoriteButtonPressed
        }
    
    @objc func addToFavoriteButtonPressed (){
        
        self.viewModel.saveNewsRealm(self.viewModel.news, completion: {

           
          
        })
    }
}
