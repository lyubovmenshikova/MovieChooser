//
//  BestFilmsCell.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 05.05.2022.
//

import UIKit

class BestFilmsCell: UICollectionViewCell {
    
    @IBOutlet var bestFilmIcon: UIImageView!
    @IBOutlet var titleBestFilm: UILabel!
    
    
    func configure(with bestFilm: Film ) {
        titleBestFilm.text = bestFilm.nameRu
        
        DispatchQueue.global().async {
            let stringURL = bestFilm.posterUrl
            guard let imageURL = URL(string: stringURL),
                  let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                self.bestFilmIcon.image = UIImage(data: imageData)
            }
        }
    }
    
    //метод используется перед тем как ячейка будет переиспользована
    override func prepareForReuse() {
        super.prepareForReuse()
        bestFilmIcon.image = nil
    }
}
