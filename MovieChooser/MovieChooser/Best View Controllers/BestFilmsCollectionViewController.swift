//
//  BestFilmsCollectionViewController.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 05.05.2022.
//

import UIKit

private let reuseIdentifier = "bestFilmCell"

class BestFilmsCollectionViewController: UICollectionViewController {
    
    var totalPage = 1
    var currentPage = 1
    
    var bestFilms = [Film]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getBestFilms()
        setupAppearance()
    }
    
    private func getBestFilms() {
        NetworkBestFilmsManager.shared.fetchBestFilms(for: 1) { bestFilmData in
            self.bestFilms.append(contentsOf: bestFilmData.films)
            self.totalPage = bestFilmData.pagesCount
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                //self.loadingView.removeLoadingScreen()
            }
        }
        
    }
    
    private func setupAppearance() {
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .secondarySystemBackground
        
        //        navigationController?.navigationBar.titleTextAttributes =  [.font : UIFont(name: "TrebuchetMS", size: 20) ?? "",.foregroundColor : UIColor(red: 176/255, green: 88/255, blue: 138/255, alpha: 1)]
        
        collectionView.showsVerticalScrollIndicator = false
        
        //устанавливаем loading текст и спиннер
        //        loadingView.setLoadingScreen(x: (self.tableView.frame.width / 2), y: (self.tableView.frame.height / 2) - (self.navigationController?.navigationBar.frame.height)!)
        //        tableView.addSubview(loadingView)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bestFilms.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bestFilmCell", for: indexPath) as! BestFilmsCell
        let film = bestFilms[indexPath.item]
        cell.configure(with: film)
        
        return cell
    }
    
}

extension BestFilmsCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset: CGFloat = 10
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 1.5, height: 100)
    }
}
