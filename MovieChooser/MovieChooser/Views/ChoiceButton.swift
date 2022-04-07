//
//  ChoiceButton.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 04.04.2022.
//

import  UIKit

class ChoiceButton: UIButton {
    

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        tintColor = .white
    }

    private lazy var gradientLayer: CAGradientLayer = {
        let newLayer = CAGradientLayer()
        newLayer.frame = self.bounds
        let firstColor = UIColor(red: 234/255, green: 58/255, blue: 141/255, alpha: 1)
        let secondColor = UIColor(red: 213/255, green: 9/255, blue: 101/255, alpha: 1)
        newLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        newLayer.startPoint = CGPoint(x: 0, y: 0)
        newLayer.endPoint = CGPoint(x: 0, y: 1)
        newLayer.cornerRadius = 16
        layer.insertSublayer(newLayer, at: 0)
        return newLayer
    }()
}
