//
//  GenreListCell.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 13.04.2022.
//

import UIKit

protocol CellModelRepresentable {
    var viewModel: CellIdentifiable? { get set }
}


class GenreListCell: UITableViewCell, CellModelRepresentable {
    
    var viewModel: CellIdentifiable? {
        //как только ячейка будет инициализирована будем вызывать метод updateViews
        didSet {
            updateViews()
        }
    }
    
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
    
    func updateViews() {
        guard let cellViewModel = viewModel as? GenreListCellViewModel else { return }
        titleFilmLabel.text = cellViewModel.titleFilm
        ratingLabel.text = cellViewModel.rating
        yearFilmLabel.text = cellViewModel.year
        
        DispatchQueue.global().async {
            if let imageData = ImageManager.shared.fetchImageData(from: cellViewModel.imageURL) {
                DispatchQueue.main.async {
                    self.filmImage.image = UIImage(data: imageData)
                }
            }
        }
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
    
    
    //метод используется перед тем как ячейка будет переиспользована
    override func prepareForReuse() {
        filmImage.image = nil
    }
}
