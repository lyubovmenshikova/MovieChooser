//
//  GenresData.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 13.04.2022.
//

import Foundation

struct GenresData: Decodable {
    let items: [Item]
}

struct Item: Decodable {
    let nameRu: String
    let ratingKinopoisk: Double
    let year: Int
    let posterUrlPreview: String
}
