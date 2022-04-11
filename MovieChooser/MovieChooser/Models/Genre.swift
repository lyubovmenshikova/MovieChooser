//
//  Genre.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 11.04.2022.
//

import Foundation
import UIKit

struct Genre {
    var name: String
    var image: UIImage?
}

extension Genre {
    static func getGenres() -> [Genre] {
        return [
            Genre(name: "Комедия", image: UIImage(named: "Комедия")),
            Genre(name: "Драма", image: UIImage(named: "Драма")),
            Genre(name: "Боевик", image: UIImage(named: "Боевик")),
            Genre(name: "Приключения", image: UIImage(named: "Приключения")),
            Genre(name: "Мелодрама", image: UIImage(named: "Мелодрама")),
            Genre(name: "Детектив", image: UIImage(named: "Детектив")),
            Genre(name: "Фантастика", image: UIImage(named: "Фантастика")),
            Genre(name: "Ужасы", image: UIImage(named: "Ужасы")),
            Genre(name: "Семейный", image: UIImage(named: "Семейный")),
            Genre(name: "Мультфильм", image: UIImage(named: "Мультфильм")),
            Genre(name: "Триллер", image: UIImage(named: "Триллер")),
            Genre(name: "Военный", image: UIImage(named: "Военный")),
            Genre(name: "Криминал", image: UIImage(named: "Криминал")),
            Genre(name: "Мюзикл", image: UIImage(named: "Мюзикл")),
            Genre(name: "Документальный", image: UIImage(named: "Документальный")),
            Genre(name: "История", image: UIImage(named: "История")),
        ]
    }
}
