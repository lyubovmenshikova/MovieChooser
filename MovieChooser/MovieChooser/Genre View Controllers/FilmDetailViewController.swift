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
    
    var mainColor = UIColor(red: 176/255, green: 88/255, blue: 138/255, alpha: 1)
    var font = UIFont(name: "TrebuchetMS", size: 17)
    
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
        
        filmTitleLabel.textColor = mainColor
        filmTitleLabel.font = font
        
        yearLabel.textColor = mainColor
        yearLabel.font = font
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
