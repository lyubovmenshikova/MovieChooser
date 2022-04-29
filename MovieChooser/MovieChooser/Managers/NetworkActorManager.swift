//
//  NetworkActorManager.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 26.04.2022.
//

import Foundation
import UIKit

class NetworkActorManager {
    
    static let shared = NetworkActorManager()
    
    private init() {}
    
    func fetchCurrentActors(for name: String, completion: @escaping (ActorsData<[Actors]>) -> Void) {
        //кодируем параметр если придет русское слово
        guard let nameCode = name.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        guard let url = URL(string: "https://kinopoiskapiunofficial.tech/api/v1/persons?name=\(nameCode)&page=1") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("93609eb6-7fe6-427c-a925-9a016d5189b5", forHTTPHeaderField: "X-API-KEY")
        request.addValue("application/json", forHTTPHeaderField: "accept")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let decoder = JSONDecoder()
            if let data = data {
                do {
                    let actorsData = try decoder.decode(ActorsData<[Actors]>.self, from: data)
                    // выходим из фонового потока в главный
                    DispatchQueue.main.async {
                        completion(actorsData)
                    }
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}
