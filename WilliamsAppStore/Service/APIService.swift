//
//  APIService.swift
//  WilliamsAppStore
//
//  Created by Chinwa Williams on 03/03/2019.
//  Copyright © 2019 Chinwa Williams. All rights reserved.
//

import Foundation

class APIService {
    static let shared  = APIService()
    
    func fetchApps(completion : @escaping ([Result]) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, reponse, error) in
            if let err = error {
                print("Failed to fetch from server : ", err)
                return
            }
            //Success staute
            guard let data = data else { print("app crash prevention, data is null"); return}
            
            do{
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results)
                //
            }catch{
                print("app crash prevention, search result was null " , error)
            }
            print(data)
            }.resume()
    }
}
