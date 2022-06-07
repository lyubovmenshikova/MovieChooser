//
//  DataManager.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 07.06.2022.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults()
    private var films: [Item] = []
    
    private init() {}
    
    func setFilms<T>(_ data: T) {
        let data = data as! GenresData
        self.films = data.items
    }
    
    func getFilm(at indexPath: IndexPath) -> Item {
        films[indexPath.row]
    }
}
