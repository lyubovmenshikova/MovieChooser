//
//  FilmDetailConfigurator.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 07.06.2022.
//

import Foundation

protocol FilmDetailConfiguratorInputProtocol {
    
    func configure(with viewController: FilmDetailViewController, and film: Item)
}

class FilmDetailConfigurator: FilmDetailConfiguratorInputProtocol {
    
    func configure(with viewController: FilmDetailViewController, and film: Item) {
        let presenter = FilmDetailPresenter(view: viewController)
        let interactor = FilmDetailInteractor(presenter: presenter, film: film)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
    }
    
    
}
