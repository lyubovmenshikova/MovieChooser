//
//  BestFilmData.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 05.05.2022.
//

import Foundation

struct BestFilmData: Decodable {
    var pagesCount: Int
    var films: [Film]
}

struct Film: Decodable {
    var filmId: Int?
    var nameRu: String?
    var year: String?
    var filmLength: String?
    var countries: [CountriesBest]
    var genres: [GenresBest]
    var rating: String?
    var posterUrl: String?
    
}

struct CountriesBest: Decodable {
    var country: String?
}

struct GenresBest: Decodable {
    var genre: String?
}

