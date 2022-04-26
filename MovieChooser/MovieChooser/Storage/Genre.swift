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
    var id: String
}

extension Genre {
    static func getGenres() -> [Genre] {
        return [
            Genre(name: "Комедия", image: UIImage(named: "Комедия"), id: "13"),
            Genre(name: "Драма", image: UIImage(named: "Драма"), id: "2"),
            Genre(name: "Боевик", image: UIImage(named: "Боевик"), id: "11"),
            Genre(name: "Приключения", image: UIImage(named: "Приключения"), id: "7"),
            Genre(name: "Мелодрама", image: UIImage(named: "Мелодрама"), id: "4"),
            Genre(name: "Детектив", image: UIImage(named: "Детектив"), id: "5"),
            Genre(name: "Фантастика", image: UIImage(named: "Фантастика"), id: "6"),
            Genre(name: "Ужасы", image: UIImage(named: "Ужасы"), id: "17"),
            Genre(name: "Семейный", image: UIImage(named: "Семейный"), id: "19"),
            Genre(name: "Мультфильм", image: UIImage(named: "Мультфильм"), id: "18"),
            Genre(name: "Триллер", image: UIImage(named: "Триллер"), id: "1"),
            Genre(name: "Военный", image: UIImage(named: "Военный"), id: "14"),
            Genre(name: "Криминал", image: UIImage(named: "Криминал"), id: "3"),
            Genre(name: "Мюзикл", image: UIImage(named: "Мюзикл"), id: "20"),
            Genre(name: "Документальный", image: UIImage(named: "Документальный"), id: "22"),
            Genre(name: "История", image: UIImage(named: "История"), id: "15"),
        ]
    }
}

