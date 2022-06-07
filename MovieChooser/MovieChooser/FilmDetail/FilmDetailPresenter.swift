//
//  FilmDetailPresenter.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 07.06.2022.
//

import Foundation

struct FilmDetailData {
    let filmName: String
    let filmYear: Int
    let imageData: Data?
}


class FilmDetailPresenter: FilmDetailViewOutputProtocol {
    
    unowned let view: FilmDetailViewInputProtocol
    var interactor: FilmDetailInteractorInputProtocol!
    
    required init(view: FilmDetailViewInputProtocol) {
        self.view = view
    }
    
    func showDetails() {
        //после команды презенетеру презентер идет за данными к интерактору
        interactor.provideFilmDetail()
    }
}

//MARK: FilmDetailInteractorOutputProtocol
extension FilmDetailPresenter: FilmDetailInteractorOutputProtocol {
    
    func receiveFilmDetail(with filmData: FilmDetailData) {
        //передаем данные для вью контроллера
        view.displayFilmTitle(with: filmData.filmName)
        view.displayFilmYear(with: "Год: \(filmData.filmYear)")
        guard let imageData = filmData.imageData else {return}
        view.displayImage(with: imageData)
    }
    
    
}
