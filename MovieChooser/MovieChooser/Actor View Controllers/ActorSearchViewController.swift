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

        searchTextField.delegate = self
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
            self.showAlertController(with: "Ошибка", message: "Заполните поле")
            return
        } else {
            performSegue(withIdentifier: "toActorFilm", sender: nil)
        }
    }
    

}

extension ActorSearchViewController {
    
    private func showAlertController(with title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "ОК", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? ActorListViewController else { return }
        destinationVC.actorName = searchTextField.text
    }
    
}

extension ActorSearchViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == " " { return true }
            if string.rangeOfCharacter(from: .letters) != nil || string == "" {
                return true
            }else {
                self.showAlertController(with: "Ошибка", message: "Пожалуйста введите текстовое значение")
                return false
            }
        
    }
}
