//
//  ActorsData.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 26.04.2022.
//

import Foundation

struct ActorsData<T : Decodable> : Decodable {
    var total: Int
    var items: [Actors]
}

struct Actors: Decodable {
    let kinopoiskId: Int
    let nameRu: String
    let nameEn: String
    let posterUrl: String
}
