//
//  Article.swift
//  GoodNews
//
//  Created by VT on 9/15/23.
//

import Foundation

struct Article: Codable {
    let title: String
    let description: String
}

struct ArticleList: Codable {
    let articles: [Article]
}
