//
//  NetworkRandomFilmManager.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 16.05.2022.
//

import Foundation

class NetworkRandomFilmManager {
    
    static let shared = NetworkRandomFilmManager()
    
    private init() {}
    
    func fetchRandomFilm(for page: Int, completion: @escaping (RandomFilmData) -> Void) {
        
        guard let url = URL(string: "https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_250_BEST_FILMS&page=\(page)") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("93609eb6-7fe6-427c-a925-9a016d5189b5", forHTTPHeaderField: "X-API-KEY")
        request.addValue("application/json", forHTTPHeaderField: "accept")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let decoder = JSONDecoder()
            if let data = data {
                do {
                    let randomFilmData = try decoder.decode(RandomFilmData.self, from: data)
                    // выходим из фонового потока в главный
                    DispatchQueue.main.async {
                        completion(randomFilmData)
                    }
                } catch let error {
                    print(error)
                }
            }
        }.resume()
    }
}
