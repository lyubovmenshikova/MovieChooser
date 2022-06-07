//
//  GenreListPresenter.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 31.05.2022.
//
import Foundation

struct GenreListData {
    
}

class GenreListPresenter: GenreListViewOutputProtocol{
    
    //безхозная сслыка (свойство не опционально) чтобы не было цикла ссильных ссылок
    //слабая ссылка потому что дочерний Presenter ссылает на родительский класс
    unowned let view: GenreListViewInputProtocol
    var interactor: GenreListInteractorInputProtocol!
    var router: GenreListRouterInputProtocol!
    
    required init(view: GenreListViewInputProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        interactor.fetchFilmsByGenre()
    }
    
    func didTapCell(at indexPath: IndexPath) {
        interactor.getFilm(at: indexPath)
    }
    
}

// MARK: GenreListInteractorOutputProtocol
extension GenreListPresenter: GenreListInteractorOutputProtocol {
    
    func filmsbyGenreDidReceive(_ films: [Item]) {
        let section = GenreListSectionViewModel()
        films.forEach { section.rows.append(GenreListCellViewModel(film: $0))}
        view.reloadData(for: section)
    }
    
    func filmbyGenreDidReceive(_ film: Item) {
        router.openFilmDetailViewController(with: film)
    }
}
