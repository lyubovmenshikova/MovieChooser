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
    var imageURL: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImage()
        setupAppearance()
        setupData()
        
    }
    
    private func setupAppearance() {
        view.backgroundColor = .secondarySystemBackground
        
        filmTitleLabel.textColor = UIColor(red: 176/255, green: 88/255, blue: 138/255, alpha: 1)
        filmTitleLabel.font = UIFont(name: "TrebuchetMS", size: 17)
        
        yearLabel.textColor = UIColor(red: 176/255, green: 88/255, blue: 138/255, alpha: 1)
        yearLabel.font = UIFont(name: "TrebuchetMS", size: 17)
        
    }
    
    private func setupData() {
        filmTitleLabel.text = filmTitle
        yearLabel.text = filmYear
    }
    
    private func setupImage() {
        DispatchQueue.global().async {
            guard let stringURL = self.imageURL,
                  let imageURL = URL(string: stringURL),
                  let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                self.posterImage.image = UIImage(data: imageData)
            }
        }
    }
    
}
