//
//  RandomFilmData.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 16.05.2022.
//pagesCount

import Foundation

struct RandomFilmData: Decodable {
    var pagesCount: Int
    var films: [Items]
}

struct Items: Decodable {
    var filmId: Int?
    var nameRu: String?
    var year: String?
    var filmLength: String?
    var countries: [CountriesRandom]
    var genres: [GenresRandom]
    var rating: String?
    var posterUrl: String?
}

struct CountriesRandom: Decodable {
    var country: String?
}

struct GenresRandom: Decodable {
    var genre: String?
}
