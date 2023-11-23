//
//  DetailsViewModel.swift
//  MVVMSample
//
//  Created by Muhammad Zaheer on 23/11/2023.
//

import Foundation
import UIKit

class DetailsViewModel {
    
    var movie: Movies
    
    var id : Int
    var Image: UIImage
    var title: String
    var details: String
    
    
    init(_ movie: Movies) {
        self.movie = movie
        
        self.id = movie.id
        self.Image = #imageLiteral(resourceName: "movieImage")
        self.title = movie.title
        self.details = movie.title
    }
}
