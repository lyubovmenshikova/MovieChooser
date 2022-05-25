//
//  MainViewCell.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 06.04.2022.
//

import UIKit

class MainViewCell: UICollectionViewCell {
    
    
    @IBOutlet var iconCell: UIImageView!
    @IBOutlet var labelCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    private func setupCell() {
        layer.cornerRadius = 15
        iconCell.backgroundColor = UIColor(red: 240/255, green: 243/255, blue: 245/255, alpha: 1)
        setupLabelCell()
    }
    
    private func setupLabelCell() {
        labelCell.textColor = .white
        labelCell.font = UIFont(name: "TrebuchetMS", size: 25)
    }
    
    func configureFirst(with mainButton: MainButton) {
        labelCell.text = mainButton.title
        iconCell.image = mainButton.image
        backgroundColor = mainButton.backgroundColor
    }
 
}
