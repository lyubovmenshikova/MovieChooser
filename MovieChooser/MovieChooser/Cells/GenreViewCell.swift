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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    private func setupCell() {
        genreLabel.textColor = UIColor(red: 176/255, green: 88/255, blue: 138/255, alpha: 1)
        genreLabel.font = UIFont(name: "TrebuchetMS", size: 23)
        genreImageView.backgroundColor = .secondarySystemBackground
        genreView.layer.borderColor = UIColor(red: 176/255, green: 88/255, blue: 138/255, alpha: 1).cgColor
        genreView.layer.borderWidth = 0.5
        genreView.layer.cornerRadius = 16
        genreImageView.layer.cornerRadius = genreImageView.frame.height / 2
    }
    
    func configure(with genre: Genre) {
        genreLabel.text = genre.name
        genreImageView.image = genre.image
    }

}
