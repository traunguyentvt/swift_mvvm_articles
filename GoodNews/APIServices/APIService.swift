//
//  APIService.swift
//  GoodNews
//
//  Created by VT on 9/15/23.
//

import Foundation

struct Constant {
    static let apiKey = "5a9a62755e33403fbe53f9c375271e48"
    
    static let api_articles = "https://newsapi.org/v2/everything"
}

class APIService {
    static let shared = APIService()
    
    func getArticles(competion: @escaping ([Article]?) -> ()) {
        var urlComponents = URLComponents(string: Constant.api_articles)!
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: "ios"),
//            URLQueryItem(name: "from", value: "2023-07-04"),
//            URLQueryItem(name: "language", value: "en"),
            URLQueryItem(name: "q", value: "tesla"),
            URLQueryItem(name: "sortBy", value: "publishedAt"),
            URLQueryItem(name: "apiKey", value: Constant.apiKey)
        ]
        var request = URLRequest(url: urlComponents.url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { data, urlResponse, error in
            if let err = error {
                debugPrint(err.localizedDescription)
                competion(nil)
            }
            guard let data = data else { return }
            do {
                let articles = try JSONDecoder().decode(ArticleList.self, from: data)
                competion(articles.articles)
            } catch {
                debugPrint("Can not parse data response")
                competion(nil)
            }
        }.resume()
    }
}
