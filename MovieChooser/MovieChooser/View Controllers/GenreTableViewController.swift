//
//  GenreTableViewController.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 09.04.2022.
//

import UIKit

class GenreTableViewController: UITableViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }

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
        navigationItem.backButtonTitle = "Назад"
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genres.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GenreViewCell", for: indexPath) as! GenreViewCell
        let genre = genres[indexPath.row]
        cell.genreLabel.text = genre
        cell.genreImageView.image = UIImage(named: genre)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.setSelected(false, animated: true)
    }

  
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let destinationVC = segue.destination as! GenreListViewController
        destinationVC.genre = genres[indexPath.row]
    }


}
