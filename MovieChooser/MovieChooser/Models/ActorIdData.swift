//
//  ActorIdData.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 28.04.2022.
//

import Foundation

struct ActorIdData: Decodable {
    
    var nameRu: String?
    var nameEn: String?
    var sex: String?
    var birthday: String?
    var age: Int?
    var birthplace: String?
    var films: [Films]
}

struct Films: Decodable {
    let filmId: Int?
    let nameRu: String?
    let rating: String?
}
