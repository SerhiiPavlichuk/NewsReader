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
        
        setupBoolForWebViewFromRealm()
        setupBoolForWebView()
        
    }
    
    func setupBoolForWebViewFromRealm() {
        guard let url = viewModel.newsRealm?.url else { return }
        let newsFromRealm = URL(string: url)
        let loadSavedNews = URLRequest(url: newsFromRealm!)
        webView.load(loadSavedNews)
        
    }
    
    func setupBoolForWebView() {
        guard let url = viewModel.news?.url else { return }
        let newsUrl = URL(string: url)
        let myRequest = URLRequest(url: newsUrl!)
        webView.load(myRequest)
        
    }

}
