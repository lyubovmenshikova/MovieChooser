//
//  BestFilmData.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 05.05.2022.
//

import Foundation

struct BestFilmData: Decodable {
    let pagesCount: Int
    let films: [Film]
}

struct Film: Decodable {
    let filmId: Int
    let nameRu: String?
    let year: String?
    let filmLength: String?
    let countries: [CountriesBest]
    let genres: [GenresBest]
    let rating: String?
    let posterUrl: String
    
}

struct CountriesBest: Decodable {
    let country: String
}

struct GenresBest: Decodable {
    let genre: String
}

