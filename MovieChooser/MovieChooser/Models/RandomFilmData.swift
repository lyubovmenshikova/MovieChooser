//
//  RandomFilmData.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 16.05.2022.
//pagesCount

import Foundation

struct RandomFilmData: Decodable {
    let pagesCount: Int
    let films: [Items]
}

struct Items: Decodable {
    let filmId: Int
    let nameRu: String?
    let year: String?
    let filmLength: String?
    let countries: [CountriesRandom]
    let genres: [GenresRandom]
    let rating: String?
    let posterUrl: String?
}

struct CountriesRandom: Decodable {
    let country: String
}

struct GenresRandom: Decodable {
    let genre: String
}
