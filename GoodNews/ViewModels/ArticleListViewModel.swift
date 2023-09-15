//
//  ArticleListViewModel.swift
//  GoodNews
//
//  Created by VT on 9/15/23.
//

import Foundation

struct ArticleListViewModel {
    let articles: [Article]
}

extension ArticleListViewModel {
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return articles.count
    }
    
    func articleAt(_ index: Int) -> Article {
        return articles[index]
    }
}
