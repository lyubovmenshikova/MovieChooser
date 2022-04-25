//
//  ActorSearchViewController.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 22.04.2022.
//

import UIKit

class ActorSearchViewController: UIViewController {
    
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    
    var mainColor = UIColor(red: 17/255, green: 188/255, blue: 214/255, alpha: 1)
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.barStyle = .default
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupAppearance()
    }
    
    private func setupAppearance() {
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .secondarySystemBackground
        
        navigationController?.navigationBar.tintColor = mainColor
        
        searchButton.tintColor = mainColor
        searchButton.layer.borderColor = mainColor.cgColor
        searchButton.layer.borderWidth = 1
        searchButton.layer.cornerRadius = 10
        
        searchTextField.placeholder = "Введите имя актера"
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        guard let name = searchTextField.text else { return }
        if name.isEmpty {
            showAlertController(with: "Ошибка", message: "Заполните поле")
            return
        } else {
            performSegue(withIdentifier: "toActorFilm", sender: nil)
        }
    }
    
    private func showAlertController(with title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "ОК", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    

}
