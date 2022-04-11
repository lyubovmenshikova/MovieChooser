//
//  MainButton.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 11.04.2022.
//

import Foundation
import UIKit

struct MainButton {
    var title: String
    var image: UIImage?
    var backgroundImage: UIImageView?
}

extension MainButton {
    static func getButtons() -> [MainButton] {
        return [
            MainButton(title: "Выбрать фильм по жанру", image: UIImage(systemName: "theatermasks"), backgroundImage: UIImageView(image: UIImage(named: "222"))),
            MainButton(title: "Выбрать фильм по актеру", image: UIImage(systemName: "person"), backgroundImage: UIImageView(image: UIImage(named: "33"))),
            MainButton(title: "Новинки", image: UIImage(systemName: "star"), backgroundImage: UIImageView(image: UIImage(named: "4"))),
            MainButton(title: "Случайный фильм", image: UIImage(systemName: "dice"), backgroundImage: UIImageView(image: UIImage(named: "5")))
        ]
    }
}
