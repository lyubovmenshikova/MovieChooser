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
    
    
    //декордируем JSON данные в конкретную модель
    func fetchFilmsByGenre (for idNumber: String, page: Int, completion: @escaping (GenresData<[Item]>?) -> Void) {
        let urlFilmByGenre = "https://kinopoiskapiunofficial.tech/api/v2.2/films?genres=\(idNumber)&order=NUM_VOTE&type=FILM&ratingFrom=8&ratingTo=10&yearFrom=1970&yearTo=3000&page=\(page)"
        dataFetcher.fetchGenericJSONData(urlString: urlFilmByGenre, response: completion)
    }
    
    func fetchActorsByName (for name: String, completion: @escaping (ActorsData<[Actors]>?) -> Void) {
        //кодируем параметр если придет русское слово
        guard let nameCode = name.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        let urlActorsByName = "https://kinopoiskapiunofficial.tech/api/v1/persons?name=\(nameCode)&page=1"
        dataFetcher.fetchGenericJSONData(urlString: urlActorsByName, response: completion)
    }
    
    func fetchActorInfoByID (for id: Int, completion: @escaping (ActorIdData?) -> Void) {
        let urlActorByID = "https://kinopoiskapiunofficial.tech/api/v1/staff/\(id)"
        dataFetcher.fetchGenericJSONData(urlString: urlActorByID, response: completion)
    }
    
    func fetchActorFilms (for id: Int, completion: @escaping (FilmsByActorData?) -> Void) {
        let urlActorFilms = "https://kinopoiskapiunofficial.tech/api/v2.2/films/\(id)"
        dataFetcher.fetchGenericJSONData(urlString: urlActorFilms, response: completion)
    }
    
    func fetchBestFilms (for page: Int, completion: @escaping (BestFilmData?) -> Void) {
        let urlBestFilm = "https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_100_POPULAR_FILMS&page=\(page)"
        dataFetcher.fetchGenericJSONData(urlString: urlBestFilm, response: completion) 
    }
    
    func fetchRandomFilm (for page: Int, completion: @escaping (RandomFilmData?) -> Void) {
        let urlRandomFilm = "https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_250_BEST_FILMS&page=\(page)"
        dataFetcher.fetchGenericJSONData(urlString: urlRandomFilm, response: completion)
    }
    
    
}
