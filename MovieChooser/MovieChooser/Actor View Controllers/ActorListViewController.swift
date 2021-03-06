//
//  ActorListViewController.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 25.04.2022.
//

import UIKit

class ActorListViewController: UITableViewController {
    
    var actorName: String?
    var actors = [Actors]()
    let loadingView = LoadingView()
    var dataFetcherService = DataFetcherService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        setupNavigationBar()
        setupTableView()
        setLoadingView()
        getActors()
    }
        
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actors.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActorsListViewCell", for: indexPath) as! ActorsListViewCell
        let actor = actors[indexPath.row]
        cell.configure(with: actor)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.setSelected(false, animated: true)
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
              let destinationVC = segue.destination as? ActorFilmsViewController else { return }
        destinationVC.idForActor = actors[indexPath.row].kinopoiskId
    }

    
}

// MARK: - Extension
extension ActorListViewController {
    
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
    
    
    private func getActors() {
        if let actorName = actorName {
            dataFetcherService.fetchActorsByName(for: actorName) { actorsData in
                guard let actorsData = actorsData else { return }
                self.actors.append(contentsOf: actorsData.items)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.loadingView.removeLoadingScreen()
                }
            }
        }
    }

}
