//
//  NewsApiService.swift
//  HW2
//
//  Created by Andrey Grechko on 08.12.2022.
//

import Foundation

class NewsApiService {
    static let shared = NewsApiService()
    
    public func getArticles(completion: @escaping (Result<[Article], Error>) -> Void) {
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=Apple&from=2022-12-07&sortBy=popularity&apiKey=8ac6c38bd7df4ebeaefe8f6066e37192") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(ResponseBody.self, from: data)
                    completion(.success(result.articles))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
}

struct ResponseBody: Codable{
    var articles : [Article]
    
}
