//
//  Movie.swift
//  18A Movie App
//
//  Created by Joe Moss on 6/15/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import Foundation

class Movie {
    
    // Create variables
    var posterPath: String = ""
    var adult: Bool = false
    var overview: String = ""
    var releaseDate: String = ""
    var movieId: Int = 0
    var originalTitle: String = ""
    var originalLanguage: String = ""
    var title: String = ""
    var backdropPath: String = ""
    var popularity: Double = 0
    var voteCount: Int = 0
    var video: Bool = false
    var voteAverage: Double = 0
    
    init() {
        self.posterPath = ""
        self.adult = false
        self.overview = ""
        self.releaseDate = ""
        self.movieId = 0
        self.originalTitle = ""
        self.originalLanguage = ""
        self.title = ""
        self.backdropPath = ""
        self.popularity = 0
        self.voteCount = 0
        self.video = false
        self.voteAverage = 0

    }

}


