//
//  NetworkDataFetcher.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 18.05.2022.
//

import Foundation

protocol DataFetcher {
    func fetchGenericJSONData<T: Decodable>(urlString: String, response: @escaping (T?) -> Void)
}

//Класс отвечает за декодирование полученных данных в конкретную модель
class NetworkDataFetcher: DataFetcher {
    
    var networking: Networking
    
    //по умолчанию класс NetworkDataFetcher не будет требовать никакой инициализации, стоит автоматич инициализация
    init(networking: Networking = NetworkService() ){
        self.networking = networking
    }
    
    //универсальная связующая функция между запросом данных из networkService и декодированием JSON
    func fetchGenericJSONData<T: Decodable>(urlString: String, response: @escaping (T?) -> Void) {
        networking.request(urlString: urlString) { data, error in
            if let error = error {
                print(error)
                response(nil)
            }
            let decoded = self.decodeJSON(type: T.self, data: data)
            response(decoded)
        }
    }
    
    //универсальная функция по декодированию JSON данных в любую модель подписанную под протокол Decodable
    func decodeJSON<T: Decodable>(type: T.Type, data: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = data else { return nil }
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let error {
            print(error)
            return nil
        }
    }
}
