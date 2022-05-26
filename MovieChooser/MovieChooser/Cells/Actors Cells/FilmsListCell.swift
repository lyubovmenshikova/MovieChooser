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
       setupFilmNameLabel()
        setupGenreLabel()
        setupYearLabel()
        setupRatingLabel()
        setupFilmsListView()
    }

    private func setupFilmNameLabel() {
        filmNameLabel.textColor = .black
        filmNameLabel.font = UIFont(name: "TrebuchetMS", size: 17)
    }
    
    private func setupGenreLabel() {
        genreLabel.textColor = mainColor
        genreLabel.font = UIFont(name: "TrebuchetMS", size: 15)
    }
    
    private func setupYearLabel() {
        yearLabel.textColor = mainColor
        yearLabel.font = UIFont(name: "TrebuchetMS", size: 15)
    }
    
    private func setupRatingLabel() {
        ratingLabel.backgroundColor = mainColor
        ratingLabel.layer.masksToBounds = true
        ratingLabel.layer.cornerRadius = 5
    }
    
    private func setupFilmsListView() {
        filmsListView.layer.borderColor = mainColor.cgColor
        filmsListView.layer.borderWidth = 0.5
        filmsListView.layer.cornerRadius = 16
    }
    
    func configure(with film: FilmsByActorData) {
        
        filmNameLabel.text =  film.nameRu ?? "Нет информации"
        ratingLabel.text = "\(film.ratingKinopoisk ?? 0)"
        genreLabel.text = film.genres.first?.genre ?? "Нет информации"
        yearLabel.text = "\(film.year ?? 0)"
        
        fetchImage(with: film)
    }
    
    private func fetchImage(with film: FilmsByActorData) {
        DispatchQueue.global().async {
            let stringURL = film.posterUrlPreview
            guard let imageURL = URL(string: stringURL),
                  let imageData = try? Data(contentsOf: imageURL) else { return }

            DispatchQueue.main.async {
                self.filmIconImage.image = UIImage(data: imageData)
            }
        }
    }
    
    override func prepareForReuse() {
        filmIconImage.image = nil
    }

}
