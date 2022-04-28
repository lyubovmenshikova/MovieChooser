//
//  FilmsListCell.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 28.04.2022.
//

import UIKit

class FilmsListCell: UITableViewCell {
    
    @IBOutlet var filmsListView: UIView!
    @IBOutlet var filmIconImage: UIImageView!
    @IBOutlet var filmNameLabel: UILabel!
    
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    
    var mainColor = UIColor(red: 17/255, green: 188/255, blue: 214/255, alpha: 1)
    
    override func awakeFromNib() {
        super.awakeFromNib()
       setupCell()
    }

    private func setupCell () {
        
        filmNameLabel.textColor = .black
        filmNameLabel.font = UIFont(name: "TrebuchetMS", size: 18)
        
        genreLabel.textColor = mainColor
        genreLabel.font = UIFont(name: "TrebuchetMS", size: 18)
        
        yearLabel.textColor = mainColor
        yearLabel.font = UIFont(name: "TrebuchetMS", size: 18)
        
        ratingLabel.backgroundColor = mainColor
        ratingLabel.layer.masksToBounds = true
        ratingLabel.layer.cornerRadius = 5
        
        filmsListView.layer.borderColor = mainColor.cgColor
        filmsListView.layer.borderWidth = 0.5
        filmsListView.layer.cornerRadius = 16
        
        //filmIconImage.layer.cornerRadius = 16
        
    }
    
    func configure(with film: Films ) {
        
        filmNameLabel.text = film.nameRu
        ratingLabel.text = film.rating

//        DispatchQueue.global().async {
//            let stringURL = actor.posterUrl
//            guard let imageURL = URL(string: stringURL),
//                  let imageData = try? Data(contentsOf: imageURL) else { return }
//
//            DispatchQueue.main.async {
//                self.actorIcon.image = UIImage(data: imageData)
//            }
//        }

    }

}
