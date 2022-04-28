//
//  NetworkActorForIDManager.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 28.04.2022.
//

import Foundation

class NetworkActorForIDManager {
    
    static let shared = NetworkActorForIDManager()
    
    private init() {}
    
    func fetchActor(for id: Int, completion: @escaping (ActorIdData) -> Void) {
        guard let url = URL(string: "https://kinopoiskapiunofficial.tech/api/v1/staff/\(id)") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("93609eb6-7fe6-427c-a925-9a016d5189b5", forHTTPHeaderField: "X-API-KEY")
        request.addValue("application/json", forHTTPHeaderField: "accept")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let decoder = JSONDecoder()
            if let data = data {
                do {
                    let actorsIdData = try decoder.decode(ActorIdData.self, from: data)
                    // выходим из фонового потока в главный
                    DispatchQueue.main.async {
                        completion(actorsIdData)
                    }
                } catch let error {
                    print(error)
                }
            }
        }.resume()
    }
}
