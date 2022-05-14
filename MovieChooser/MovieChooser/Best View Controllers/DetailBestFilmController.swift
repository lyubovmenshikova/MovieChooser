//
//  DetailBestFilmController.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 13.05.2022.
//

import UIKit

class DetailBestFilmController: UIViewController {
    
    @IBOutlet var titleFilmLabel: UILabel!
    @IBOutlet var lengthFilmLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var iconFilmImage: UIImageView!
    
    var filmTitle: String?
    var filmLength: String?
    var country: String?
    var year: String?
    var imageURL: String?
    
    var mainColor = UIColor(red: 81/255, green: 163/255, blue: 18/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        updateInterface()
    }
    
    private func setupAppearance() {
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .secondarySystemBackground
        
        navigationController?.navigationBar.tintColor = mainColor
        navigationItem.largeTitleDisplayMode = .never
        
        setupColor(with: mainColor)
    }
    
    func updateInterface() {
        titleFilmLabel.text = filmTitle ?? "Нет информации"
        lengthFilmLabel.text = filmLength ?? "Нет информации"
        countryLabel.text = country ?? "Нет информации"
        yearLabel.text = year ?? "Нет информации"
        
        DispatchQueue.global().async {
            guard let stringURL = self.imageURL,
                  let imageURL = URL(string: stringURL),
                  let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                self.iconFilmImage.image = UIImage(data: imageData)
            }
        }
    }
    
    private func setupColor(with color: UIColor) {
        titleFilmLabel.textColor = color
        lengthFilmLabel.textColor = color
        countryLabel.textColor = color
        yearLabel.textColor = color
    }
    
    

}
