//
//  GenreListCell.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 13.04.2022.
//

import UIKit

class GenreListCell: UITableViewCell {
    
    
    @IBOutlet var filmImage: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var titleFilmLabel: UILabel!
    @IBOutlet var yearFilmLabel: UILabel!
    @IBOutlet var genreListView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCell()
    }
    
    private func setupCell () {
        titleFilmLabel.textColor = UIColor(red: 176/255, green: 88/255, blue: 138/255, alpha: 1)
        titleFilmLabel.font = UIFont(name: "TrebuchetMS", size: 21)
        
        yearFilmLabel.textColor = .red
        yearFilmLabel.font = UIFont(name: "TrebuchetMS", size: 13)
        
        ratingLabel.backgroundColor = UIColor(red: 176/255, green: 88/255, blue: 138/255, alpha: 1)
        ratingLabel.layer.masksToBounds = true
        ratingLabel.layer.cornerRadius = 5
        
        genreListView.layer.borderColor = UIColor(red: 176/255, green: 88/255, blue: 138/255, alpha: 1).cgColor
        genreListView.layer.borderWidth = 0.5
        genreListView.layer.cornerRadius = 16
        filmImage.layer.cornerRadius = 16
    }


}
