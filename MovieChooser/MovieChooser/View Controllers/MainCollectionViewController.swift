//
//  MainCollectionViewController.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 05.04.2022.
//

import UIKit


class MainCollectionViewController: UICollectionViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.barStyle = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setNeedsStatusBarAppearanceUpdate()
        setupAppearance()
        
        let cellTypeNib = UINib(nibName: "MainViewCell", bundle: nil)
        collectionView.register(cellTypeNib, forCellWithReuseIdentifier: "MainViewCell")
    }
    
    //настройка внешнего вида контроллера
    private func setupAppearance() {
        navigationController?.navigationBar.largeTitleTextAttributes = [.font : UIFont(name: "ChalkboardSE-Bold", size: 35) ?? "",.foregroundColor : UIColor.white]
        navigationItem.title = "Movie Chooser"
        collectionView.backgroundView = UIImageView(image: UIImage(named: "1"))
        navigationItem.backButtonTitle = "Назад"
    }
    
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGenre" {
            guard let destinationVC = segue.destination as? GenreTableViewController else { return }
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainViewCell", for: indexPath) as! MainViewCell
        
        switch indexPath.item {
        case 0:
            cell.iconCell.image = UIImage(systemName: "theatermasks")
            cell.backgroundView = UIImageView(image: UIImage(named: "222"))
            cell.labelCell.text = "Выбрать фильм по жанру"
            cell.labelCell.textColor = .white
            cell.labelCell.font = UIFont(name: "TrebuchetMS", size: 25)
        case 1:
            cell.iconCell.image = UIImage(systemName: "person")
            cell.backgroundView = UIImageView(image: UIImage(named: "33"))
            cell.labelCell.text = "Выбрать фильм по актеру"
            cell.labelCell.textColor = .white
            cell.labelCell.font = UIFont(name: "TrebuchetMS", size: 25)
            return cell
        case 2:
            cell.iconCell.image = UIImage(systemName: "star")
            cell.backgroundView = UIImageView(image: UIImage(named: "4"))
            cell.labelCell.text = "Новинки"
            cell.labelCell.textColor = .white
            cell.labelCell.font = UIFont(name: "TrebuchetMS", size: 25)
            return cell
        case 3:
            cell.iconCell.image = UIImage(systemName: "dice")
            cell.backgroundView = UIImageView(image: UIImage(named: "5"))
            cell.labelCell.text = "Случайный фильм"
            cell.labelCell.textColor = .white
            cell.labelCell.font = UIFont(name: "TrebuchetMS", size: 25)
        default: return cell
        }
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            performSegue(withIdentifier: "toGenre", sender: nil)
        default: break
        }
    }
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}

extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset: CGFloat = 10
        return UIEdgeInsets(top: 10, left: inset, bottom: 10, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 1.1, height: 120)
    }
}


