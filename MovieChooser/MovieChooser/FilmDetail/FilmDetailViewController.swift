//
//  FilmDetailViewController.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 20.04.2022.
//

import UIKit

protocol FilmDetailViewInputProtocol: AnyObject {
    // метод параметры которого мы используем для передачи инфо в поля интерфейса
    func displayFilmTitle(with title: String)
    func displayFilmYear(with year: String)
    func displayImage(with imageData: Data)
}

protocol FilmDetailViewOutputProtocol: AnyObject {
    init(view: FilmDetailViewInputProtocol)
    func showDetails()
}

class FilmDetailViewController: UIViewController {
    
    
    @IBOutlet var filmTitleLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    
    //сильная ссылка на презентер потому что его создает вью контроллер, а он презентера на вью контрорллер уже безхозная ссылка
    var presenter: FilmDetailViewOutputProtocol!
    
    var mainColor = UIColor(red: 176/255, green: 88/255, blue: 138/255, alpha: 1)
    var font = UIFont(name: "TrebuchetMS", size: 17)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //при переходе на экран у презентера сразу запрашиваем информацию для экрана
        presenter.showDetails()
        setupAppearance()
    }
    
    private func setupAppearance() {
        view.backgroundColor = .secondarySystemBackground
        
        filmTitleLabel.textColor = mainColor
        filmTitleLabel.font = font
        
        yearLabel.textColor = mainColor
        yearLabel.font = font
    }
    
}

//MARK: FilmDetailViewInputProtocol
extension FilmDetailViewController: FilmDetailViewInputProtocol {
    
    func displayFilmTitle(with title: String) {
        filmTitleLabel.text = title
    }
    
    func displayFilmYear(with year: String) {
        yearLabel.text = year
    }
    
    func displayImage(with imageData: Data) {
        posterImage.image = UIImage(data: imageData)
    }
    
}
