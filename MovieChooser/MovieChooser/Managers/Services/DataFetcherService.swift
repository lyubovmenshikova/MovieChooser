//
//  DataFetcherService.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 18.05.2022.
//

import Foundation

//класс отвечающий за конкретные запросы данных для вью контроллеров 
class DataFetcherService {
    
    var dataFetcher: DataFetcher
    
    init(dataFetcher: DataFetcher = NetworkDataFetcher()){
        self.dataFetcher = dataFetcher
    }
    
    //декордируем полученные JSON данные в конкретную модель
    func fetchBestFilm (for page: Int, completion: @escaping (BestFilmData?) -> Void) {
        let urlBestFilm = "https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_100_POPULAR_FILMS&page=\(page)"
        dataFetcher.fetchGenericJSONData(urlString: urlBestFilm, response: completion) 
    }
}
