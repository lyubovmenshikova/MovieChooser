//
//  GenreViewCell.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 10.04.2022.
//

import UIKit

class GenreViewCell: UITableViewCell {
    
    @IBOutlet var genreView: UIView!
    @IBOutlet var genreImageView: UIImageView!
    @IBOutlet var genreLabel: UILabel!
    
    var mainColor = UIColor(red: 176/255, green: 88/255, blue: 138/255, alpha: 1)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupGenreLabel()
        setupGenreView()
        setupGenreImageView()
    }
    
    private func setupGenreLabel() {
        genreLabel.textColor = mainColor
        genreLabel.font = UIFont(name: "TrebuchetMS", size: 23)
    }
    
    private func setupGenreView() {
        genreView.layer.borderColor = mainColor.cgColor
        genreView.layer.borderWidth = 0.5
        genreView.layer.cornerRadius = 16
    }
    
    private func setupGenreImageView() {
        genreImageView.backgroundColor = .secondarySystemBackground
        genreImageView.layer.cornerRadius = genreImageView.frame.height / 2
    }
    
    func configure(with genre: Genre) {
        genreLabel.text = genre.name
        genreImageView.image = genre.image
    }
    
    

}
