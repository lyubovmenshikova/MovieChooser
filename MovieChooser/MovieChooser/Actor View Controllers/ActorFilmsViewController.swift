//
//  ActorFilmsViewController.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 27.04.2022.
//

import UIKit

class ActorFilmsViewController: UITableViewController {
    
    var idForActor: Int!
    var films = [Films]()
    var actorData: ActorIdData!
    let loadingView = LoadingView()
    var dataFetcherService = DataFetcherService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        setupNavigationBar()
        setupTableView()
        setLoadingView()
        getFilms()
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActorDetailCell", for: indexPath) as! ActorDetailCell
            cell.configure(with: actorData)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FilmsListCell", for: indexPath) as! FilmsListCell
            
            let film = films[indexPath.row]
            let id = film.filmId
            
            dataFetcherService.fetchActorFilms(for: id) { filmsByActor in
                guard let filmsByActor = filmsByActor else { return }
                cell.configure(with: filmsByActor)
            }
            return cell
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 260
        } else {
            return 140
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.setSelected(false, animated: true)
    }
    
    
    
     // MARK: - Navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         guard let indexPath = tableView.indexPathForSelectedRow,
               let destinationVC = segue.destination as? DetailFilmByActorController else { return }
         destinationVC.id = films[indexPath.row].filmId
     }
    
}

extension ActorFilmsViewController{
    
    private func setupAppearance() {
        view.backgroundColor = .secondarySystemBackground
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes =  [.font : UIFont(name: "TrebuchetMS", size: 20) ?? "",.foregroundColor : UIColor(red: 17/255, green: 188/255, blue: 214/255, alpha: 1)]
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func setupTableView() {
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }
    
    private func setLoadingView() {
        loadingView.setLoadingScreen(x: (self.tableView.frame.width / 2), y: (self.tableView.frame.height / 2) - (self.navigationController?.navigationBar.frame.height)!)
        tableView.addSubview(loadingView)
    }
    
    private func getFilms() {
        dataFetcherService.fetchActorInfoByID(for: idForActor) { actorIdData in
            guard let actorIdData = actorIdData else { return }
            self.actorData = actorIdData
            self.films.append(contentsOf: actorIdData.films)
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.loadingView.removeLoadingScreen()
                }
            }
    }
}
