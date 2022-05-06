//
//  NetworkBestFilmsManager.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 05.05.2022.
//

import Foundation

class NetworkBestFilmsManager {
    
    static let shared = NetworkBestFilmsManager()
    
    private init() {}
    
    func fetchBestFilms(for page: Int, completion: @escaping (BestFilmData) -> Void) {
        
        guard let url = URL(string: "https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_100_POPULAR_FILMS&page=\(page)") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("93609eb6-7fe6-427c-a925-9a016d5189b5", forHTTPHeaderField: "X-API-KEY")
        request.addValue("application/json", forHTTPHeaderField: "accept")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let decoder = JSONDecoder()
            if let data = data {
                do {
                    let bestFilmsData = try decoder.decode(BestFilmData.self, from: data)
                    // выходим из фонового потока в главный
                    DispatchQueue.main.async {
                        completion(bestFilmsData)
                    }
                } catch let error {
                    print(error)
                }
            }
        }.resume()
    }
}
