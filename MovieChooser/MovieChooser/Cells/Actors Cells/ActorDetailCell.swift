//
//  ActorDetailCell.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 28.04.2022.
//

import UIKit

class ActorDetailCell: UITableViewCell {
    
    @IBOutlet var actorDetailView: UIView!
    
    @IBOutlet var actorNameLabel: UILabel!
    @IBOutlet var sexLabel: UILabel!
    @IBOutlet var dateOfBirthLabel: UILabel!
    @IBOutlet var placeOfBirthLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    
    
    var mainColor = UIColor(red: 17/255, green: 188/255, blue: 214/255, alpha: 1)

    override func awakeFromNib() {
        super.awakeFromNib()
        setupNameLabel()
        setupSexLabel()
        setupDateOfBirthLabel()
        setupPlaceOfBirthLabel()
        setupAgeLabel()
        setupActorDetailView()
    }
    
    private func setupNameLabel() {
        actorNameLabel.textColor = mainColor
        actorNameLabel.font = UIFont(name: "TrebuchetMS", size: 15)
    }
 
    private func setupSexLabel() {
        sexLabel.textColor = mainColor
        sexLabel.font = UIFont(name: "TrebuchetMS", size: 16)
    }

    private func setupDateOfBirthLabel() {
        dateOfBirthLabel.textColor = mainColor
        dateOfBirthLabel.font = UIFont(name: "TrebuchetMS", size: 16)
    }
    
    private func setupPlaceOfBirthLabel() {
        placeOfBirthLabel.textColor = mainColor
        placeOfBirthLabel.font = UIFont(name: "TrebuchetMS", size: 13)
    }
    
    private func setupAgeLabel() {
        ageLabel.textColor = mainColor
        ageLabel.font = UIFont(name: "TrebuchetMS", size: 16)
    }
    
    private func setupActorDetailView() {
        actorDetailView.layer.borderColor = mainColor.cgColor
        actorDetailView.layer.borderWidth = 0.5
    }
    
    func configure(with actor: ActorIdData ) {
        
        actorNameLabel.text = "\(actor.nameRu ?? "") \r\n \(actor.nameEn ?? "")"
        dateOfBirthLabel.text = actor.birthday ?? ""
        placeOfBirthLabel.text = actor.birthplace ?? ""
        ageLabel.text = "\(actor.age ?? 0)"
        
        configureToRus(with: actor)
    }
    
    private func configureToRus(with actor: ActorIdData) {
        // вызов отдельной структуры для перевода данных о поле на русский язык
        if let actorData = ActorID(actorIdData: actor) {
            sexLabel.text = actorData.sexInRussian
        }
    }

}
