//
//  GenreListInteractor.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 31.05.2022.
//
import Foundation

protocol GenreListInteractorInputProtocol: AnyObject {
    init(presenter: GenreListInteractorOutputProtocol)
    func fetchFilmsByGenre()
    func getFilm(at indexPath: IndexPath)
}

protocol GenreListInteractorOutputProtocol: AnyObject {
    func filmsbyGenreDidReceive(_ films: [Item])
    func filmbyGenreDidReceive(_ film: Item)
}

class GenreListInteractor: GenreListInteractorInputProtocol {
    
    var idNumber: String!
    unowned let presenter: GenreListInteractorOutputProtocol
    
    required init(presenter: GenreListInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func fetchFilmsByGenre() {
        DataFetcherService.sharedInstance.fetchFilmsByGenre(for: "13", page: 1) { genreData in
            guard let genreData = genreData else { return }
            //передаем фильмы из нетворк менеджера в презентер
            self.presenter.filmsbyGenreDidReceive(genreData.items)
        }
    }
    
    func getFilm(at indexPath: IndexPath) {
        DataFetcherService.sharedInstance.fetchFilmsByGenre(for: "13", page: 1) { genresData in
            guard let genresData = genresData else { return }
            let filmArray = genresData.items
            let film = filmArray[indexPath.row]
            self.presenter.filmbyGenreDidReceive(film)
        }
    }
    
    
}
