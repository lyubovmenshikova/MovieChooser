//
//  GenreViewController.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 07.04.2022.
//

import UIKit

class GenreViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
       // setNeedsStatusBarAppearanceUpdate()

        view.backgroundColor = .secondarySystemBackground
        navigationController?.navigationBar.tintColor = UIColor(red: 176/255, green: 88/255, blue: 138/255, alpha: 1)
        navigationItem.largeTitleDisplayMode = .never
    }
    


}
