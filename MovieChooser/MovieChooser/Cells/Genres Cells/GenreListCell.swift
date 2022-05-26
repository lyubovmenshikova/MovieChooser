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
    
    var mainColor = UIColor(red: 176/255, green: 88/255, blue: 138/255, alpha: 1)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
        setupYearFilmLabel()
        setupRatingLabel()
        setupGenreListView()
    }
    
    private func setupCell () {
        titleFilmLabel.textColor = mainColor
        titleFilmLabel.font = UIFont(name: "TrebuchetMS", size: 18)
        filmImage.layer.cornerRadius = 16
    }
    
    private func setupYearFilmLabel() {
        yearFilmLabel.textColor = .red
        yearFilmLabel.font = UIFont(name: "TrebuchetMS", size: 12)
    }
    
    private func setupRatingLabel() {
        ratingLabel.backgroundColor = mainColor
        ratingLabel.layer.masksToBounds = true
        ratingLabel.layer.cornerRadius = 5
    }
    
    private func setupGenreListView() {
        genreListView.layer.borderColor = mainColor.cgColor
        genreListView.layer.borderWidth = 0.5
        genreListView.layer.cornerRadius = 16
    }
    
    func configure(with genre: Item ) {
        titleFilmLabel.text = genre.nameRu ?? "Нет информации"
        yearFilmLabel.text = "Год: \(genre.year ?? 0)"
        ratingLabel.text = "\(genre.ratingKinopoisk ?? 0.0)"
        
        fetchImage(genre: genre)
    }
    
    private func fetchImage(genre: Item) {
        DispatchQueue.global().async {
            let stringURL = genre.posterUrlPreview
            guard let imageURL = URL(string: stringURL),
                  let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                self.filmImage.image = UIImage(data: imageData)
            }
        }
    }
    
    //метод используется перед тем как ячейка будет переиспользована
    override func prepareForReuse() {
        filmImage.image = nil
    }
}
