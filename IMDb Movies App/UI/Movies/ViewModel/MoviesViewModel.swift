//
//  MoviesViewModel.swift
//  IMDb Movies App
//
//  Created by Admin on 01/05/21.
//

import Foundation

class MoviesViewModel {
    private let dataSource : MovieDataSource
    
    init(dataSource : MovieDataSource) {
        self.dataSource = dataSource
    }
    
    func getMovies() -> [Movie] {
        return dataSource.getAllMovies()
    }
}
