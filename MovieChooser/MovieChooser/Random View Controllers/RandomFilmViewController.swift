//
//  RandomFilmViewController.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 14.05.2022.
//

import UIKit

class RandomFilmViewController: UIViewController {
    
    var mainColor = UIColor(red: 208/255, green: 224/255, blue: 56/255, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
    }
    
    private func setupAppearance() {
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .secondarySystemBackground
        
        navigationController?.navigationBar.tintColor = mainColor
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