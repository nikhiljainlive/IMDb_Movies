//
//  MovieDataSource.swift
//  IMDb Movies App
//
//  Created by Admin on 01/05/21.
//

import Foundation

protocol MovieDataSource {
    func getAllMovies() -> [Movie]
}

class MovieDataSourceImpl : MovieDataSource {
    private init() {}

    static let shared : MovieDataSource = MovieDataSourceImpl()
    
    private lazy var movies : [Movie] = {
        let jsonDecoder = JSONDecoder()
        guard let url = Bundle.main.url(forResource: "movies", withExtension: "json"), let data = try? Data(contentsOf: url), let array = try? jsonDecoder.decode(Array<Movie>.self, from: data)
        else {
            return []
        }
        
        return array
    }()
    
    func getAllMovies() -> [Movie] {
        return movies
    }
}
