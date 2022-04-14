//
//  NetworkGenresManager.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 13.04.2022.
//

import Foundation

class NetworkGenresManager {
    
    //клоужер в который кладем данные из функции где их получаем
    var onCompletion: ((GenresData) -> Void)?
    

    
    func fetchCurrentFilms(for genre: String, completion: @escaping (GenresData) -> Void) {
        
        guard let url = URL(string: "https://kinopoiskapiunofficial.tech/api/v2.2/films?genres=13&order=NUM_VOTE&type=FILM&ratingFrom=8&ratingTo=10&yearFrom=1970&yearTo=3000") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("93609eb6-7fe6-427c-a925-9a016d5189b5", forHTTPHeaderField: "X-API-KEY")
        request.addValue("application/json", forHTTPHeaderField: "accept")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let decoder = JSONDecoder()
            if let data = data {
                do {
                    let films = try decoder.decode(GenresData.self, from: data)
                    completion(films)
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    
        
    }

    
    
}





