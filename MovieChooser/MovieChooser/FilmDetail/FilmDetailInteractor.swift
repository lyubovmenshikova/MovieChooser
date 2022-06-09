//
//  FilmDetailInteractor.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 07.06.2022.
//

import Foundation

//через этот протокол данные поступают в интерактор
protocol FilmDetailInteractorInputProtocol: AnyObject {
    init(presenter: FilmDetailInteractorOutputProtocol, film: Item)
    func provideFilmDetail()
}

//интерактор передает данные в презентер через этот протокол
protocol FilmDetailInteractorOutputProtocol: AnyObject {
    func receiveFilmDetail(with filmData: FilmDetailData)
}

class FilmDetailInteractor: FilmDetailInteractorInputProtocol {
    
    unowned let presenter: FilmDetailInteractorOutputProtocol!
    private let film: Item
    
    required init(presenter: FilmDetailInteractorOutputProtocol, film: Item ) {
        self.presenter = presenter
        self.film = film
    }
    
    //метод получения данных в интерактор для передачи в презентер и во сью контроллер
    func provideFilmDetail() {
        let imageData = ImageManager.shared.fetchImageData(from: film.posterUrlPreview)
        let filmDetailData = FilmDetailData(
            filmName: film.nameRu ?? "Нет информации",
            filmYear: film.year ?? 0,
            imageData: imageData
        )
        presenter.receiveFilmDetail(with: filmDetailData)
    }
    

    
}
