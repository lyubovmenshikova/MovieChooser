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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


}
