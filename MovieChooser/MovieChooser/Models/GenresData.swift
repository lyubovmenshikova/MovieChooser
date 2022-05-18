//
//  GenresData.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 13.04.2022.
//

import Foundation

struct GenresData<T : Decodable> : Decodable {
    let totalPages: Int
    let items: [Item]
}

struct Item: Decodable {
    let nameRu: String?
    let ratingKinopoisk: Double?
    let year: Int?
    let posterUrlPreview: String
    let countries: [Country]
}

struct Country: Decodable {
    let country: String
}
