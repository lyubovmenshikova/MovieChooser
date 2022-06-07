//
//  GenreListConfigurator.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 31.05.2022.
//

protocol GenreListConfiguratorInputProtocol {
    func configure(with viewController: GenreListViewController )
}

class GenreListConfigurator: GenreListConfiguratorInputProtocol {
    
    func configure(with viewController: GenreListViewController) {
        let presenter = GenreListPresenter(view: viewController)
        viewController.presenter = presenter
        
        let interactor = GenreListInteractor(presenter: presenter)
        presenter.interactor = interactor
        
        let router = GenreListRouter(viewController: viewController)
        presenter.router = router
    }
    
    
}
