//
//  ActorsListViewCell.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 26.04.2022.
//

import UIKit

class ActorsListViewCell: UITableViewCell {
    
    
    @IBOutlet var actorsListView: UIView!
    @IBOutlet var actorIcon: UIImageView!
    
    @IBOutlet var actorRuName: UILabel!
    @IBOutlet var actorEnName: UILabel!
    
    var mainColor = UIColor(red: 17/255, green: 188/255, blue: 214/255, alpha: 1)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCell()
    }
    
    private func setupCell () {
        
        actorRuName.textColor = mainColor
        actorRuName.font = UIFont(name: "TrebuchetMS", size: 18)
        
        actorEnName.textColor = mainColor
        actorEnName.font = UIFont(name: "TrebuchetMS", size: 18)
        
        actorsListView.layer.borderColor = mainColor.cgColor
        actorsListView.layer.borderWidth = 0.5
        actorsListView.layer.cornerRadius = 16
        actorIcon.layer.cornerRadius = 16
    }
    
    func configure(with actor: Actors ) {
        
        actorRuName.text = actor.nameRu
        actorEnName.text = actor.nameEn
        
        DispatchQueue.global().async {
            let stringURL = actor.posterUrl
            guard let imageURL = URL(string: stringURL),
                  let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                self.actorIcon.image = UIImage(data: imageData)
            }
        }
        
    }
    
    
}
