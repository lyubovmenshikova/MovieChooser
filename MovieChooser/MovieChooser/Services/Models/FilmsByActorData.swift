//
//  FilmsByActorData.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 30.04.2022.
//

import Foundation


struct FilmsByActorData: Decodable {
    
    let nameRu: String?
    let posterUrlPreview: String
    let ratingKinopoisk: Double?
    let year: Int?
    let filmLength: Int?
    let shortDescription: String?
    let countries: [Countries]
    let genres: [Genres]
}

struct Countries: Decodable {
    let country: String
}

struct Genres: Decodable {
    let genre: String
}
