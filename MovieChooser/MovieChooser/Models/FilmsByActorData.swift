//
//  FilmsByActorData.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 30.04.2022.
//

import Foundation


struct FilmsByActorData: Decodable {
    
    var nameRu: String?
    var posterUrlPreview: String?
    var ratingKinopoisk: Double?
    var year: Int?
    var filmLength: Int?
    var shortDescription: String?
    var countries: [Countries]
    var genres: [Genres]
}

struct Countries: Decodable {
    let country: String?
}

struct Genres: Decodable {
    var genre: String?
}
