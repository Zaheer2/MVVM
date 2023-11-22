//
//  HomeTableViewCellViewModel.swift
//  MVVMSample
//
//  Created by Muhammad Zaheer on 22/11/2023.
//

import Foundation

class HomeTableViewCellViewModel {
    
    var id: Int
    var title: String
    var releaseDate: String
    var voteAverage: Double
    var voteCount: Int
    var name: String
    var firstAirDate: String
    
    
    init(movie: Movies) {
        self.id = movie.id
        self.title = movie.title
        self.releaseDate = movie.releaseDate
        self.voteAverage = movie.voteAverage
        self.voteCount = movie.voteCount
        self.name = movie.title
        self.firstAirDate = movie.releaseDate
    }
    
    
}
