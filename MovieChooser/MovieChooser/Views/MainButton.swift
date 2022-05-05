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
    var backgroundColor: UIColor
}

extension MainButton {
    static func getButtons() -> [MainButton] {
        return [
            MainButton(title: "Выбрать фильм по жанру", image:  UIImage(named: "masks"), backgroundColor: UIColor(red: 83/255, green: 60/255, blue: 112/255, alpha: 1)),
            MainButton(title: "Выбрать фильм по актеру", image: UIImage(named: "actor"), backgroundColor:  UIColor(red: 86/255, green: 196/255, blue: 183/255, alpha: 1)),
            MainButton(title: "Популярные фильмы", image: UIImage(named: "star"), backgroundColor: UIColor(red: 128/255, green: 212/255, blue: 63/255, alpha: 1)),
            MainButton(title: "Случайный фильм", image: UIImage(named: "film"), backgroundColor: UIColor(red: 226/255, green: 230/255, blue: 46/255, alpha: 1))
        ]
    }
}
