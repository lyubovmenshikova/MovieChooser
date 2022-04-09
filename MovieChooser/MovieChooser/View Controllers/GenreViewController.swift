//
//  GenreViewController.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 07.04.2022.
//

import UIKit

class GenreViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    
    @IBOutlet var ganreTextField: UITextField!
    
    var pickerView = UIPickerView()
    var genres = ["Комедия", "Драма", "Боевик", "Приключения", "Мелодрама", "Детектив", "Фантастика", "Ужасы", "Семейный", "Мультфильм", "Триллер", "Военный", "Криминал", "Мюзикл", "Документальный", "История"]
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.barStyle = .default
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .secondarySystemBackground
        navigationController?.navigationBar.tintColor = UIColor(red: 176/255, green: 88/255, blue: 138/255, alpha: 1)
        navigationItem.largeTitleDisplayMode = .never
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        ganreTextField.inputView = pickerView
        ganreTextField.textAlignment = .center
    }
    
    
    


}

extension GenreViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        genres.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        genres[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ganreTextField.text = genres[row]
        ganreTextField.resignFirstResponder()

    }
    
    
}
