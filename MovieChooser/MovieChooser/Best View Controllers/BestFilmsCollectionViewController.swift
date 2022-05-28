//
//  BestFilmsCollectionViewController.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 05.05.2022.
//

import UIKit

class BestFilmsCollectionViewController: UICollectionViewController {
    
    var totalPage = 1
    var currentPage = 1
    
    var bestFilms = [Film]()
    var dataFetcherService = DataFetcherService()
    
    //вью для Loading текста и спиннера
    let loadingView = LoadingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getBestFilms()
        setupAppearance()
        setupNavigationBar()
        setupLoadingView()
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = collectionView.indexPathsForSelectedItems,
              let destinationVC = segue.destination as? DetailBestFilmController else { return }
        destinationVC.filmTitle = bestFilms[indexPath.first?.item ?? 0].nameRu
        destinationVC.filmLength = bestFilms[indexPath.first?.item ?? 0].filmLength
        destinationVC.country = bestFilms[indexPath.first?.item ?? 0].countries.first?.country
        destinationVC.year = bestFilms[indexPath.first?.item ?? 0].year
        destinationVC.imageURL = bestFilms[indexPath.first?.item ?? 0].posterUrl
    }
    
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bestFilms.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if currentPage < totalPage && indexPath.row == bestFilms.count - 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "loading", for: indexPath) as! BestFooterCell
            cell.activityIndicator.startAnimating()
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bestFilmCell", for: indexPath) as! BestFilmsCell
            let film = bestFilms[indexPath.item]
            cell.backgroundColor = .white
            cell.configure(with: film)
            
            cell.layer.borderColor = UIColor(red: 81/255, green: 163/255, blue: 18/255, alpha: 1).cgColor
            cell.layer.borderWidth = 1
            return cell
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if currentPage < totalPage && indexPath.row == bestFilms.count - 1 {
            currentPage += 1
            dataFetcherService.fetchBestFilms(for: currentPage) { bestFilmData in
                guard let bestFilmData = bestFilmData else { return }
                self.bestFilms.append(contentsOf: bestFilmData.films)
                self.totalPage = bestFilmData.pagesCount
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
}

// MARK: - DelegateFlowLayout
extension BestFilmsCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset: CGFloat = 15
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //колличество ячеек в ряд
        let itemsPerRow: CGFloat = 2
        //общая ширина расстояний между ячейками
        let paddingWidth = 15 * (itemsPerRow + 1)
        //доступная ширина для ячеек
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: self.collectionView.frame.size.height / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.gray.cgColor
        cell?.layer.borderWidth = 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor(red: 81/255, green: 163/255, blue: 18/255, alpha: 1).cgColor
        cell?.layer.borderWidth = 1
    }
    
}


// MARK: - Navigation
extension BestFilmsCollectionViewController{
    
    private func setupAppearance() {
        view.backgroundColor = .secondarySystemBackground
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .systemGroupedBackground
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = UIColor(red: 81/255, green: 163/255, blue: 18/255, alpha: 1)
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func setupLoadingView() {
        //устанавливаем loading текст и спиннер
        loadingView.setLoadingScreen(x: (self.collectionView.frame.width / 2), y: (self.collectionView.frame.height / 2) - (self.navigationController?.navigationBar.frame.height)!)
        collectionView.addSubview(loadingView)
    }
    
    private func getBestFilms() {
        dataFetcherService.fetchBestFilms(for: 1) { bestFilmData in
            guard let bestFilmData = bestFilmData else { return }
            self.bestFilms.append(contentsOf: bestFilmData.films)
            self.totalPage = bestFilmData.pagesCount
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.loadingView.removeLoadingScreen()
            }
        }
    }
}
