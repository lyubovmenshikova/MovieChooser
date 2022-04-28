//
//  ActorFilmsViewController.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 27.04.2022.
//

import UIKit

class ActorFilmsViewController: UITableViewController {
    
    var idForActor: Int?
    var films = [Films]()
    var actorData: ActorIdData!
    let loadingView = LoadingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        getFilms()
    }
    
    private func setupAppearance() {
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .secondarySystemBackground
        
        
        navigationController?.navigationBar.titleTextAttributes =  [.font : UIFont(name: "TrebuchetMS", size: 20) ?? "",.foregroundColor : UIColor(red: 17/255, green: 188/255, blue: 214/255, alpha: 1)]
        
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        loadingView.setLoadingScreen(x: (self.tableView.frame.width / 2), y: (self.tableView.frame.height / 2) - (self.navigationController?.navigationBar.frame.height)!)
        tableView.addSubview(loadingView)
    }
    
    private func getFilms() {
        if let idForActor = idForActor {
            NetworkActorForIDManager.shared.fetchActor(for: idForActor) { actorIdData in
                self.actorData = actorIdData
                self.films.append(contentsOf: actorIdData.films)
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
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActorDetailCell", for: indexPath) as! ActorDetailCell
            cell.configure(with: actorData)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FilmsListCell", for: indexPath) as! FilmsListCell
            let film = films[indexPath.row]
            cell.configure(with: film)
            return cell
        }
    
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 240
        } else {
            return 140
        }
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
