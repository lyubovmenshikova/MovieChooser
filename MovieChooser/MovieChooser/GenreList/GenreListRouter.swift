//
//  GenreListRouter.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 31.05.2022.
//


protocol GenreListRouterInputProtocol {
    init(viewController: GenreListViewController)
    func openFilmDetailViewController(with film: Item)
}

class GenreListRouter: GenreListRouterInputProtocol {
   unowned let viewController: GenreListViewController
    
    required init(viewController: GenreListViewController) {
        self.viewController = viewController
    }
    
    func openFilmDetailViewController(with film: Item) {
        viewController.performSegue(withIdentifier: "toDetail", sender: film)
    }
    
    
}
