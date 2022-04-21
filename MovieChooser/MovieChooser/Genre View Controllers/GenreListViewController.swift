//
//  GenreListViewController.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 10.04.2022.
//

import UIKit

class GenreListViewController: UITableViewController {
    
    var films = [Item]()
    var totalPage = 1
    var currentPage = 1
    
    var genre: String!
    var idNumber: String?
    
    //вью для Loading текста и спиннера
    let loadingView = LoadingView()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupAppearance()
        getFilms()
        
    }
    
    private func setupAppearance() {
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .secondarySystemBackground
        
        title = self.genre
        
        navigationController?.navigationBar.titleTextAttributes =  [.font : UIFont(name: "TrebuchetMS", size: 20) ?? "",.foregroundColor : UIColor(red: 176/255, green: 88/255, blue: 138/255, alpha: 1)]
        
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        //устанавливаем loading текст и спиннер
        loadingView.setLoadingScreen(x: (self.tableView.frame.width / 2), y: (self.tableView.frame.height / 2) - (self.navigationController?.navigationBar.frame.height)!)
        tableView.addSubview(loadingView)
    }
    
    private func getFilms() {
        if let idNumber = idNumber {
            NetworkGenresManager.shared.fetchCurrentFilms(for: idNumber, page: 1) { genreData in
                self.films.append(contentsOf: genreData.items)
                self.totalPage = genreData.totalPages
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.loadingView.removeLoadingScreen()
                }
            }
        }
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if currentPage < totalPage && indexPath.row == films.count - 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "loading", for: indexPath) as! GenreListFooterCell
            cell.activityIndicator.startAnimating()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GenreListCell", for: indexPath) as! GenreListCell
            let genre = films[indexPath.row]
            cell.configure(with: genre)
            return cell
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if currentPage < totalPage && indexPath.row == films.count - 1 {
            currentPage += 1
            NetworkGenresManager.shared.fetchCurrentFilms(for: idNumber ?? "", page: currentPage) { genreData in
                self.films.append(contentsOf: genreData.items)
                self.totalPage = genreData.totalPages
                print(self.films.count)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
       
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
        let destinationVC = segue.destination as? FilmDetailViewController else { return }
        destinationVC.filmTitle = films[indexPath.row].nameRu
        let countries = films[indexPath.row].countries
        destinationVC.filmYear = countries.first?.country
        destinationVC.imageURL = films[indexPath.row].posterUrlPreview
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.setSelected(false, animated: true)
    }
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
}
