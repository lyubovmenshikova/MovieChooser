//
//  FilmDetailViewController.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 20.04.2022.
//

import UIKit

class FilmDetailViewController: UIViewController {

    
    @IBOutlet var filmTitleLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    
    var filmTitle: String!
    var filmYear: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
        setupData()
    
    }

    private func setupAppearance() {
        view.backgroundColor = .secondarySystemBackground
        
        filmTitleLabel.textColor = UIColor(red: 176/255, green: 88/255, blue: 138/255, alpha: 1)
        filmTitleLabel.font = UIFont(name: "TrebuchetMS", size: 20)
        
        yearLabel.textColor = UIColor(red: 176/255, green: 88/255, blue: 138/255, alpha: 1)
        yearLabel.font = UIFont(name: "TrebuchetMS", size: 20)
        
    }
    
    private func setupData() {
        filmTitleLabel.text = filmTitle
        yearLabel.text = filmYear
    }
    
}
