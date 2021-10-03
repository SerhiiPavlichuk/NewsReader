//
//  ReadLaterViewController.swift
//  NewsReader
//
//  Created by admin on 02.10.2021.
//

import Foundation
import UIKit

class ReadLaterViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ReadLaterViewModel = ReadLaterViewModel()
    
    
    override func viewDidLoad() {
              super.viewDidLoad()
              
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.UI.defaultCellIdentifier)
          
          }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          
          self.viewModel.news = self.viewModel.getNews()
          self.tableView.reloadData()
          
      }
}

extension ReadLaterViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.UI.defaultCellIdentifier)
        cell?.textLabel?.text = self.viewModel.news[indexPath.row].title
        
        return cell ?? UITableViewCell()
    }
}

extension ReadLaterViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = viewModel.news[indexPath.row]
            tableView.beginUpdates()
            viewModel.news.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            try! viewModel.realm?.write {
                viewModel.realm?.delete(item)
            }
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let identifier = String(describing: OpenNewsInWebViewController.self)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailViewController = storyboard.instantiateViewController(identifier: identifier) as? OpenNewsInWebViewController {
            
            detailViewController.viewModel.newsRealm = self.viewModel.news[indexPath.row]
            
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
