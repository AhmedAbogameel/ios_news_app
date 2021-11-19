//
//  NewsController.swift
//  news_app
//
//  Created by Jemi on 18/11/2021.
//

import Foundation

public class NewsController {
    
    private let API_KEY = "df1a070b89e64ce78ba286cea86af31b"
    
    private let BASE_URL = "https://newsapi.org/v2/everything?q=apple&from=2021-11-17&to=2021-11-17&sortBy=popularity&apiKey="
        
    var news:Array<NewsModel> = []
    
    func getNews() {
        let api = BASE_URL + API_KEY
        do {
            let url = URL(string: api)!
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data) as! [String:Any]
            let articles = json["articles"] as! [[String:Any]]
            for article in articles {
                news.append(NewsModel(title: article["title"] as! String, image: article["urlToImage"] as! String))
            }
        } catch {
            print(error)
        }
    }
    
}
