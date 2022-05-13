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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        updateInterface()
    }
    
    private func setupAppearance() {
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .secondarySystemBackground
        
        navigationController?.navigationBar.tintColor = UIColor(red: 128/255, green: 212/255, blue: 63/255, alpha: 1)
        navigationItem.largeTitleDisplayMode = .never
    }
    
    func updateInterface() {
        titleFilmLabel.text = filmTitle ?? "Нет информации"
        lengthFilmLabel.text = filmLength ?? "Нет информации"
        countryLabel.text = country ?? "Нет информации"
        yearLabel.text = year ?? "Нет информации"
    }
    
    

}
