//
//  GenreListCellViewModel.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 02.06.2022.
//

import Foundation

//все ячейки будут реализовывать данный протокол
protocol CellIdentifiable {
    var cellIdentifier: String { get }
    var cellHeight: Double { get }
}

//протокол который будут реализовывать все модели секций
protocol SectionRowPresentable {
    var rows: [CellIdentifiable] { get set }
}

//модель для ячейки
class GenreListCellViewModel: CellIdentifiable {
    
    let titleFilm: String
    let rating: String
    let year: String
    let imageURL: String
    
    var cellIdentifier: String {
        "GenreListCell"
    }
    
    var cellHeight: Double {
        140
    }
    
    init(film: Item) {
        titleFilm = film.nameRu ?? "Нет информации"
        rating = "\(film.ratingKinopoisk ?? 0)"
        year = "\(film.year ?? 0)"
        imageURL = film.posterUrlPreview
    }
}

//модель для секции
class GenreListSectionViewModel: SectionRowPresentable {
    
    var rows: [CellIdentifiable] = []
}
