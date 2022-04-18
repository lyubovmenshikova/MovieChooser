//
//  LoadingView.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 18.04.2022.
//

import Foundation
import UIKit

class LoadingView: UIView {
    
    //индикатор
    let spinner = UIActivityIndicatorView()
    // текст
    let loadingLabel = UILabel()
    
    
    // Установка activity indicator
    func setLoadingScreen(x: CGFloat, y: CGFloat) {
        
        // Установка вью которое содержит текст Loading - и спиннер
        let width: CGFloat = 120
        let height: CGFloat = 30
        self.frame = CGRect(x: x - (width / 2), y: y - (height / 2), width: width, height: height)
      
        
        // loading текст
        self.loadingLabel.textColor = UIColor.gray
        self.loadingLabel.textAlignment = .center
        self.loadingLabel.text = "Loading..."
        self.loadingLabel.frame = CGRect(x: 0, y: 0, width: 140, height: 30)
        
        // спиннер
        self.spinner.style = .medium
        self.spinner.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        self.spinner.startAnimating()
        
   
        self.addSubview(self.spinner)
        self.addSubview(self.loadingLabel)
        
    }
    
    func removeLoadingScreen() {
      
        self.spinner.stopAnimating()
        self.loadingLabel.isHidden = true
    }
    
}
