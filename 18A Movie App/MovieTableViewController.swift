//
//  MovieTableViewController.swift
//  18A Movie App
//
//  Created by Joe Moss on 6/15/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {

// Create typealias
    typealias JSONDictionary = [String:AnyObject]
    typealias JSONArray = [JSONDictionary]
    
    // Create an Array of Movies
    var moviesArray = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK - Load the json file into an nsurl
        
        if let filePath = NSBundle.mainBundle().URLForResource("popular", withExtension: "json") {
            
            // MARK - Create the NSURL to NSData
            
            if let data = NSData(contentsOfURL: filePath)
            {
                
                do
                {
                    
                    // LEVEL 1
                    if let jsonDict = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? JSONDictionary
                    {
                        
                        // LEVEL 2
                        if let resultsArray = jsonDict["results"] as? JSONArray
                        {
                            
                            // Level 2
                            for resultsDict in resultsArray {
                                
                                let theMovie = Movie()
                            
                                if let posterPath = resultsDict["poster_path"] as? String {
                                    
                                    theMovie.posterPath = posterPath
                                } else {
                                    print("I couldnt parse the PosterPath")
                                }
                                
                                if let adult = resultsDict["adult"] as? Bool {
                                    
                                    theMovie.adult = adult
                                } else {
                                    print("I couldnt parse adult")
                                }
                                
                                if let overview = resultsDict["overview"] as? String {
                                    
                                    theMovie.overview = overview
                                } else {
                                    print("I couldnt parse the overview")
                                }

                                if let releaseDate = resultsDict["release_date"] as? String {
                                    
                                    theMovie.releaseDate = releaseDate
                                } else {
                                    print("I couldnt parse the ReleaseDate")
                                }
                                
                                if let movieId = resultsDict["id"] as? Int {
                                    
                                    theMovie.movieId = movieId
                                } else {
                                    print("I couldnt parse the movieId")
                                }
                                
                                if let originalTitle = resultsDict["original_title"] as? String {
                                    
                                    theMovie.originalTitle = originalTitle
                                } else {
                                    print("I couldnt parse the originalTitle")
                                }
                                
                                if let originalLanguage = resultsDict["original_language"] as? String {
                                    
                                    theMovie.originalLanguage = originalLanguage
                                } else {
                                    print("I couldnt parse the originalLanguage")
                                }
                                
                                if let title = resultsDict["title"] as? String {
                                    
                                    theMovie.title = title
                                } else {
                                    print("I couldnt parse the title")
                                }
                                
                                if let backdropPath = resultsDict["backdrop_path"] as? String {
                                    
                                    theMovie.backdropPath = backdropPath
                                } else {
                                    print("I couldnt parse the backdropPath")
                                }
                                
                                if let popularity = resultsDict["popularity"] as? Double {
                                    
                                    theMovie.popularity = popularity
                                } else {
                                    print("I couldnt parse the popularity")
                                }
                                
                                if let voteCount = resultsDict["vote_count"] as? Int {
                                    
                                    theMovie.voteCount = voteCount
                                } else {
                                    print("I couldnt parse the voteCount")
                                }
                                
                                if let video = resultsDict["video"] as? Bool {
                                    
                                    theMovie.video = video
                                } else {
                                    print("I couldnt parse the video")
                                }
                                
                                if let voteAverage = resultsDict["vote_average"] as? Double {
                                    
                                    theMovie.voteAverage = voteAverage
                                } else {
                                    print("I couldnt parse the voteAverage")
                                }
                               
                                self.moviesArray.append(theMovie)
                            }
                            
                        }
                        
                    }
                    
                } catch {
                    print("I can't parse the json data")
                }
                
            }
            
        }
        
        print(moviesArray.count)
        
        for theMovie in moviesArray {
            
            print(theMovie.title)
            
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    
        return 1
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.moviesArray.count
        
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MovieTableViewCell
        
        let movieTitle = self.moviesArray[indexPath.row]
        
        cell.titleLabel.text = movieTitle.title
        
        cell.posterImageView.image = UIImage(named: movieTitle.posterPath)

        return cell
        
    }

}