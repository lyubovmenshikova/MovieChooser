//
//  RandomFilmViewController.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 14.05.2022.
//

import UIKit

class RandomFilmViewController: UIViewController {
    
    @IBOutlet var filmImageView: UIImageView!
    @IBOutlet var filmTitleLabel: UILabel!
    @IBOutlet var generationButton: UIButton!
    @IBOutlet var ratingLabel: UILabel!
    
    var mainColor = UIColor(red: 208/255, green: 224/255, blue: 56/255, alpha: 1)
    var randomFilms = [Items]()
    var dataFetcherService = DataFetcherService()
    var totalPages = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
        setupNavigationBar()
        setupGenerationButton()
        setupFilmLabel()
        setupRatingLabel()
        getRandomPage()
    }
    
    private func getRandomPage() {
        dataFetcherService.fetchRandomFilm(for: 1) { randomFilmData in
            guard let randomFilmData = randomFilmData else { return }
            self.totalPages = randomFilmData.pagesCount
            self.getRandomFilm()
        }
    }
    
    private func getRandomFilm() {
        let randomPage = Int.random(in: 1...totalPages)
        dataFetcherService.fetchRandomFilm(for: randomPage) { randomFilmData in
            guard let randomFilmData = randomFilmData else { return }
            self.randomFilms.append(contentsOf: randomFilmData.films)
            DispatchQueue.main.async {
                self.updateInterface()
            }
        }
    }
    
    private func updateInterface() {
        let randomElement = randomFilms.randomElement()
        filmTitleLabel.text = randomElement?.nameRu
        ratingLabel.text = randomElement?.rating
        
        fetchImage(randomElement: randomElement)
    }
    
    private func fetchImage(randomElement: Items?) {
        DispatchQueue.global().async {
            guard let stringURL = randomElement?.posterUrl,
                  let imageURL = URL(string: stringURL),
                  let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                self.filmImageView.image = UIImage(data: imageData)
            }
        }
    }
    
    @IBAction func generationButtonPressed(_ sender: Any) {
        getRandomFilm()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - Extension
extension RandomFilmViewController{
    
    private func setupAppearance() {
        view.backgroundColor = .secondarySystemBackground
    }
    
    private func setupNavigationBar() {
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.tintColor = mainColor
    }
    
    private func setupGenerationButton() {
        generationButton.backgroundColor = mainColor
        generationButton.tintColor = .white
        generationButton.layer.cornerRadius = 10
    }
    
    private func setupFilmLabel() {
        filmTitleLabel.font = UIFont(name: "TrebuchetMS", size: 19)
    }
    
    private func setupRatingLabel() {
        ratingLabel.backgroundColor = mainColor
        ratingLabel.layer.masksToBounds = true
        ratingLabel.layer.cornerRadius = 5
        ratingLabel.font = UIFont(name: "TrebuchetMS", size: 17)
    }
    
}
