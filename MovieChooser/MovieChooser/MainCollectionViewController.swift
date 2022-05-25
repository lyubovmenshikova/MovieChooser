//
//  MainCollectionViewController.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 05.04.2022.
//

import UIKit


class MainCollectionViewController: UICollectionViewController {
    
    let mainButtons = MainButton.getButtons()

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        registerCell()
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toGenre":
            let _ = segue.destination as! GenreTableViewController
        case "toActor":
            let _ = segue.destination as! ActorSearchViewController
        case "toBest":
            let _ = segue.destination as! BestFilmsCollectionViewController
        case "toRandom":
            let _ = segue.destination as! RandomFilmViewController
        default:
            break
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainViewCell", for: indexPath) as! MainViewCell
        let mainButton = mainButtons[indexPath.item]
        cell.configureFirst(with: mainButton)
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            performSegue(withIdentifier: "toGenre", sender: nil)
        case 1:
            performSegue(withIdentifier: "toActor", sender: nil)
        case 2:
            performSegue(withIdentifier: "toBest", sender: nil)
        case 3:
            performSegue(withIdentifier: "toRandom", sender: nil)
        default: break
        }
    }
    
}

extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset: CGFloat = 10
        return UIEdgeInsets(top: inset, left: inset, bottom: 20, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 1.05, height: 120)
    }
}

extension MainCollectionViewController {
    
    //настройка внешнего вида контроллера
    private func setupAppearance() {
        navigationController?.navigationBar.largeTitleTextAttributes = [.font : UIFont(name: "ChalkboardSE-Bold", size: 35) ?? ""]
        navigationItem.title = "Movie Chooser"
        collectionView.backgroundColor = .secondarySystemBackground
        navigationItem.backButtonTitle = "Назад"
    }
    
    private func  registerCell() {
        let cellTypeNib = UINib(nibName: "MainViewCell", bundle: nil)
        collectionView.register(cellTypeNib, forCellWithReuseIdentifier: "MainViewCell")
    }
    
}


