//
//  Injector.swift
//  IMDb Movies App
//
//  Created by Admin on 01/05/21.
//

import Foundation

class Injector {
    
    static func provideMoviesViewModel() -> MoviesViewModel {
        return MoviesViewModel(dataSource: provideDataSource())
    }
    
    private static func provideDataSource() -> MovieDataSource {
        return MovieDataSourceImpl.shared
    }
}
