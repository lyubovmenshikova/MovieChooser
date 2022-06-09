//
//  GenreListViewController.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 10.04.2022.
//

import UIKit

//Протокол для вью контроллера
protocol GenreListViewInputProtocol: AnyObject {
    func reloadData(for section: GenreListSectionViewModel)
}

//Протокол для презентера
protocol GenreListViewOutputProtocol: AnyObject {
    init(view: GenreListViewInputProtocol)
    func viewDidLoad()
    func didTapCell(at indexPath: IndexPath)
}

class GenreListViewController: UITableViewController {
    
    private var section: SectionRowPresentable = GenreListSectionViewModel()

    var totalPage = 1
    var currentPage = 1
    var genre: String!
    var idNumber: String!
    
    private let configurator: GenreListConfiguratorInputProtocol = GenreListConfigurator()
    
    //обьявляем презентер
    var presenter: GenreListViewOutputProtocol!
    
    
    //вью для Loading текста и спиннера
    let loadingView = LoadingView()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.viewDidLoad()
        setupAppearance()
        setupNavigationBar()
        setupTableView()
        setupLoadingView()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? FilmDetailViewController else { return }
        
        let configurator: FilmDetailConfiguratorInputProtocol = FilmDetailConfigurator()
        configurator.configure(with: destinationVC, and: sender as! Item)
    }
    
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.section.rows.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if currentPage < totalPage && indexPath.row == films.count - 1 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "loading", for: indexPath) as! GenreListFooterCell
//            cell.activityIndicator.startAnimating()
//            return cell
//        } else {
            let viewModel = section.rows[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellIdentifier, for: indexPath) as! GenreListCell
            cell.viewModel = viewModel
            return cell
//        }
    }
    
    
//    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if currentPage < totalPage && indexPath.row == films.count - 1 {
//            currentPage += 1
////            dataFetcherService.fetchFilmsByGenre(for: idNumber, page: currentPage) { genreData in
////                guard let genreData = genreData else { return }
////                self.films.append(contentsOf: genreData.items)
////                self.totalPage = genreData.totalPages
////                DispatchQueue.main.async {
////                    self.tableView.reloadData()
////                }
////            }
//
//        }
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //обращаемя к презентеру и говорим что ячейка была тапнута
        presenter.didTapCell(at: indexPath)
    }
        
}

// MARK: - Extention
extension GenreListViewController {
   
    private func setupAppearance() {
        view.backgroundColor = .secondarySystemBackground
        title = self.genre
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes =  [.font : UIFont(name: "TrebuchetMS", size: 20) ?? "",.foregroundColor : UIColor(red: 176/255, green: 88/255, blue: 138/255, alpha: 1)]
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func setupTableView() {
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }
    
    private func setupLoadingView() {
        //устанавливаем loading текст и спиннер
        loadingView.setLoadingScreen(x: (self.tableView.frame.width / 2), y: (self.tableView.frame.height / 2) - (self.navigationController?.navigationBar.frame.height)!)
        tableView.addSubview(loadingView)
    }
}

// MARK: GenreListViewInputProtocol
extension GenreListViewController: GenreListViewInputProtocol {
    
    func reloadData(for section: GenreListSectionViewModel) {
        //наполняем секцию
        self.section = section
        tableView.reloadData()
    }
    
}
