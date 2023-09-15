//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by VT on 9/15/23.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var articlesViewModel: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        loadNews()
    }
    
    private func loadNews() {
        APIService.shared.getArticles() { [weak self] articles in
            if let articles = articles {
                self?.articlesViewModel = ArticleListViewModel(articles: articles)
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return articlesViewModel == nil ? 0 : articlesViewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        cell.configCell(article: articlesViewModel.articleAt(indexPath.row))
        return cell
    }
    
}
