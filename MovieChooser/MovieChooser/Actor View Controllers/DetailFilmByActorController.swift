//
//  DetailFilmByActorController.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 30.04.2022.
//

import UIKit

class DetailFilmByActorController: UIViewController {
    
    
    @IBOutlet var filmImage: UIImageView!
    @IBOutlet var filmTitleLabel: UILabel!
    @IBOutlet var lenghtLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    
    var dataFetcherService = DataFetcherService()
    var mainColor = UIColor(red: 17/255, green: 188/255, blue: 214/255, alpha: 1)
    var font = UIFont(name: "TrebuchetMS", size: 16)
    var id: Int?
    var imageURL: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        setupData()
    }
    
    private func setupAppearance() {
        view.backgroundColor = .secondarySystemBackground
        
        filmTitleLabel.textColor = mainColor
        filmTitleLabel.font = font
        
        lenghtLabel.textColor = mainColor
        lenghtLabel.font = font
        
        descriptionLabel.textColor = mainColor
        descriptionLabel.font = UIFont(name: "TrebuchetMS", size: 16)
        
        countryLabel.textColor = mainColor
        countryLabel.font = font
        
        yearLabel.textColor = mainColor
        yearLabel.font = font
    }
    
    private func setupData() {
        
        dataFetcherService.fetchActorFilms(for: id ?? 0) { filmsByActor in
            guard let filmsByActor = filmsByActor else { return }
            self.filmTitleLabel.text = filmsByActor.nameRu ?? "Нет информации"
            self.lenghtLabel.text = "\(filmsByActor.filmLength ?? 0) мин."
            self.descriptionLabel.text = filmsByActor.shortDescription ?? "Нет информации"
            self.countryLabel.text = filmsByActor.countries.first?.country ?? "Нет информации"
            self.yearLabel.text = "\(filmsByActor.year ?? 0)"

            let stringURL = filmsByActor.posterUrlPreview
            guard let imageURL = URL(string: stringURL),
                  let imageData = try? Data(contentsOf: imageURL) else { return }
            DispatchQueue.main.async {
                self.filmImage.image = UIImage(data: imageData)
            }
        }
    }
    
    
}
